package com.demo.controller;

import com.demo.entity.Noise;
import com.demo.entity.ReceiveNoise;
import com.demo.service.NoiseMgr;
import com.demo.service.ReceiveNoiseMgr;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/upload")
public class UploadController {
    @ResponseBody
    @RequestMapping(value = "/audio",method = RequestMethod.POST)
    public Map audio(HttpServletRequest request, HttpServletResponse response) throws Exception{
        System.out.println("dsaf");
        //创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //System.out.println(request);
        //判断request是否有文件需要上传
        if(multipartResolver.isMultipart(request)){
            //System.out.println("ok");
            //转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;

            List<MultipartFile> fileList = multiRequest.getFiles("file");
            for (MultipartFile mf : fileList) {
                if(!mf.isEmpty()){
                    //取得当前上传文件的名称
                    String myFileName = mf.getOriginalFilename();
                    //如果名称不为""，说明该文件存在，否则说明文件不存在。
                    if(myFileName.trim()!=""){
                        System.out.println(myFileName);
                        //重命名上传后的文件
                        String filename = mf.getOriginalFilename();
                        //定义上传路劲
                        //String path = "E:/团队项目后端代码/test1/src/main/webapp/audio/"+filename;
                        String path = "C:/audio/"+filename;
                        File localFile = new File(path);
                        mf.transferTo(localFile);
                        NoiseMgr noiseMgr = new NoiseMgr();
                        noiseMgr.AddNoise("audio/"+filename);
                    }
                }
            }
            Map resultJson = new HashMap();
            resultJson.put("code","ok");
            return resultJson;
        }else{
            Map resultJson = new HashMap();
            resultJson.put("code","no");
            return resultJson;
        }
    }
    @RequestMapping(value = "download")
    public void download(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html;charset=utf-8");
        //获取文件名
        String filename = request.getParameter("filename");
        //String folder="E:/团队项目后端代码/test1/src/main/webapp/";
        String folder="C:/";
        //通知浏览器以下载的方式打开
        response.addHeader("Content-Type","application/octet-stream");
        response.addHeader("Content-Disposition","attachment;filename="+filename);
        //System.out.println(folder+filename);
        //通过文件输入流读取文件
        //InputStream in = request.getServletContext().getResourceAsStream(folder+filename);
        File srcFile = new File(folder+filename);
        InputStream in = new FileInputStream(srcFile);
        OutputStream out=response.getOutputStream();
        System.out.println(folder+filename);
        byte[] bytes=new byte[1024];
        int len=0;
        while ((len=in.read(bytes))!=-1){
            out.write(bytes,0,len);
        }
    }
    @ResponseBody
    @RequestMapping(value = "/androidAudio",method = RequestMethod.POST)
    public Map androidAudio(HttpServletRequest request, HttpServletResponse response) throws Exception{
        System.out.println("dsaf");
        String client_receivenoise_applicantID = request.getParameter("client_receivenoise_applicantID");
        String client_receivenoise_receiverID = request.getParameter("client_receivenoise_receiverID");
        String client_receivenoise_ID = client_receivenoise_applicantID+'_'+client_receivenoise_receiverID;
        //System.out.println(client_receivenoise_applicantID+" "+client_receivenoise_receiverID);
        if(client_receivenoise_applicantID == null || client_receivenoise_receiverID == null) {
            Map error = new HashMap();
            error.put("error","error");
            return error;
        }
        String dopath = "C:/android/"+client_receivenoise_ID+".3gp";
        System.out.println(dopath);
        File file = new File(dopath);
        DataOutputStream dos = new DataOutputStream(new FileOutputStream(file));
        boolean isOk = file.exists();
        if(isOk){
            dos.close();
            System.out.println("exist");
            boolean a=file.delete();
            System.out.println("delete complete"+a);
            if(a == false){
                System.gc();
                boolean b = file.delete();
                System.out.println(b);
            }

        }
        //创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        //System.out.println(request);
        //判断request是否有文件需要上传
        if(multipartResolver.isMultipart(request)){
            //System.out.println("ok");
            //转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)request;

            List<MultipartFile> fileList = multiRequest.getFiles("file");
            for (MultipartFile mf : fileList) {
                if(!mf.isEmpty()){
                    //取得当前上传文件的名称
                    String myFileName = mf.getOriginalFilename();
                    //如果名称不为""，说明该文件存在，否则说明文件不存在。
                    if(myFileName.trim()!=""){
                        System.out.println(myFileName);
                        //重命名上传后的文件
                        String filename = client_receivenoise_ID+".3gp";
                        //定义上传路劲
                        //String path = "E:/团队项目后端代码/test1/src/main/webapp/audio/"+filename;
                        String path = "C:/android/"+filename;
                        File localFile = new File(path);
                        mf.transferTo(localFile);
                        String client_receivenoise_noiseReceivePath = "android/"+filename;
                        ReceiveNoise receiveNoise = new ReceiveNoise(client_receivenoise_applicantID,client_receivenoise_receiverID,
                                client_receivenoise_noiseReceivePath,client_receivenoise_ID);
                        ReceiveNoiseMgr receiveNoiseMgr = new ReceiveNoiseMgr();
                        int result = receiveNoiseMgr.AddReceiveNoise(receiveNoise,client_receivenoise_ID);
                        //NoiseMgr noiseMgr = new NoiseMgr();
                        //noiseMgr.AddNoise("android/"+filename);
                    }
                }
            }
            Map resultJson = new HashMap();
            resultJson.put("code","ok");
            return resultJson;
        }else{
            Map resultJson = new HashMap();
            resultJson.put("code","no");
            return resultJson;
        }
    }
}
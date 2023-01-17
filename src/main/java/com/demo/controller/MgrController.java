package com.demo.controller;

import com.demo.entity.*;
import com.demo.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

import static java.lang.Integer.parseInt;


@Controller
public class MgrController {
    //管理人跳转
    @RequestMapping(path = "userchange")
    @ResponseBody
    public String userchange(User user) throws Exception {
        //System.out.println(user.getPassword());
        UserMgr userMgr =new UserMgr();
        int result=userMgr.addUser(user);
        if(result == 1){
            return "1";
        }
        else {
            return "0";
        }
    }
    //管理人删除
    @RequestMapping(path = "userdelete")
    @ResponseBody
    public String userdelete(HttpServletRequest request) throws Exception {
        //System.out.println("hhh");
        String[] username=request.getParameterValues("username");
        //System.out.println(username[1]);
        UserMgr userMgr = new UserMgr();
        int result = 0;
        int length=username.length;
        for(int i = 0;i < length;i++){
            result = userMgr.deleteUser(username[i]);
            if(result == 1)continue;
            if(result == -1)break;
        }
        if(result == 1)return "ok";
        if(result == -1)return "no";
        //System.out.println(request);
        ///System.out.println((request.getParameter("username")).toString());
        return "cao";
    }

    //用户跳转
    @RequestMapping(path = "clientchange")
    @ResponseBody
    public String clientchange(HttpServletRequest request) throws Exception {
        //System.out.println(request.getParameter("client_user_name"));
        ClientMgr clientMgr =new ClientMgr();
        Client client = new Client(request.getParameter("client_user_Id"),request.getParameter("client_user_photo"),
                request.getParameter("client_user_name"),null,"0",request.getParameter("client_user_password"));
        int result=clientMgr.addClient(client);
        //int result = 1;
        if(result == 1){
            return "1";
        }
        else {
            return "0";
        }
    }
    //用户删除
    @RequestMapping(path = "clientdelete")
    @ResponseBody
    public String clientdelete(HttpServletRequest request) throws Exception {
        //System.out.println("hhh");
        String[] client_user_Id=request.getParameterValues("client_user_Id");
        //System.out.println(username[1]);
        ClientMgr clientMgr = new ClientMgr();
        int result = 0;
        int length=client_user_Id.length;
        for(int i = 0;i < length;i++){
            result = clientMgr.deleteClient(client_user_Id[i]);
            if(result == 1)continue;
            if(result == -1)break;
        }
        if(result == 1)return "ok";
        if(result == -1)return "no";
        //System.out.println(request);
        ///System.out.println((request.getParameter("username")).toString());
        return "cao";
    }

    //登录信息修改
    @RequestMapping(path = "loginchange")
    @ResponseBody
    public String loginchange(HttpServletRequest request) throws Exception {
        ClientMgr clientMgr =new ClientMgr();
        Client client = new Client(request.getParameter("client_user_Id"),"无",
                request.getParameter("client_user_name"),null,"0",request.getParameter("client_user_password"));
        int result = clientMgr.changekihon(client);//调用操作类
        if(result == 1){
            return "1";
        }
        else {
            return "0";
        }
    }

    @RequestMapping(path = "noisedelete")
    @ResponseBody
    public String noisedelete(HttpServletRequest request) throws Exception {
        NoiseMgr noiseMgr = new NoiseMgr();
        String[] gather_noiselibrary_noiseID=request.getParameterValues("gather_noiselibrary_noiseID");
        int result = 0;
        int length=gather_noiselibrary_noiseID.length;
        for(int i = 0; i < length; i++){
            int toInt = parseInt(gather_noiselibrary_noiseID[i]);
            result = noiseMgr.deleteNoise(toInt);
            if(result == 1)continue;
            if(result == -1)break;
        }
        if(result == 1)return "ok";
        if(result == -1)return "no";
        return "0";
    }
    @RequestMapping("clientnoisechange")
    @ResponseBody
    public String clientnoisechange(HttpServletRequest request) throws Exception {
        String client_usernoise_ID = request.getParameter("client_usernoise_ID");
        String client_usernoise_noiseID = request.getParameter("client_usernoise_noiseID");
        NoiseMgr noiseMgr = new NoiseMgr();
        Noise noise = noiseMgr.getNoise(client_usernoise_noiseID);
        ClientNoiseMgr clientNoiseMgr = new ClientNoiseMgr();
        int has = clientNoiseMgr.varifyClientNoise(client_usernoise_ID);
        if(has != 1){
            ClientNoise clientNoise = new ClientNoise(client_usernoise_ID,client_usernoise_noiseID,noise.getGather_noiselibrary_noisePath());
            int result = clientNoiseMgr.setClientNoise(clientNoise);
            return "1";
        }
        if(has == 1){
            ClientNoise clientNoise = new ClientNoise(client_usernoise_ID,client_usernoise_noiseID,noise.getGather_noiselibrary_noisePath());
            int result = clientNoiseMgr.changeClientNoise(clientNoise);
            return "0";
        }
        return "0";
    }

    @RequestMapping("changepw")
    @ResponseBody
    public String changepw(HttpServletRequest request) throws Exception {
        String password = request.getParameter("password");
        System.out.println(password);
        HttpSession session = request.getSession();
        Object username1 = session.getAttribute("username");
        String username = (String) username1;
        System.out.println(username+password);
        UserMgr userMgr = new UserMgr();
        User user = new User(username,password,1);
        userMgr.changepw(user);
        return "0";
    }
    @RequestMapping(path = "signout")
    @ResponseBody
    public void signout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.removeAttribute("username");
        request.getRequestDispatcher("index.jsp").forward(request, response);
        System.out.println(session.getAttribute("username"));
        //return "0";
    }
    @RequestMapping(path = "receivenoisedelete")
    @ResponseBody
    public String receivenoisedelete(HttpServletRequest request) throws Exception {
        ReceiveNoiseMgr receiveNoiseMgr = new ReceiveNoiseMgr();
        String[] client_receivenoise_ID=request.getParameterValues("client_receivenoise_ID");
        int result = 0;
        int length=client_receivenoise_ID.length;
        for(int i = 0; i < length; i++){
            result = receiveNoiseMgr.deleteReceiveNoise(client_receivenoise_ID[i]);
            if(result == 1)continue;
            if(result == -1)break;
        }
        if(result == 1)return "ok";
        if(result == -1)return "no";
        return "0";
    }
}
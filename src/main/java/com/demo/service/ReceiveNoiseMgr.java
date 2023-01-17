package com.demo.service;

import com.demo.dao.AdminHistoryDao;
import com.demo.dao.ReceiveNoiseDao;
import com.demo.entity.*;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ReceiveNoiseMgr{
    private ReceiveNoiseDao temp = new ReceiveNoiseDao();
    public List<ReceiveNoise> GetList() throws Exception {
        List<ReceiveNoise> result = temp.list();
        return result;
    }//获取登录历史
    public int AddReceiveNoise(ReceiveNoise receiveNoise,String client_receivenoise_ID) throws Exception {
        int result = -1;
        ReceiveNoise receiveNoiseCheck = temp.get(client_receivenoise_ID);
        if(receiveNoiseCheck == null){
            result = temp.add(receiveNoise);
        }else {
            result = temp.update(receiveNoise);
        }
        return result;
    }//设置登录历史
    public int ChangeReceiveNoise(ReceiveNoise receiveNoise)throws Exception{
        int result = temp.update(receiveNoise);
        return result;
    }
    public String GetReceivePath(ReceiveNoise receiveNoise,String client_receivenoise_ID) throws Exception {
        ReceiveNoise result = temp.get(client_receivenoise_ID);
        if(result == null) return "";
        else{
            return result.getClient_receivenoise_noiseReceivePath();
        }
    }
    public int deleteReceiveNoise(String client_receivenoise_ID) throws Exception {
        int result = -1;
        ReceiveNoise receiveNoise = temp.get(client_receivenoise_ID);
        String path = "C:/"+receiveNoise.getClient_receivenoise_noiseReceivePath();
        File file = new File(path);
        boolean isOk = file.exists();
        if(isOk){
            file.delete();
            result = temp.delete(client_receivenoise_ID);
        }
        return result;
    }
    public List<ReceiveNoise> findReceiveNoise(String key) throws Exception {
        List<ReceiveNoise> result = new ArrayList<>();
        //int intkey = parseInt(key);
        ReceiveNoise receivenoiseCheck = temp.get(key);
        if(receivenoiseCheck == null) {
            receivenoiseCheck = new ReceiveNoise("无","无","无","无");
        }
        result.add(receivenoiseCheck);
        return result;
    }
    public List<Map> getApplicant(String client_receivenoise_applicantID) throws Exception {
        List<ReceiveNoise> data = temp.getApplicant(client_receivenoise_applicantID);
        MapBeanUtil setJson =new MapBeanUtil();
        List<Map> result = new ArrayList<>();
        int size = data.size();
        for(int i=0;i<size;i++){
            ReceiveNoise t =data.get(i);
            Map<String,Object> map= setJson.object2Map(t);
            //System.out.println(map);
            result.add(map);
        }
        return result;
    }
    public List<Map> getReceiver(String client_receivenoise_receiverID) throws Exception {
        List<ReceiveNoise> data = temp.getReceiver(client_receivenoise_receiverID);
        MapBeanUtil setJson =new MapBeanUtil();
        List<Map> result = new ArrayList<>();
        int size = data.size();
        for(int i=0;i<size;i++){
            ReceiveNoise t =data.get(i);
            Map<String,Object> map= setJson.object2Map(t);
            //System.out.println(map);
            result.add(map);
        }
        return result;
    }
    public List<Map> getAll(String client_receivenoise_receiverID) throws Exception {
        List<ReceiveNoise> data = temp.getReceiver(client_receivenoise_receiverID);
        List<ReceiveNoise> data1 = temp.getApplicant(client_receivenoise_receiverID);
        data.addAll(data1);
        MapBeanUtil setJson =new MapBeanUtil();
        List<Map> result = new ArrayList<>();
        int size = data.size();
        for(int i=0;i<size;i++){
            ReceiveNoise t =data.get(i);
            Map<String,Object> map= setJson.object2Map(t);
            //System.out.println(map);
            result.add(map);
        }
        return result;
    }
}
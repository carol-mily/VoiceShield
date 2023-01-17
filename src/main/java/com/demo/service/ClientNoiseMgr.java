package com.demo.service;

import com.demo.dao.ClientNoiseDao;
import com.demo.entity.ClientNoise;
import com.demo.entity.Noise;

import java.util.ArrayList;
import java.util.List;

import static java.lang.Integer.parseInt;

//用户噪声操作类
public class ClientNoiseMgr{
    private ClientNoiseDao temp = new ClientNoiseDao();
    public List<ClientNoise> GetList() throws Exception {
        List<ClientNoise> result = temp.list();
        return result;
    }
    public List<ClientNoise> findClientNoise(String key) throws Exception {
        List<ClientNoise> result = new ArrayList<>();
        //int intkey = parseInt(key);
        ClientNoise clientnoiseCheck = temp.get(key);
        if(clientnoiseCheck == null) {
            clientnoiseCheck = new ClientNoise("无","无","无");
        }
        result.add(clientnoiseCheck);
        return result;
    }
    public int varifyClientNoise(String client_usernoise_ID) throws Exception {
        ClientNoise clientNoise = temp.get(client_usernoise_ID);
        if(clientNoise!=null)return 1;
        else return 0;
    }
    public int setClientNoise(ClientNoise clientNoise) throws Exception {
        int result = temp.add(clientNoise);
        return result;
    }
    public int changeClientNoise(ClientNoise clientNoise) throws Exception {
        int result = temp.update(clientNoise);
        return result;
    }
    public int deletNoise(String client_usernoise_ID) throws Exception {
        int result = -1;
        ClientNoise clientNoise = temp.get(client_usernoise_ID);
        if(client_usernoise_ID!=null){
            result = temp.delete(client_usernoise_ID);
        }
        return result;

    }
}
package com.demo.service;

import com.demo.dao.ClientDao;
import com.demo.entity.Client;
import com.demo.entity.User;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//用户操作类
public class ClientMgr{
    private ClientDao temp = new ClientDao();
    public List<Client> GetList() throws Exception {
        List<Client> result = temp.list();
        return result;
    }//获取用户全部信息
    public List<Map> GetOnStateList() throws Exception {
        MapBeanUtil setJson =new MapBeanUtil();
        List<Map> result = new ArrayList<>();
        List<Client> data = temp.getOnState();
        int size = data.size();
        for(int i=0;i<size;i++){
            Client t =data.get(i);
            Map<String,Object> map= setJson.object2Map(t);
            //System.out.println(map);
            result.add(map);
        }
        return result;
    }//获取用户全部信息
    public int verifyClient(String client_user_ID,String client_user_password) throws Exception {
        int result = -1;
        //System.out.println(client_user_ID+' '+client_user_password);
        Client clientCheck = temp.get(client_user_ID);
        if(clientCheck != null && client_user_password.equals(clientCheck.getClient_user_password())){
            result = 1;
        }
        return  result;
    }
    public int addClient(Client client) throws Exception {
        int result = -1;
        Client clientCheck = temp.get(client.getClient_user_Id());
        if(clientCheck == null){
            temp.add(client);
            result = 1;
        }
        if(clientCheck != null){
            temp.changeAdd(client);
            result = 1;
        }
        return result;
    }//增加用户
    public int deleteClient(String client_user_ID) throws Exception {
        int result = -1;
        Client clientCheck = temp.get(client_user_ID);
        if(clientCheck != null){
            temp.delete(client_user_ID);
            ClientNoiseMgr clientNoiseMgr = new ClientNoiseMgr();
            result = clientNoiseMgr.deletNoise(client_user_ID);
        }
        return result;
    }//删除用户
    public List<Client> findClient(String key) throws Exception {
        List<Client> result = new ArrayList<>();
        Client clientCheck = temp.get(key);
        if(clientCheck == null) {
            clientCheck = new Client("无", "无", "无", "无", "0","无");
        }
        result.add(clientCheck);
        return result;
    }//寻找对应用户信息
    public int changekihon(Client client) throws Exception {
        int result = temp.change(client);
        return result;
    }//检查基本信息 ID password 昵称

    public String getClientName(String client_user_ID) throws Exception {
        String result = (temp.get(client_user_ID)).getClient_user_name();
        return result;
    }

    public int editPassword(String client_user_ID, String client_user_password) throws Exception {
        Client client = new Client(client_user_ID,client_user_password);
        int result = temp.editPassword(client);
        return result;
    }
    public int registerClient(Client client) throws Exception {
        int result = -1;
        Client clientCheck = temp.get(client.getClient_user_Id());
        if(clientCheck == null){
            temp.add(client);
            result = 1;
        }
        if(clientCheck != null){
            return result;
        }
        return result;
    }//增加用户

    public int setLoginState(Client client) throws Exception {
        int result = -1;
        result = temp.setLoginState(client);
        return result;
    }
    public int Logout(String client_user_Id) throws Exception {
        int result = -1;
        result = temp.Logout(client_user_Id);
        return result;
    }
    public Client getClient(String client_user_Id) throws Exception {
        return temp.get(client_user_Id);
    }
    public int changeName(Client client) throws Exception {
        int result = -1;
        Client clientCheck = temp.get(client.getClient_user_Id());
        if(clientCheck == null){
            return result;
        }
        if(clientCheck != null){
            result = temp.changeName(client);
        }
        return result;
    }
    public int changeImage(Client client)throws Exception{
        int result = -1;
        Client clientCheck = temp.get(client.getClient_user_Id());
        if(clientCheck == null){
            return result;
        }else {
            result = temp.changeImage(client);
        }
        return result;
    }
}
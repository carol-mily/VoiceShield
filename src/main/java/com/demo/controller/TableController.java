package com.demo.controller;

import com.demo.entity.*;
import com.demo.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
//各个表格的构建类，无需关注
@Controller
@RequestMapping(path = "table")
public class TableController{
    @RequestMapping(path = "user")
    @ResponseBody
    public Map setUserTable(String key,int page,int limit) throws Exception {
        //System.out.println(key);
        if (key == null) {
            LayuiTable<User> temp = new LayuiTable<User>();
            UserMgr userMgr = new UserMgr();
            Map result= temp.setJsonTable(userMgr.GetList(),page,limit);
            return result;
        }
        else {
            UserMgr userMgr = new UserMgr();
            Map resultJson = new HashMap();
            resultJson.put("data",userMgr.findUser(key));
            resultJson.put("code", 0);
            resultJson.put("count",1);
            resultJson.put("msg",null);
            return resultJson;
        }
    }
    @RequestMapping(path = "client")
    @ResponseBody
    public Map setClientTable(String key,int page,int limit) throws Exception {
        if(key == null){
            LayuiTable<Client> temp = new LayuiTable<Client>();
            //System.out.println("11111");
            ClientMgr clientMgr = new ClientMgr();
            Map result= temp.setJsonTable(clientMgr.GetList(),page,limit);
            //System.out.println(result);
            return result;
        }else{
            ClientMgr clientMgr = new ClientMgr();
            Map resultJson = new HashMap();
            resultJson.put("data",clientMgr.findClient(key));
            resultJson.put("code", 0);
            resultJson.put("count",1);
            resultJson.put("msg",null);
            return resultJson;
        }
    }

    @RequestMapping(path = "noise")
    @ResponseBody
    public Map setNoiseTable(String key,int page,int limit) throws Exception {
        if(key == null){
            LayuiTable<Noise> temp = new LayuiTable<Noise>();
            NoiseMgr noiseMgr = new NoiseMgr();
            Map result= temp.setJsonTable(noiseMgr.GetList(),page,limit);
            return result;
        }else{
            NoiseMgr noiseMgr = new NoiseMgr();
            Map resultJson = new HashMap();
            resultJson.put("data",noiseMgr.findNoise(key));
            resultJson.put("code", 0);
            resultJson.put("count",1);
            resultJson.put("msg",null);
            return resultJson;
        }
    }

    @RequestMapping(path = "clientnoise")
    @ResponseBody
    public Map setClientNoiseTable(String key,int page,int limit) throws Exception {
        if(key == null){
            LayuiTable<ClientNoise> temp = new LayuiTable<ClientNoise>();
            ClientNoiseMgr clientnoiseMgr = new ClientNoiseMgr();
            Map result= temp.setJsonTable(clientnoiseMgr.GetList(),page,limit);
            return result;
        }else {
            ClientNoiseMgr clientNoiseMgr = new ClientNoiseMgr();
            Map resultJson = new HashMap();
            resultJson.put("data",clientNoiseMgr.findClientNoise(key));
            resultJson.put("code", 0);
            resultJson.put("count",1);
            resultJson.put("msg",null);
            return resultJson;
        }
    }

    @RequestMapping(path = "login")
    @ResponseBody
    public Map setLoginTable(int page,int limit) throws Exception {
        LayuiTable<Client> temp = new LayuiTable<Client>();
        ClientMgr clientMgr = new ClientMgr();
        Map result= temp.setJsonTable(clientMgr.GetList(),page,limit);
        return result;
    }

    @RequestMapping(path = "history")
    @ResponseBody
    public Map setHistoryTable(int page,int limit) throws Exception {
        LayuiTable<AdminHistory> temp = new LayuiTable<AdminHistory>();
        AdminHistoryMgr adminHistoryMgr = new AdminHistoryMgr();
        Map result= temp.setJsonTable(adminHistoryMgr.GetList(),page,limit);
        return result;
    }
    @RequestMapping(path = "receivenoise")
    @ResponseBody
    public Map setReceiveNoise(String key,int page,int limit) throws Exception {
        if(key == null){
            LayuiTable<ReceiveNoise> temp = new LayuiTable<ReceiveNoise>();
            ReceiveNoiseMgr receiveNoiseMgr = new ReceiveNoiseMgr();
            Map result= temp.setJsonTable(receiveNoiseMgr.GetList(),page,limit);
            return result;
        }else{
            ReceiveNoiseMgr receiveNoiseMgr = new ReceiveNoiseMgr();
            Map resultJson = new HashMap();
            resultJson.put("data",receiveNoiseMgr.findReceiveNoise(key));
            resultJson.put("code", 0);
            resultJson.put("count",1);
            resultJson.put("msg",null);
            return resultJson;
        }
    }
    @RequestMapping(path = "clientselect")
    @ResponseBody
    public List<Map> clientSelect() throws Exception {
        ClientMgr clientMgr = new ClientMgr();
        List<Client> clientList = clientMgr.GetList();
        List<Map> list = new ArrayList<>();
        MapBeanUtil mapBeanUtil = new MapBeanUtil();
        for(Client client: clientList){
            list.add(mapBeanUtil.object2Map(client));
        }
        //System.out.println(list);
        return list;
    }

    @RequestMapping(path = "noiseselect")
    @ResponseBody
    public List<Map> noiseSelect() throws Exception {
        NoiseMgr noiseMgr = new NoiseMgr();
        List<Noise> noiseList = noiseMgr.GetList();
        List<Map> list = new ArrayList<>();
        MapBeanUtil mapBeanUtil = new MapBeanUtil();
        for(Noise noise: noiseList){
            list.add(mapBeanUtil.object2Map(noise));
        }
        //System.out.println(list);
        return list;
    }
}
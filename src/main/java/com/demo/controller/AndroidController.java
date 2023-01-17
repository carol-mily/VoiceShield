package com.demo.controller;

import com.demo.entity.Client;
import com.demo.entity.ReceiveNoise;
import com.demo.service.ClientMgr;
//import com.demo.service.GetPhoneCheckID;
import com.demo.service.ReceiveNoiseMgr;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(path = "android")
public class AndroidController{
    @RequestMapping(path = "login")
    @ResponseBody
    public Map login(@RequestBody Map<String, String> map) throws Exception {
        Map result = new HashMap();
        String itemName = map.get("itemName");
        String client_user_Id = map.get("phone");
        String client_user_password = map.get("password");
        //System.out.println(client_user_Id+' '+client_user_password);
        if(itemName.equals("checkLogInfo")){
            ClientMgr clientMgr = new ClientMgr();
            String isExist;
            //System.out.println("ok");
            if((clientMgr.verifyClient(client_user_Id,client_user_password))==1){
                isExist="1";
            }else{
                isExist="0";
            }
            //System.out.println(isExist);
            //JSONObject map=new JSONObject() ;
            map.put("isExist",isExist);
            if(isExist.equals("1")){
                Date date = new Date();
                SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
                String time = formatter.format(date);
                Client client = new Client(client_user_Id,client_user_password,time,"1");
                clientMgr.setLoginState(client);
                //System.out.println("oj");
                //result.put("userName",client_user_Id);
                result.put("userPhone",client_user_Id);
                result.put("userName",clientMgr.getClientName(client_user_Id));
            }
        }else if(itemName.equals("setRegisterInfo")){
            String name = map.get("name");
            Client client=new Client(client_user_Id,"images/genshin1.jpg",name,null,"0",client_user_password);
            ClientMgr clientMgr=new ClientMgr();
            int k1=clientMgr.registerClient(client);
            //boolean k2=loginMgr.addLogin(login);
            String isSuccessful=null;
            if(k1 == 1){
                isSuccessful="1";
            }else {
                isSuccessful="0";
            }
            result.put("isSuccessful",isSuccessful);

        }else if(itemName.equals("setPassword")){
            ClientMgr clientMgr = new ClientMgr();
            int getResult = clientMgr.editPassword(client_user_Id,client_user_password);
            result.put("isSuccessful",String.valueOf(getResult));
        }else if(itemName.equals("checkPhone")){
            /*GetPhoneCheckID getPhoneCheckID = new GetPhoneCheckID();
            String checkID = getPhoneCheckID.PhoneCheckID(client_user_Id);
            if(!result.equals("0")){
                result.put("check",checkID);
            }*/
        }else if(itemName.equals("Logout")){
            ClientMgr clientMgr = new ClientMgr();
            int output = clientMgr.Logout(client_user_Id);
            if(output == 1){
                result.put("isSuccessful","1");
            }else {
                result.put("isSuccessful","0");
            }
        }
        return result;
    }
    @RequestMapping(path = "getUserInfo")
    @ResponseBody
    public Map getUserInfo(@RequestBody Map<String, String> map) throws Exception {
        Map result = new HashMap();
        String itemName = map.get("itemName");
        String client_user_Id = map.get("phone");
        System.out.println(itemName+' '+client_user_Id);
        ClientMgr clientMgr = new ClientMgr();
        if(itemName.equals("handlePersonalResponse")){
            Client client = clientMgr.getClient(client_user_Id);
            if(client == null){
                result.put("code","0");
            }else {
                result.put("lastDate",client.getClient_user_lastLoginTime());
                result.put("nickName",client.getClient_user_name());
                result.put("state",client.getClient_user_logState());
                String photo = client.getClient_user_photo();
                if(photo != null){
                    result.put("photo",photo.substring(7));
                }else {
                    result.put("photo",null);
                }
                result.put("code","1");
            }
        }else if(itemName.equals("changeNickname")){
            String nickName = map.get("nickName");
            Client client = new Client(client_user_Id,null,nickName,"","","");
            int check = clientMgr.changeName(client);
            if(check == -1){
                result.put("Code","0");
            }else{
                result.put("Code","1");
            }
        }else if(itemName.equals("handleContactResponse")){

        }else if(itemName.equals("handleSearch")){
            Client client = clientMgr.getClient(client_user_Id);
            result.put("nickName",client.getClient_user_name());
        }else if(itemName.equals("changePortrait")){
            String photo = map.get("photo");
            Client client = new Client(client_user_Id,"images/"+photo,null,null,null,null);
            int check = clientMgr.changeImage(client);
            if(check == -1){
                result.put("Code","0");
            }else{
                result.put("Code","1");
            }
        }else if(itemName.equals("getOnState")){
            List<Map> list = clientMgr.GetOnStateList();
            result.put("data",list);
        }else if(itemName.equals("getReceiveNoise")){
            String applicant = map.get("applicant");
            ReceiveNoiseMgr receiveNoiseMgr = new ReceiveNoiseMgr();
            List<Map> Applicant = receiveNoiseMgr.getApplicant(applicant);
            List<Map> Receiver = receiveNoiseMgr.getReceiver(applicant);
            List<Map> All = receiveNoiseMgr.getAll(applicant);
            result.put("applicant",Applicant);
            result.put("receiver",Receiver);
            result.put("all",All);
        }
        return result;
    }
}
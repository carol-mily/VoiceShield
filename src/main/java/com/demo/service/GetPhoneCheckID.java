/*package com.demo.service;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;

import java.io.IOException;
import java.rmi.ServerException;
import java.util.Random;

public class GetPhoneCheckID{
    public String PhoneCheckID(String phone){
        try {
            Random rand = new Random();
            int k = rand.nextInt(9000)+1000;
            String sp = String.valueOf(k);
            DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAI4Fztp3wBCtTMHmfAFcsq", "VbNRWdJVPP4zTnNWLbFfpDATmnn1Um");
            IAcsClient client = new DefaultAcsClient(profile);
            CommonRequest request = new CommonRequest();
            request.setSysMethod(MethodType.POST);
            request.setSysDomain("dysmsapi.aliyuncs.com");
            request.setSysVersion("2017-05-25");
            request.setSysAction("SendSms");
            request.putQueryParameter("RegionId", "cn-hangzhou");
            request.putQueryParameter("PhoneNumbers", phone);
            request.putQueryParameter("SignName", "软件1803");
            request.putQueryParameter("TemplateCode", "SMS_204105876");
            request.putQueryParameter("TemplateParam", "{\"code\":\""+sp+"\"}");
            try {
                CommonResponse response = client.getCommonResponse(request);
                System.out.println(response.getData());
            } catch (ClientException e) {
                e.printStackTrace();
            }
            return String.valueOf(k);
        }catch (Exception e){

        }
        return  "0";
    }
}*/
package com.demo.controller;

import com.demo.entity.AdminHistory;
import com.demo.entity.User;
import com.demo.service.AdminHistoryMgr;
import com.demo.service.UserMgr;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


@Controller
public class JumpController {
    //登录跳转
    @RequestMapping(path ="login")
    public String login(HttpServletRequest request) throws Exception {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        //System.out.println(username+' '+password);
        UserMgr userMgr = new UserMgr();
        int token = userMgr.verifyUser(username,password);
        //System.out.println(token);
        if(token == 1){
            HttpSession session = request.getSession();
            //session.setAttribute("username","happy");
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
            String time = formatter.format(date);
            User user = new User(username,time);
            session.setAttribute("username",username);
            userMgr.setlogtime(user);
            AdminHistory adminHistory = new AdminHistory(0,username,userMgr.getPhone(username),time,request.getRemoteAddr());
            AdminHistoryMgr adminHistoryMgr = new AdminHistoryMgr();
            adminHistoryMgr.AddHistory(adminHistory);
            int type = userMgr.getType(username);
            if(type == 1){
                return "login";
            }
            else {
                return "login2";
            }
        }
        return "success";
    }
    //其余都是普通的页面跳转
    @RequestMapping(path = "Client")
    public String Client()throws Exception{
        return "clientMessage";
    }

    @RequestMapping(path = "ClientNoise")
    public String ClientNoise()throws Exception{
        return "clientNoiseMessage";
    }

    @RequestMapping(path = "Login")
    public String Login()throws Exception{
        return "loginMessage";
    }

    @RequestMapping(path = "Admit")
    public String Admit()throws Exception{
        return "admitMessage";
    }

    @RequestMapping(path = "Noise")
    public String Noise()throws Exception{
        return "noiseMessage";
    }

    @RequestMapping(path = "Main")
    public String Main()throws Exception{
        return "main";
    }

    @RequestMapping(path = "Main2")
    public String Main2()throws Exception{
        return "main2";
    }

    @RequestMapping(path = "updatePwd")
    public String updatePwd()throws Exception{
        return "updatePwd";
    }
    @RequestMapping(path = "login2")
    public String login2(HttpServletRequest request, HttpServletResponse response)throws Exception{
        HttpSession session = request.getSession();
        session.setAttribute("username","1");
        return "login";
    }
    @RequestMapping(path = "admitAdd")
    public String admitAdd()throws Exception{
        return "admitAdd";
    }
    @RequestMapping(path = "clientAdd")
    public String clientAdd()throws Exception{
        return "clientAdd";
    }
    @RequestMapping(path = "loginChange")
    public String loginChange()throws Exception{
        return "loginChange";
    }
    @RequestMapping(path = "clientNoiseAdd")
    public String clientNoiseAdd()throws Exception{
        return "clientNoiseAdd";
    }
    @RequestMapping(path = "history")
    public String history()throws Exception{
        return "adminHistory";
    }
    @RequestMapping(path = "ReceiveNoiseMessage")
    public String ReceiveNoiseMessage()throws Exception{
        return "ReceiveNoiseMessage";
    }
}
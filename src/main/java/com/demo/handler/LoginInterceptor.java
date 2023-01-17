package com.demo.handler;

import com.demo.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        //获取请求的RUi:去除http:localhost:8080这部分剩下的
        String uri = request.getRequestURI();
        //UTL:除了login.jsp是可以公开访问的，其他的URL都进行拦截控制
        if (uri.indexOf("/test1_war_exploded/index.jsp") >= 0) {
            return true;
        }
        if(uri.indexOf("/test1_war_exploded/login2.do")>=0){
            return true;
        }
        if(uri.indexOf("/test1_war_exploded/login.do")>=0){
            return true;
        }
        if(uri.indexOf("/test1_war_exploded/android/login")>=0){
            return true;
        }
        if(uri.indexOf("/test1_war_exploded/android/getUserInfo")>=0){
            return true;
        }
        if(uri.indexOf("/test1_war_exploded/upload/androidAudio")>=0){
            return true;
        }
        if(uri.indexOf("/test1_war_exploded/upload/androidDownload")>=0){
            return true;
        }
        if(uri.indexOf("/test1_war_exploded/upload/download")>=0){
            return true;
        }
        //获取session
        HttpSession session = request.getSession();
        Object username = session.getAttribute("username");
        //判断session中是否有用户数据，如果有，则返回true，继续向下执行
        if (username != null) {
            return true;
        }
        //不符合条件的给出提示信息，并转发到登录页面
        request.setAttribute("msg", "您还没有登录，请先登录！");
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
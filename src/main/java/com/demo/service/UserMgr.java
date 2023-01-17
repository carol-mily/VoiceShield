package com.demo.service;

import com.demo.dao.UserDao;
import com.demo.entity.User;

import java.util.ArrayList;
import java.util.List;
//管理人操作类
public class UserMgr{
    private UserDao temp=new UserDao();
    public List<User> GetList() throws Exception {
        List<User> result = temp.list();
        return result;
    }

    public int verifyUser(String username,String password) throws Exception {
        int result = -1;
        User userCheck = temp.get(username);
        //System.out.println();
        if(userCheck != null && password.equals(userCheck.getPassword())){
            result = 1;
        }
        return  result;
    }

    public String getPhone(String username) throws Exception {
        String result = null;
        User userCheck = temp.get(username);
        if(userCheck != null){
            result = userCheck.getPhonenum();
        }
        return result;
    }
    public int deleteUser(String username) throws Exception {
        int result = -1;
        User userCheck = temp.get(username);
        if(userCheck != null){
            temp.delete(username);
            result = 1;
        }
        return result;
    }
    public int addUser(User user) throws Exception {
        int result = -1;
        User userCheck = temp.get(user.getUsername());
        if(userCheck == null){
            temp.add(user);
            result = 1;
        }
        if(userCheck != null){
            temp.update(user);
            result = 1;
        }
        return result;
    }
    public List<User> findUser(String key) throws Exception {
        List<User> result = new ArrayList<>();
        User userCheck = temp.get(key);
        if(userCheck == null) {
            userCheck = new User("无", "无", 3, "无", -1,"无");
        }
        result.add(userCheck);
        return result;
    }
    public int setlogtime(User user) throws Exception {
        int result = -1;
        result = temp.setlogtime(user);
        return result;
    }
    public int changepw(User entity) throws Exception {
        int result = -1;
        result = temp.changepw(entity);
        return result;
    }
    public int getType(String username)throws Exception{
        User result = temp.get(username);
        return result.getUserType();
    }

}
package com.demo.entity;
public class User {
    private String username;
    private String password;
    private int sex;
    private String phonenum;
    private int userType;
    private String lastlogtime;

    public User(String username, String password, int sex, String phonenum, int userType,String lastlogtime) {
        super();
        this.username = username;
        this.password = password;
        this.sex = sex;
        this.phonenum = phonenum;
        this.userType = userType;
        this.lastlogtime = lastlogtime;
    }
    public User() {
        super();
    }
    public User(String username,String lastlogtime){
        this.lastlogtime=lastlogtime;
        this.username = username;
    }
    public User(String username,String password,int sex){
        this.password=password;
        this.username = username;
        this.sex = sex;
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getLastlogtime() {
        return lastlogtime;
    }

    public void setLastlogtime(String lastlogtime) {
        this.lastlogtime = lastlogtime;
    }

    public int getSex() {
        return sex;
    }
    public void setSex(int sex) {
        this.sex = sex;
    }
    public String getPhonenum() {
        return phonenum;
    }
    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }
    public int getUserType() {
        return userType;
    }
    public void setUserType(int userType) {
        this.userType = userType;
    }
}

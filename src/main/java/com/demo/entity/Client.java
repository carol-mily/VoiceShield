package com.demo.entity;
public class Client{
    private String client_user_Id;
    private String client_user_photo;
    private String client_user_name;
    private String client_user_lastLoginTime;
    private String client_user_logState;
    private String client_user_password;
    public Client(String client_user_Id,String client_user_photo,String client_user_name,String client_user_lastLoginTime,String client_user_logState,String client_user_password){
        this.client_user_Id = client_user_Id;
        this.client_user_photo = client_user_photo;
        this.client_user_name = client_user_name;
        this.client_user_lastLoginTime = client_user_lastLoginTime;
        this.client_user_logState = client_user_logState;
        this.client_user_password= client_user_password;
    }
    public String getClient_user_Id() {
        return client_user_Id;
    }

    public String getClient_user_photo() {
        return client_user_photo;
    }

    public String getClient_user_name() {
        return client_user_name;
    }

    public String getClient_user_lastLoginTime() {
        return client_user_lastLoginTime;
    }

    public String getClient_user_logState() {
        return client_user_logState;
    }

    public void setClient_user_Id(String client_user_Id) {
        this.client_user_Id = client_user_Id;
    }

    public void setClient_user_photo(String client_user_photo) {
        this.client_user_photo = client_user_photo;
    }

    public void setClient_user_name(String client_user_name) {
        this.client_user_name = client_user_name;
    }

    public void setClient_user_lastLoginTime(String client_user_lastLoginTime) {
        this.client_user_lastLoginTime = client_user_lastLoginTime;
    }

    public void setClient_user_logState(String client_user_logState) {
        this.client_user_logState = client_user_logState;
    }

    public String getClient_user_password() {
        return client_user_password;
    }

    public void setClient_user_password(String client_user_password) {
        this.client_user_password = client_user_password;
    }
    public Client(String client_user_Id,String client_user_password){
        this.client_user_password = client_user_password;
        this.client_user_Id = client_user_Id;
    }
    public Client(String client_user_Id,String client_user_password,String client_user_lastLoginTime,String client_user_logState){
        this.client_user_Id = client_user_Id;
        this.client_user_password = client_user_password;
        this.client_user_lastLoginTime = client_user_lastLoginTime;
        this.client_user_logState = client_user_logState;
    }
}
package com.demo.entity;
public class AdminHistory{
    private int admin_history_ID;
    private String admin_history_name;
    private String admin_history_phone;
    private String admin_history_time;
    private String admin_history_IP;
    public AdminHistory(int admin_history_ID,String admin_history_name,String admin_history_phone,String admin_history_time,String admin_history_IP){
        this.admin_history_ID=admin_history_ID;
        this.admin_history_name=admin_history_name;
        this.admin_history_phone=admin_history_phone;
        this.admin_history_time=admin_history_time;
        this.admin_history_IP=admin_history_IP;
    }
    public int getAdmin_history_ID() {
        return admin_history_ID;
    }

    public String getAdmin_history_IP() {
        return admin_history_IP;
    }

    public String getAdmin_history_name() {
        return admin_history_name;
    }

    public String getAdmin_history_phone() {
        return admin_history_phone;
    }

    public String getAdmin_history_time() {
        return admin_history_time;
    }

    public void setAdmin_history_ID(int admin_history_ID) {
        this.admin_history_ID = admin_history_ID;
    }

    public void setAdmin_history_IP(String admin_history_IP) {
        this.admin_history_IP = admin_history_IP;
    }

    public void setAdmin_history_name(String admin_history_name) {
        this.admin_history_name = admin_history_name;
    }

    public void setAdmin_history_phone(String admin_history_phone) {
        this.admin_history_phone = admin_history_phone;
    }

    public void setAdmin_history_time(String admin_history_time) {
        this.admin_history_time = admin_history_time;
    }
}
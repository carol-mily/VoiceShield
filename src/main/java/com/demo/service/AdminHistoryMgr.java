package com.demo.service;

import com.demo.dao.AdminHistoryDao;
import com.demo.entity.AdminHistory;

import java.util.List;

public class AdminHistoryMgr{
    private AdminHistoryDao temp = new AdminHistoryDao();
    public List<AdminHistory> GetList() throws Exception {
        List<AdminHistory> result = temp.list();
        return result;
    }//获取登录历史
    public int AddHistory(AdminHistory adminHistory) throws Exception {
        int result = temp.add(adminHistory);
        return result;
    }//设置登录历史
}
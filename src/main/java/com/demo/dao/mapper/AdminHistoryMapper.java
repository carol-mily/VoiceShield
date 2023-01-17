package com.demo.dao.mapper;
import com.demo.entity.AdminHistory;
import com.demo.entity.Client;

import java.util.List;

public interface AdminHistoryMapper {
    /**
     * 添加用户
     * @param entity 实体
     * @return 添加id
     * @throws Exception
     */
    int add(AdminHistory entity) throws Exception;
    int delete(String admin_history_ID) throws Exception;
    int update(AdminHistory entity) throws Exception;
    AdminHistory get(String admin_history_ID) throws Exception;
    List<AdminHistory> list() throws Exception;
}
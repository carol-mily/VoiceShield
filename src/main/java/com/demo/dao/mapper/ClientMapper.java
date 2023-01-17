package com.demo.dao.mapper;
import com.demo.entity.Client;

import java.util.List;

public interface ClientMapper {
    /**
     * 添加用户
     * @param entity 实体
     * @return 添加id
     * @throws Exception
     */
    int add(Client entity) throws Exception;
    int delete(String client_user_Id) throws Exception;
    int update(Client entity) throws Exception;
    Client get(String client_user_Id) throws Exception;
    List<Client> list() throws Exception;
    int change(Client entity)throws Exception;
    int editPassword(Client entity)throws Exception;
    int setLoginState(Client entity)throws Exception;
    int Logout(String client_user_Id)throws Exception;
    int changeName(Client entity)throws Exception;
    int changeAdd(Client entity)throws Exception;
    int changeImage(Client entity)throws Exception;
    List<Client> getOnState() throws Exception;
}
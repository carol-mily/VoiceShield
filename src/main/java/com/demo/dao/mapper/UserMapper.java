package com.demo.dao.mapper;
import com.demo.entity.User;

import java.util.List;

public interface UserMapper {
    /**
     * 添加用户
     * @param entity 实体
     * @return 添加id
     * @throws Exception
     */
    int add(User entity) throws Exception;
    int delete(String username) throws Exception;
    int update(User entity) throws Exception;
    User get(String username) throws Exception;
    List<User> list() throws Exception;
    int setlogtime(User entity) throws Exception;
    int changepw(User entity)throws Exception;
}
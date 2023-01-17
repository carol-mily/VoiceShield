package com.demo.dao.mapper;
import com.demo.entity.ClientNoise;

import java.util.List;

public interface ClientNoiseMapper {
    /**
     * 添加用户
     * @param entity 实体
     * @return 添加id
     * @throws Exception
     */
    int add(ClientNoise entity) throws Exception;
    int delete(String client_usernoise_ID) throws Exception;
    int update(ClientNoise entity) throws Exception;
    ClientNoise get(String client_usernoise_ID) throws Exception;
    List<ClientNoise> list() throws Exception;
}
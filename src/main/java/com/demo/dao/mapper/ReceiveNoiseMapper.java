package com.demo.dao.mapper;
import com.demo.entity.ReceiveNoise;

import java.util.List;

public interface ReceiveNoiseMapper {
    /**
     * 添加用户
     * @param entity 实体
     * @return 添加id
     * @throws Exception
     */
    int add(ReceiveNoise entity) throws Exception;
    int delete(String client_receivenoise_ID) throws Exception;
    int update(ReceiveNoise entity) throws Exception;
    ReceiveNoise get(String client_receivenoise_ID) throws Exception;
    List<ReceiveNoise> list() throws Exception;
    List<ReceiveNoise> getApplicant(String client_receivenoise_applicantID) throws Exception;
    List<ReceiveNoise> getReceiver(String client_receivenoise_receiverID) throws Exception;
}
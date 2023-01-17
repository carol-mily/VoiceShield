package com.demo.dao.mapper;
import com.demo.entity.Noise;

import java.util.List;

public interface NoiseMapper {
    /**
     * 添加用户
     * @param entity 实体
     * @return 添加id
     * @throws Exception
     */
    int add(Noise entity) throws Exception;
    int delete(int gather_noiselibrary_noiseID) throws Exception;
    int update(Noise entity) throws Exception;
    Noise get(int gather_noiselibrary_noiseID) throws Exception;
    List<Noise> list() throws Exception;
}
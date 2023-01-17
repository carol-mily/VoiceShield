package com.demo.dao;
import com.demo.dao.mapper.NoiseMapper;
import com.demo.entity.Noise;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class NoiseDao {
    private SqlSession sqlSession;
    private NoiseMapper mapper;

    public NoiseDao() {
        sqlSession = DBTools.getSqlSession();
        mapper = sqlSession.getMapper(NoiseMapper.class);
    }

    public int add(Noise entity) throws Exception {
        //调用数据库操作函数后需要commit才会提交
        int result = mapper.add(entity);
        sqlSession.commit();
        return result;
    }

    public int delete(int gather_noiselibrary_noiseID) throws Exception {
        int result = mapper.delete(gather_noiselibrary_noiseID);
        sqlSession.commit();
        return result;
    }

    public int update(Noise entity) throws Exception {
        int result = mapper.update(entity);
        sqlSession.commit();
        return result;
    }

    public Noise get(int gather_noiselibrary_noiseID) throws Exception {
        Noise result = mapper.get(gather_noiselibrary_noiseID);
        sqlSession.commit();
        return result;
    }

    public List<Noise> list() throws Exception {
        List<Noise> result = mapper.list();
        sqlSession.commit();
        return result;
    }
}
package com.demo.dao;
import com.demo.dao.mapper.ReceiveNoiseMapper;
import com.demo.entity.ReceiveNoise;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ReceiveNoiseDao {
    private SqlSession sqlSession;
    private ReceiveNoiseMapper mapper;

    public ReceiveNoiseDao() {
        sqlSession = DBTools.getSqlSession();
        mapper = sqlSession.getMapper(ReceiveNoiseMapper.class);
    }

    public int add(ReceiveNoise entity) throws Exception {
        //调用数据库操作函数后需要commit才会提交
        int result = mapper.add(entity);
        sqlSession.commit();
        return result;
    }

    public int delete(String client_receivenoise_ID) throws Exception {
        int result = mapper.delete(client_receivenoise_ID);
        sqlSession.commit();
        return result;
    }

    public int update(ReceiveNoise entity) throws Exception {
        int result = mapper.update(entity);
        sqlSession.commit();
        return result;
    }

    public ReceiveNoise get(String client_receivenoise_ID) throws Exception {
        ReceiveNoise result = mapper.get(client_receivenoise_ID);
        sqlSession.commit();
        return result;
    }

    public List<ReceiveNoise> list() throws Exception {
        List<ReceiveNoise> result = mapper.list();
        sqlSession.commit();
        return result;
    }
    public List<ReceiveNoise> getApplicant(String client_receivenoise_applicantID) throws Exception{
        List<ReceiveNoise> result = mapper.getApplicant(client_receivenoise_applicantID);
        sqlSession.commit();
        return result;
    }
    public List<ReceiveNoise> getReceiver(String client_receivenoise_receiverID) throws Exception{
        List<ReceiveNoise> result = mapper.getReceiver(client_receivenoise_receiverID);
        sqlSession.commit();
        return result;
    }
}
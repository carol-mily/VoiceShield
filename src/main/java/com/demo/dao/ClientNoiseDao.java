package com.demo.dao;
import com.demo.dao.mapper.ClientNoiseMapper;
import com.demo.entity.ClientNoise;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ClientNoiseDao {
    private SqlSession sqlSession;
    private ClientNoiseMapper mapper;

    public ClientNoiseDao() {
        sqlSession = DBTools.getSqlSession();
        mapper = sqlSession.getMapper(ClientNoiseMapper.class);
    }

    public int add(ClientNoise entity) throws Exception {
        //调用数据库操作函数后需要commit才会提交
        int result = mapper.add(entity);
        sqlSession.commit();
        return result;
    }

    public int delete(String client_usernoise_ID) throws Exception {
        int result = mapper.delete(client_usernoise_ID);
        sqlSession.commit();
        return result;
    }

    public int update(ClientNoise entity) throws Exception {
        int result = mapper.update(entity);
        sqlSession.commit();
        return result;
    }

    public ClientNoise get(String client_usernoise_ID) throws Exception {
        ClientNoise result = mapper.get(client_usernoise_ID);
        sqlSession.commit();
        return result;
    }

    public List<ClientNoise> list() throws Exception {
        List<ClientNoise> result = mapper.list();
        sqlSession.commit();
        return result;
    }
}
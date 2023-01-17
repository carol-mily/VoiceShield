package com.demo.dao;
import com.demo.dao.mapper.ClientMapper;
import com.demo.entity.Client;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class ClientDao {
    private SqlSession sqlSession;
    private ClientMapper mapper;

    public ClientDao() {
        sqlSession = DBTools.getSqlSession();
        mapper = sqlSession.getMapper(ClientMapper.class);
    }

    public int add(Client entity) throws Exception {
        //调用数据库操作函数后需要commit才会提交
        int result = mapper.add(entity);
        sqlSession.commit();
        return result;
    }

    public int delete(String client_user_Id) throws Exception {
        int result = mapper.delete(client_user_Id);
        sqlSession.commit();
        return result;
    }

    public int update(Client entity) throws Exception {
        int result = mapper.update(entity);
        sqlSession.commit();
        return result;
    }

    public Client get(String client_user_Id) throws Exception {
        Client result = mapper.get(client_user_Id);
        sqlSession.commit();
        return result;
    }

    public List<Client> list() throws Exception {
        List<Client> result = mapper.list();
        sqlSession.commit();
        return result;
    }

    public int change(Client entity)throws Exception{
        int result = mapper.change(entity);
        sqlSession.commit();
        return result;
    }

    public int editPassword(Client entity) throws Exception {
        int result = mapper.editPassword(entity);
        sqlSession.commit();
        return result;
    }
    public int setLoginState(Client entity) throws Exception {
        int result = mapper.setLoginState(entity);
        sqlSession.commit();
        return result;
    }
    public int Logout(String client_user_Id) throws Exception {
        int result = mapper.Logout(client_user_Id);
        sqlSession.commit();
        return result;
    }

    public int changeName(Client entity)throws Exception{
        int result = mapper.changeName(entity);
        sqlSession.commit();
        return result;
    }
    public int changeAdd(Client entity)throws Exception{
        int result = mapper.changeAdd(entity);
        sqlSession.commit();
        return result;
    }
    public int changeImage(Client entity)throws Exception{
        int result = mapper.changeImage(entity);
        sqlSession.commit();
        return result;
    }
    public List<Client> getOnState() throws Exception {
        List<Client> result = mapper.getOnState();
        sqlSession.commit();
        return result;
    }
}
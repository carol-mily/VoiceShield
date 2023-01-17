package com.demo.dao;
import com.demo.dao.mapper.UserMapper;
import com.demo.entity.User;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class UserDao {
    private SqlSession sqlSession;
    private UserMapper mapper;

    public UserDao() {
        sqlSession = DBTools.getSqlSession();
        mapper = sqlSession.getMapper(UserMapper.class);
    }

    public int add(User entity) throws Exception {
        //调用数据库操作函数后需要commit才会提交
        int result = mapper.add(entity);
        sqlSession.commit();
        return result;
    }

    public int delete(String username) throws Exception {
        int result = mapper.delete(username);
        sqlSession.commit();
        return result;
    }

    public int update(User entity) throws Exception {
        int result = mapper.update(entity);
        sqlSession.commit();
        return result;
    }

    public User get(String username) throws Exception {
        User result = mapper.get(username);
        sqlSession.commit();
        return result;
    }

    public List<User> list() throws Exception {
        List<User> result = mapper.list();
        sqlSession.commit();
        return result;
    }

    public int setlogtime(User entity) throws Exception{
        int result = mapper.setlogtime(entity);
        sqlSession.commit();
        return result;
    }
    public int changepw(User entity) throws Exception{
        int result = mapper.changepw(entity);
        sqlSession.commit();
        return result;
    }
}
package com.demo.dao;
import com.demo.dao.mapper.AdminHistoryMapper;
import com.demo.entity.AdminHistory;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class AdminHistoryDao {
    private SqlSession sqlSession;
    private AdminHistoryMapper mapper;

    public AdminHistoryDao() {
        sqlSession = DBTools.getSqlSession();
        mapper = sqlSession.getMapper(AdminHistoryMapper.class);
    }

    public int add(AdminHistory entity) throws Exception {
        //调用数据库操作函数后需要commit才会提交
        int result = mapper.add(entity);
        sqlSession.commit();
        return result;
    }

    public int delete(String admin_history_ID) throws Exception {
        int result = mapper.delete(admin_history_ID);
        sqlSession.commit();
        return result;
    }

    public int update(AdminHistory entity) throws Exception {
        int result = mapper.update(entity);
        sqlSession.commit();
        return result;
    }

    public AdminHistory get(String admin_history_ID) throws Exception {
        AdminHistory result = mapper.get(admin_history_ID);
        sqlSession.commit();
        return result;
    }

    public List<AdminHistory> list() throws Exception {
        List<AdminHistory> result = mapper.list();
        sqlSession.commit();
        return result;
    }
}
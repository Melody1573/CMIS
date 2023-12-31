package com.luo.xm.service;

import com.luo.xm.dao.AdminDaoInter;
import com.luo.xm.model.Admin;
import com.luo.xm.uitl.SqlSessionUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.Map;

public class AdminServiceImpl implements AdminService{
    /**
     * 登录方法
     */
    public Admin loginAdmin(Map<String,String> perMap){
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        AdminDaoInter mapper = sqlSession.getMapper(AdminDaoInter.class);
        Admin admin = mapper.loginAdmin(perMap);
        sqlSession.close();
        return admin;
    }
}

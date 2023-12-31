package com.luo.xm.service;

import com.luo.xm.dao.SubsidyDaoInter;
import com.luo.xm.model.Person;
import com.luo.xm.model.PersonSubsidyOV;
import com.luo.xm.model.Subsidy;
import com.luo.xm.uitl.SqlSessionUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 功能：
 * 作者：Luo。
 * 日期：2023/12/27 11:52
 */
public class SubsidyServiceImpl implements SubsidyService {
    @Override
    public List<Person> queryPeopleBySub(String attr) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        SubsidyDaoInter mapper = sqlSession.getMapper(SubsidyDaoInter.class);
        Map map = new HashMap<>();
        map.put("attr", attr);
        List<Person> list = mapper.queryPeopleBySub(map);
        sqlSession.close();
        return list;
    }

    @Override
    public int insertSub(Subsidy subsidy) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        SubsidyDaoInter mapper = sqlSession.getMapper(SubsidyDaoInter.class);
        int rows = mapper.insertSub(subsidy);
        sqlSession.commit();
        sqlSession.close();
        return rows;
    }

    @Override
    public List<PersonSubsidyOV> querySome(Map<String, Object> map) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        SubsidyDaoInter mapper = sqlSession.getMapper(SubsidyDaoInter.class);
        map.put("num",((int)map.get("num")-1)*(int)map.get("len"));
        List<PersonSubsidyOV> personSubsidyOVS = mapper.querySome(map);
        sqlSession.close();
        return personSubsidyOVS;
    }

    @Override
    public int querySomeCount(Map<String,Object> map){
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        SubsidyDaoInter mapper = sqlSession.getMapper(SubsidyDaoInter.class);
        int rows = mapper.querySomeCount(map);
        sqlSession.close();
        return rows;
    }

    @Override
    public int  deleteSome(List list){
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        SubsidyDaoInter mapper = sqlSession.getMapper(SubsidyDaoInter.class);
        int rows = mapper.deleteSome(list);
        sqlSession.commit();
        sqlSession.close();
        return rows;
    }

    @Override
    public int deleteOne(final int id) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        SubsidyDaoInter mapper = sqlSession.getMapper(SubsidyDaoInter.class);
        int rows = mapper.deleteOne(id);
        sqlSession.commit();
        sqlSession.close();
        return rows;
    }

    @Override
    public PersonSubsidyOV queryBySid(int id){
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        SubsidyDaoInter mapper = sqlSession.getMapper(SubsidyDaoInter.class);
        PersonSubsidyOV personSubsidyOV = mapper.queryBySid(id);
        sqlSession.close();
        return personSubsidyOV;
    }

    @Override
    public int updateSub(Subsidy subsidy) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        SubsidyDaoInter mapper = sqlSession.getMapper(SubsidyDaoInter.class);
        int rows = mapper.updateSub(subsidy);
        sqlSession.commit();
        sqlSession.close();
        return rows;
    }
}

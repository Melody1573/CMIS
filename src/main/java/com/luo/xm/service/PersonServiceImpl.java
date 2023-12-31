package com.luo.xm.service;

import com.luo.xm.dao.PersonDaoInter;
import com.luo.xm.model.Person;
import com.luo.xm.uitl.SqlSessionUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class PersonServiceImpl implements PersonService{
    /**
     * 根据code查询对象
     */
    public Person selectPersonByCode(String code) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        PersonDaoInter mapper = sqlSession.getMapper(PersonDaoInter.class);
        Person person1 = mapper.selectPersonByCode(code);
        sqlSession.close();
        return person1;
    }

    public int insertPersonOne(Person person) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        PersonDaoInter mapper = sqlSession.getMapper(PersonDaoInter.class);
        int rows = mapper.insertPersonOne(person);
        sqlSession.commit();
        sqlSession.close();
        return rows;
    }

    public List<Person> selectPersonAll(Map<String, Object> map) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        PersonDaoInter mapper = sqlSession.getMapper(PersonDaoInter.class);
        int num = Integer.parseInt((String) map.get("num")) - 1;
        int len = Integer.parseInt((String) map.get("len"));
        map.put("num", num * len);
        map.put("len", len);
        List<Person> peoples = mapper.selectPersonAll(map);
        sqlSession.close();
        return peoples;
    }

    public int maxPages(Map<String, Object> map) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        PersonDaoInter mapper = sqlSession.getMapper(PersonDaoInter.class);
        int rows = mapper.maxPages(map);
        return rows;
    }

    public int deleteSome(List<String> list){
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        PersonDaoInter mapper = sqlSession.getMapper(PersonDaoInter.class);
        int rows = mapper.deleteSome(list);
        sqlSession.commit();
        sqlSession.close();
        return rows;
    }

    public Person selectPersonById(int id) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        PersonDaoInter mapper = sqlSession.getMapper(PersonDaoInter.class);
        Person person1 = mapper.selectPersonById(id);
        sqlSession.commit();
        sqlSession.close();
        return person1;
    }

    public int updatePerson(Person person){
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        PersonDaoInter mapper = sqlSession.getMapper(PersonDaoInter.class);
        int rows = mapper.updatePerson(person);
        sqlSession.commit();
        sqlSession.close();
        return rows;
    }

    @Override
    public int updateSelectCode(Map<String,String> map) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        PersonDaoInter mapper = sqlSession.getMapper(PersonDaoInter.class);
        int rows = mapper.updateSelectCode(map);
        sqlSession.commit();
        sqlSession.close();
        return rows;
    }

    @Override
    public int insertSomeByExcel(List<Person> personList) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        PersonDaoInter mapper = sqlSession.getMapper(PersonDaoInter.class);
        int rows = mapper.insertSomeByExcel(personList);
        sqlSession.commit();
        sqlSession.close();
        return rows;
    }

    @Override
    public List<String> queryCode(){
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();
        PersonDaoInter mapper = sqlSession.getMapper(PersonDaoInter.class);
        List<String> list = mapper.queryCode();
        sqlSession.commit();
        sqlSession.close();
        return list;
    }
}

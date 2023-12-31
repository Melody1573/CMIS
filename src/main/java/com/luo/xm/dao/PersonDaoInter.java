package com.luo.xm.dao;

import com.luo.xm.model.Person;

import java.util.List;
import java.util.Map;

public interface PersonDaoInter {
    public Person selectPersonByCode(String code);

    public int insertPersonOne(Person person);

    public List<Person> selectPersonAll(Map<String,Object> map);

    public int maxPages(Map<String,Object> map);

    public int deleteSome(List<String> list);

    public Person selectPersonById(int id);

    public int updatePerson(Person person);

    public int updateSelectCode(Map<String,String> map);

    public int insertSomeByExcel(List<Person> personList);

    public List<String> queryCode();
}

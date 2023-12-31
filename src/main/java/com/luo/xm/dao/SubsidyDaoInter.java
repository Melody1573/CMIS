package com.luo.xm.dao;

import com.luo.xm.model.Person;
import com.luo.xm.model.PersonSubsidyOV;
import com.luo.xm.model.Subsidy;

import java.util.List;
import java.util.Map;

public interface SubsidyDaoInter {
    public List<Person> queryPeopleBySub(Map<String,String> map);

    public int insertSub(Subsidy subsidy);

    public List<PersonSubsidyOV> querySome(Map<String,Object> map);

    public int querySomeCount(Map<String,Object> map);

    public int  deleteSome(List list);

    public PersonSubsidyOV queryBySid(int id);

    public int updateSub(Subsidy subsidy);

    public int deleteOne(int id);
}

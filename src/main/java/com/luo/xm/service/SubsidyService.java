package com.luo.xm.service;

import com.luo.xm.model.Person;
import com.luo.xm.model.PersonSubsidyOV;
import com.luo.xm.model.SubTimes;
import com.luo.xm.model.Subsidy;

import java.util.List;
import java.util.Map;

public interface SubsidyService {
    public List<Person> queryPeopleBySub(String attr);

    public int insertSub(Subsidy subsidy);

    public List<PersonSubsidyOV> querySome(Map<String,Object> map);

    public int querySomeCount(Map<String,Object> map);

    public int  deleteSome(List list);

    public int deleteOne(int id);

    public PersonSubsidyOV queryBySid(int id);

    public int updateSub(Subsidy subsidy);

    public SubTimes selectCountH(SubTimes subTimes);
}

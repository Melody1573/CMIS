package com.luo.xm.service;

import com.luo.xm.model.Admin;

import java.util.Map;

public interface AdminService {
    public Admin loginAdmin(Map<String,String> perMap);
}

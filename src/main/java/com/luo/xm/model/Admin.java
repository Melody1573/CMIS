package com.luo.xm.model;

public class Admin {
    private int id;
    private String loginName;
    private String passWord;
    private String createTime;

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(final String loginName) {
        this.loginName = loginName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(final String passWord) {
        this.passWord = passWord;
    }

    public int getId() {
        return id;
    }

    public void setId(final int id) {
        this.id = id;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(final String createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "id=" + id +
                ", loginName='" + loginName + '\'' +
                ", passWord='" + passWord + '\'' +
                ", createTime='" + createTime + '\'' +
                '}';
    }
}

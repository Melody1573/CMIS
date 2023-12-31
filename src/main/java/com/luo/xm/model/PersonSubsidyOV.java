package com.luo.xm.model;

import java.math.BigDecimal;

/**
 * 功能：
 * 作者：Luo。
 * 日期：2023/12/27 11:46
 */
public class PersonSubsidyOV {
    private int pid;
    private String name;
    private String code;
    private String unit;
    private int state;
    private int grade;
    private int estate;
    private int heating;
    private String reason;
    private String month;
    private BigDecimal money;
    private int type;
    private int sid;

    public int getPid() {
        return pid;
    }

    public void setPid(final int pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(final String name) {
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(final String code) {
        this.code = code;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(final String unit) {
        this.unit = unit;
    }

    public int getState() {
        return state;
    }

    public void setState(final int state) {
        this.state = state;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(final int grade) {
        this.grade = grade;
    }

    public int getEstate() {
        return estate;
    }

    public void setEstate(final int estate) {
        this.estate = estate;
    }

    public int getHeating() {
        return heating;
    }

    public void setHeating(final int heating) {
        this.heating = heating;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(final String reason) {
        this.reason = reason;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(final String month) {
        this.month = month;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(final BigDecimal money) {
        this.money = money;
    }

    public int getType() {
        return type;
    }

    public void setType(final int type) {
        this.type = type;
    }

    public int getSid() {
        return sid;
    }

    public void setSid(final int sid) {
        this.sid = sid;
    }

    @Override
    public String toString() {
        return "PersonSubsidyOV{" +
                "pid=" + pid +
                ", name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", unit='" + unit + '\'' +
                ", state=" + state +
                ", grade=" + grade +
                ", estate=" + estate +
                ", heating=" + heating +
                ", reason='" + reason + '\'' +
                ", month='" + month + '\'' +
                ", money=" + money +
                ", type=" + type +
                ", sid=" + sid +
                '}';
    }
}

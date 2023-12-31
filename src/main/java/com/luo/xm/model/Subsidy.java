package com.luo.xm.model;

import java.math.BigDecimal;

/**
 * 功能：
 * 作者：Luo。
 * 日期：2023/12/27 15:52
 */
public class Subsidy {
    private int id;
    private int personId;
    private String month;
    private BigDecimal money;
    private int type;
    private String reason;

    public int getId() {
        return id;
    }

    public void setId(final int id) {
        this.id = id;
    }

    public int getPersonId() {
        return personId;
    }

    public void setPersonId(final int personId) {
        this.personId = personId;
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

    public String getReason() {
        return reason;
    }

    public void setReason(final String reason) {
        this.reason = reason;
    }

    @Override
    public String toString() {
        return "Subsidy{" +
                "id=" + id +
                ", personId=" + personId +
                ", month='" + month + '\'' +
                ", money=" + money +
                ", type=" + type +
                ", reason='" + reason + '\'' +
                '}';
    }
}

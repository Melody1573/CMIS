package com.luo.xm.model;

/**
 * 功能：
 * 作者：Luo。
 * 日期：2024/1/3 9:33
 */
public class SubTimes {
    private String year;
    private String month;
    private String personCount;
    private String sumMoney;
    private String type;

    public String getType() {
        return type;
    }

    public void setType(final String type) {
        this.type = type;
    }

    public String getYear() {
        return year;
    }

    public void setYear(final String year) {
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(final String month) {
        this.month = month;
    }

    public String getPersonCount() {
        return personCount;
    }

    public void setPersonCount(final String personCount) {
        this.personCount = personCount;
    }

    public String getSumMoney() {
        return sumMoney;
    }

    public void setSumMoney(final String sumMoney) {
        this.sumMoney = sumMoney;
    }

    @Override
    public String toString() {
        return "SubTimes{" +
                "year='" + year + '\'' +
                ", month='" + month + '\'' +
                ", personCount='" + personCount + '\'' +
                ", sumMoney='" + sumMoney + '\'' +
                '}';
    }
}

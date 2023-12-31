package com.luo.xm.model;

public class Person {
    private int id;
    private String name;
    private String code;
    private String unit;
    private int state;
    private int grade;
    private int estate;
    private int heating;
    private String reason;

    @Override
    public String toString() {
        return "Person{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", unit='" + unit + '\'' +
                ", state=" + state +
                ", grade=" + grade +
                ", estate=" + estate +
                ", heating=" + heating +
                ", reason='" + reason + '\'' +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(final int id) {
        this.id = id;
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
}

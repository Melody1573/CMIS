package com.luo.xm.model;

import java.util.List;

/**
 * 功能：
 * 作者：Luo。
 * 日期：2024/1/3 16:21
 */
public class HintJson {
    private String code;
    private String msg;
    private List array;

    public String getCode() {
        return code;
    }

    public void setCode(final String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(final String msg) {
        this.msg = msg;
    }

    public List getArray() {
        return array;
    }

    public void setArray(final List array) {
        this.array = array;
    }

    @Override
    public String toString() {
        return "HintJson{" +
                "code='" + code + '\'' +
                ", msg='" + msg + '\'' +
                ", array=" + array +
                '}';
    }
}

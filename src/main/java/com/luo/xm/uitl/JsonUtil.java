package com.luo.xm.uitl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import javax.servlet.http.HttpServletResponse;

/**
 * 功能：
 * 作者：Luo。
 * 日期：2023/12/27 14:20
 */
public class JsonUtil {
    public static void transJson(Object obj, HttpServletResponse resp){
        try {
            //数据转成json格式
            String josn_string = JSON.toJSONString(obj,SerializerFeature.WriteNullListAsEmpty);
            System.out.println("JsonUtil.java:"+obj);
            System.out.println("JsonUtil.java:"+josn_string);
            //设置文字编码
            resp.setContentType("application/json;charset=utf-8");
            //响应给浏览器
            resp.getWriter().write(josn_string);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}

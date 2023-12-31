package com.luo.xm.controller;

import com.luo.xm.model.Person;
import com.luo.xm.model.PersonSubsidyOV;
import com.luo.xm.model.Subsidy;
import com.luo.xm.service.SubsidyService;
import com.luo.xm.service.SubsidyServiceImpl;
import com.luo.xm.uitl.JsonUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 功能：
 * 作者：Luo。
 * 日期：2023/12/27 10:43
 */
@WebServlet(urlPatterns = "/subsidyManage.do")
public class SubsidyManage extends HttpServlet {
    SubsidyService service = new SubsidyServiceImpl();

    @Override
    protected void service(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        String flag = req.getParameter("subsidyFlag");
        String type = req.getParameter("type");
        System.out.println(flag);
        System.out.println(type);
        if ("goSublist".equals(flag)) {
            //跳转补贴页面并做模糊查询
            //1.获取模糊值与页面信息
            String num = req.getParameter("num");
            String len = req.getParameter("len");
            String name = req.getParameter("name");
            String code = req.getParameter("code");
            String month = req.getParameter("month");
            if (num == "" || num == null) {
                num = "1";
            }
            if (len == "" || len == null) {
                len = "10";
            }
            // if (name != null || name != "" || code != null || code != "" ||  month != null || month != ""){
            //     num = "1";
            // }
            if (name != "" ||code != "" || month != ""){
                num = "1";
            }
            Map<String, Object> map = new HashMap<>();
            map.put("type", Integer.parseInt(type));
            map.put("num", Integer.parseInt(num));
            map.put("len", Integer.parseInt(len));
            map.put("name", name);
            map.put("code", code);
            map.put("month", month);
            //2.根据信息进行查询
            List<PersonSubsidyOV> personSubsidyOVS = service.querySome(map);
            int rows = service.querySomeCount(map);
            //3.将查询信息保存
            int count = (int) Math.ceil((double) rows / Integer.parseInt(len));
            req.setAttribute("type", type);
            req.setAttribute("num", num);
            req.setAttribute("len", len);
            req.setAttribute("rows", rows);
            req.setAttribute("count", count);
            req.setAttribute("name", name);
            req.setAttribute("code", code);
            req.setAttribute("month", month);
            req.setAttribute("personSubsidyOVS", personSubsidyOVS);
            //4.返回到前端页面
            req.getRequestDispatcher("view/person/subList.jsp").forward(req, resp);
            return;
        } else if ("addSub".equals(flag)) {
            //跳转添加补贴页面
            req.setAttribute("type", type);
            req.getRequestDispatcher("view/person/addSub.jsp").forward(req, resp);
            return;
        } else if ("subsidy".equals(flag)) {
            //查询人员列表
            if ("1".equals(type)) {
                //查询物业补贴人员列表
                List<Person> list = service.queryPeopleBySub("estate");
                JsonUtil.transJson(list, resp);
                return;
            } else if ("2".equals(type)) {
                List<Person> list = service.queryPeopleBySub("heating");
                JsonUtil.transJson(list, resp);
                return;
            } else {
                return;
            }
        } else if ("addSubSubmit".equals(flag)) {
            //添加补贴项
            PrintWriter writer = resp.getWriter();
            //获取一下值
            String personId = req.getParameter("personId");
            String money = req.getParameter("money");
            String reason = req.getParameter("reason");
            String month = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            //存入实体类
            Subsidy subsidy = new Subsidy();
            subsidy.setPersonId(Integer.parseInt(personId));
            subsidy.setMoney(new BigDecimal(money));
            subsidy.setReason(reason);
            subsidy.setMonth(month + "");
            subsidy.setType(Integer.parseInt(type));
            if ("1".equals(type)) {
                //写Sql方法
                int rows = service.insertSub(subsidy);
                //返回值
                writer.write(rows + "");
                return;
            } else if ("2".equals(type)) {
                //写Sql方法
                int rows = service.insertSub(subsidy);
                //返回值
                writer.write(rows + "");
                return;
            } else {
                return;
            }
        }else if ("deleteSome".equals(flag)){
            //1.获取删除id
            String checks = req.getParameter("checks");
            String[] split = checks.split(",");
            List<String> list = Arrays.asList(split);
            resp.setCharacterEncoding("utf8");
            PrintWriter writer = resp.getWriter();
            //2.校验id
            if (list.get(0).equals("")){
                writer.write("失败！");
                writer.close();
                return;
            }
            //3.进行sql
            int rows = service.deleteSome(list);
            //4.返回
            if(rows>0){
                writer.write("成功！");
            }else {
                writer.write("失败！");
            }
            writer.close();
            return;
        }else if ("goUpdate".equals(flag)){
            //1.获取id值
            String id = req.getParameter("id");
            //2.对id值进行查询
            PersonSubsidyOV personSubsidyOV = service.queryBySid(Integer.parseInt(id));
            //3.将查询得到的值返还到页面中
            req.setAttribute("personSubsidyOV",personSubsidyOV);
            req.setAttribute("type",type);
            //4.转发到update页面中
            req.getRequestDispatcher("view/person/updateSub.jsp").forward(req,resp);
            return;
        }else if ("update".equals(flag)){
            //1.获取相关信息
            String sid = req.getParameter("subId");
            String money = req.getParameter("money");
            String reason = req.getParameter("reason");
            PrintWriter writer = resp.getWriter();
            //2.对值进行校验
            if (sid == "" || money == ""){
                writer.write("0");
                writer.close();
                return;
            }
            //3.调用update语句
            Subsidy subsidy = new Subsidy();
            subsidy.setId(Integer.parseInt(sid));
            subsidy.setMoney(new BigDecimal(money));
            subsidy.setReason(reason);
            int rows = service.updateSub(subsidy);
            //4.发出提示信息
            writer.write(rows+"");
            writer.close();
        }else if ("deleteOne".equals(flag)){
            String id = req.getParameter("id");
            resp.setCharacterEncoding("utf8");
            PrintWriter writer = resp.getWriter();
            if (id == null || id == ""){
                writer.write("0");
                writer.close();
                return;
            }
            int rows = service.deleteOne(Integer.parseInt(id));
            if (rows > 0){
                writer.write("删除成功");
            }else{
                writer.write("删除失败");
            }
            writer.close();
            return;
        }
    }
}

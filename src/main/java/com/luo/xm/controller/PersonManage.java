package com.luo.xm.controller;

import com.luo.xm.model.Person;
import com.luo.xm.service.PersonServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/personManage.do")
public class PersonManage extends HttpServlet {
    @Override
    protected void service(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf8");
        String flag = req.getParameter("personFlag");
        System.out.println(flag);
        PersonServiceImpl personService = new PersonServiceImpl();
        if ("index".equals(flag) || "query".equals(flag)) {
            /**
             * 跳转到人员管理页面
             */
            //初始化列表中的值
            String num = req.getParameter("num");
            String len = req.getParameter("len");
            if (num == null || num == "") {
                num = "1";
            }
            if (len == null || len == "") {
                len = "10";
            }
            //获取初始页和每页条数
            Map<String, Object> map = new HashMap<>();
            map.put("num", num);
            map.put("len", len);
            //初始化模糊查询值
            String name = req.getParameter("name");
            String code = req.getParameter("code");
            String state = req.getParameter("state");
            String grade = req.getParameter("grade");
            String heating = req.getParameter("heating");
            String estate = req.getParameter("estate");
            map.put("name", name);
            map.put("code", code);
            map.put("state", state);
            map.put("grade", grade);
            map.put("heating", heating);
            map.put("estate", estate);
            //进行查询
            List<Person> personList = personService.selectPersonAll(map);
            int rows = personService.maxPages(map);
            //数据处理并转发
            int count = (int) Math.ceil((double) rows / Integer.parseInt(len));
            req.setAttribute("personList", personList);
            req.setAttribute("num", num);
            req.setAttribute("len", len);
            req.setAttribute("rows", rows);
            req.setAttribute("count", count);
            req.setAttribute("name", name);
            req.setAttribute("code", code);
            req.setAttribute("state", state);
            req.setAttribute("grade", grade);
            req.setAttribute("heating", heating);
            req.setAttribute("estate", estate);
            req.getRequestDispatcher("/view/person/personList.jsp?num=" + num + "&len=" + len).forward(req, resp);
            return;
        } else if ("add".equals(flag)) {
            /**
             * 跳转添加成员页面
             */
            req.getRequestDispatcher("/view/person/addPerson.jsp").forward(req, resp);
            return;
        } else if ("selectByCode".equals(flag)) {
            /**
             * 根据身份证号查询
             */
            String code = req.getParameter("code");
            Person person = personService.selectPersonByCode(code);
            PrintWriter writer = resp.getWriter();
            if (person == null) {
                writer.write("true");
            } else {
                writer.write("false");
            }
            writer.close();
            return;
        } else if ("insertPerson".equals(flag)) {
            /**
             * 添加成员
             */
            PrintWriter writer = resp.getWriter();
            //获取表单的提交数据
            String name = req.getParameter("name");
            String code = req.getParameter("code");
            String unit = req.getParameter("unit");
            String state = req.getParameter("state");
            String grade = req.getParameter("grade");
            String subsidy = req.getParameter("subsidy");
            String reason = req.getParameter("reason");
            String[] subsidys = subsidy.split(",");
            //数据校验
            if (name == null || name == "") {
                writer.write("-1");
                writer.close();
                return;
            } else if (code == null || code == "" || code.getBytes().length != 18) {
                writer.write("-2");
                writer.close();
                return;
            } else if ("0".equals(state) || state == "" || state == null) {
                writer.write("-3");
                writer.close();
                return;
            } else if ("0".equals(grade) || grade == "" || grade == null) {
                writer.write("-4");
                writer.close();
                return;
            } else if (subsidys[0] == "" || subsidys[0] == null) {
                writer.write("-5");
                writer.close();
                return;
            }
            //执行添加sql语句
            Person person = new Person();
            person.setName(name);
            person.setCode(code);
            person.setUnit(unit);
            person.setState(Integer.parseInt(state));
            person.setGrade(Integer.parseInt(grade));
            if (subsidys.length >= 2) {
                person.setHeating(1);
                person.setEstate(1);
            } else {
                if ("1".equals(subsidys[0])) {
                    person.setHeating(1);
                } else if ("2".equals(subsidys[0])) {
                    person.setEstate(1);
                }
            }
            person.setReason(reason);
            int rows = new PersonServiceImpl().insertPersonOne(person);
            writer.write(rows + "");
            writer.close();
            return;
        } else if ("deleteSome".equals(flag)) {
            //批量删除
            String checkeds = req.getParameter("checkeds");
            String[] split = checkeds.split(",");
            List<String> list = Arrays.asList(split);
            int rows = personService.deleteSome(list);
            PrintWriter writer = resp.getWriter();
            writer.write(rows + "");
            writer.close();
            return;
        } else if ("updatePerson".equals(flag)) {
            //进入更新人员信息页面
            //1.获取当前人的id
            String id = req.getParameter("id");
            //2.在数据库中用该id查询
            Person person = personService.selectPersonById(Integer.parseInt(id));
            //3.将查询得到的值返回到页面
            req.setAttribute("person", person);
            //4.跳转到页面
            req.getRequestDispatcher("/view/person/updatePerson.jsp").forward(req, resp);
            return;
        } else if ("updatePersonSubmit".equals(flag)) {
            //根据修改的信息对信息进行修改
            //1.点击按钮后获取页面中的所有信息
            String id = req.getParameter("id");
            String name = req.getParameter("name");
            String code = req.getParameter("code");
            String unit = req.getParameter("unit");
            String state = req.getParameter("state");
            String grade = req.getParameter("grade");
            String[] subsidy = req.getParameterValues("subsidy");
            String reason = req.getParameter("reason");
            //2.将其封装成对象
            Person person = new Person();
            person.setId(Integer.parseInt(id));
            person.setName(name);
            person.setCode(code);
            person.setUnit(unit);
            person.setState(Integer.parseInt(state));
            person.setGrade(Integer.parseInt(grade));
            if (subsidy.length >= 2) {
                person.setHeating(1);
                person.setEstate(1);
            } else {
                if ("1".equals(subsidy[0])) {
                    person.setHeating(1);
                } else if ("2".equals(subsidy[0])) {
                    person.setEstate(1);
                }
            }
            person.setReason(reason);
            //3.使用update语句修改
            int rows = personService.updatePerson(person);
            //4.返回修改成功并跳转回页面
            PrintWriter writer = resp.getWriter();
            writer.write(rows + "");
            writer.close();
            return;
        } else if ("updatePersonCode".equals(flag)) {
            //对身份证进行校验
            String code = req.getParameter("code");
            String id = req.getParameter("id");
            Map<String, String> map = new HashMap<>();
            map.put("code", code);
            map.put("id", id);
            int rows = personService.updateSelectCode(map);
            PrintWriter writer = resp.getWriter();
            if (rows > 0) {
                writer.write("false");
            } else {
                writer.write("true");
            }
            writer.close();
            return;
        }
    }
}

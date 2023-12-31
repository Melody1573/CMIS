package com.luo.xm.controller;

import com.luo.xm.model.Admin;
import com.luo.xm.service.AdminServiceImpl;
import com.luo.xm.uitl.BASE64Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = "/LoginServlet.do")
public class LoginServlet extends HttpServlet {
    @Override
    protected void service(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        /*
         * 点击登录后执行的方法
         * */
        //0.从前端获取业务类型,若为L则为点击按钮登录事件
        //0.1否则则为跳转登录事件
        String type = req.getParameter("type");
        if ("L".equals(type)) {
            //1.获取账号和密码值
            String loginName = req.getParameter("userName");
            String passWord = req.getParameter("password");
            //1.1判断用户名密码是否为空
            if (loginName == null || loginName == "" || passWord == null || passWord == "") {
                return;
            }
            //1.2将密码使用密文处理
            String encoder = BASE64Util.Encoder(passWord);
            //1.3将用户名密码存入map
            Map perMap = new HashMap();
            perMap.put("loginName", loginName);
            perMap.put("passWord", encoder);
            //2.通过查询数据库查看是否存在该对象
            AdminServiceImpl adminService = new AdminServiceImpl();
            Admin admin = adminService.loginAdmin(perMap);
            //3.如果不存在则输出提示并return
            //4.如果存在则进行登录跳转并进行登录前的一系列操作
            if (admin == null) {
                req.getRequestDispatcher("/login.jsp?bool=fal").forward(req,resp);
                return;
            } else {
                req.getSession().setAttribute("loginFlag", "true");
                resp.sendRedirect(req.getContextPath()+"/IndexServlet.do?indexFlag=login");
                return;
            }
        } else {
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }
}

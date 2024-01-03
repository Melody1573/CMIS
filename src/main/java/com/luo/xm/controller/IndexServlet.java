package com.luo.xm.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/IndexServlet.do")
public class IndexServlet extends HttpServlet {

    @Override
    protected void service(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        String indexFlag = req.getParameter("indexFlag");
        HttpSession session = req.getSession();
        String flag = (String) session.getAttribute("loginFlag");
        //如果标志位是indexFlag则说明是由登录跳转来的
        if ("login".equals(indexFlag) && "true".equals(flag)) {
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        } else {
            resp.sendRedirect(req.getContextPath() + "/LoginServlet.do");
            return;
        }
    }
}

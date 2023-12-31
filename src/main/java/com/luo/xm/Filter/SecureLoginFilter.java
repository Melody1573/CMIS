package com.luo.xm.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "secureLoginFilter", urlPatterns = "/IndexServlet.do")
public class SecureLoginFilter implements Filter{
    @Override
    public void init(final FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(final ServletRequest servletRequest, final ServletResponse servletResponse, final FilterChain filterChain) throws IOException, ServletException {
        /**
         * 判断当前Session是否存在登录对象,若存在则允许访问,否则退出到登录界面
         */
        //1.当Session过期时返回页面得到登陆页面
        HttpServletResponse resp = (HttpServletResponse)servletResponse;
        HttpServletRequest req = (HttpServletRequest)servletRequest;
        HttpSession session = req.getSession();
        session.setMaxInactiveInterval(600);
        if (session.isNew()){
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
            return;
        }
        filterChain.doFilter(servletRequest,servletResponse);
    }

    @Override
    public void destroy() {
    }
}

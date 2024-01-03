package com.luo.xm.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// @WebFilter(filterName = "encodingFilter", urlPatterns = "/*", initParams = {
//         @WebInitParam(name = "encoding", value = "utf8")
// })
@WebFilter(filterName = "encodingFilter", urlPatterns = "/*")
public class EncodingFilter implements Filter {
    String encoding = "utf8";

    @Override
    public void init(final FilterConfig filterConfig) throws ServletException {
        encoding = filterConfig.getInitParameter("encoding");
        encoding = "utf8";
    }

    @Override
    public void doFilter(final ServletRequest servletRequest, final ServletResponse servletResponse, final FilterChain filterChain) throws IOException, ServletException {
        /**
         * 对请求对象统一设置编码为utf8
         */
        HttpServletRequest httpServletRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpServletResponse = (HttpServletResponse) servletResponse;
        httpServletRequest.setCharacterEncoding(encoding);
        // httpServletResponse.setContentType("text/html;charset=utf8");
        httpServletResponse.setCharacterEncoding(encoding);
        filterChain.doFilter(httpServletRequest, httpServletResponse);
    }

    @Override
    public void destroy() {

    }
}

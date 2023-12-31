package com.luo.xm.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.util.HashMap;
import java.util.Map;

@WebListener
public class MapContextListener implements ServletContextListener {
    Map<Integer,String> grade = new HashMap<>();
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        grade.put(1, "省级正职");
        grade.put(2, "省级副职");
        grade.put(3, "厅级正职");
        grade.put(4, "厅级副职");
        grade.put(5, "县级正职");
        grade.put(6, "县级副职");
        sce.getServletContext().setAttribute("grades",grade);
    }
}

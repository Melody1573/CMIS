package com.luo.xm.controller;

import com.luo.xm.model.SubTimes;
import com.luo.xm.service.SubsidyService;
import com.luo.xm.service.SubsidyServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

/**
 * 功能：
 * 作者：Luo。
 * 日期：2024/1/3 9:57
 */
@WebServlet(urlPatterns = "/mainServlet.do")
public class mainServlet extends HttpServlet {
    SubsidyService service = new SubsidyServiceImpl();

    @Override
    protected void service(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        String flag = req.getParameter("mainFlag");
        if ("index".equals(flag)) {
            SubTimes subTimes = new SubTimes();
            // 获取当前日期
            LocalDate currentDate = LocalDate.now();
            int currentMonth = currentDate.getMonthValue();
            int currentYear = currentDate.getYear();
            subTimes.setMonth(String.valueOf(currentMonth));
            subTimes.setYear(String.valueOf(currentYear));
            //本月物业信息
            subTimes.setType("1");
            SubTimes subE = service.selectCountH(subTimes);
            req.setAttribute("subE", subE);
            //本月供暖信息
            subTimes.setType("2");
            SubTimes subH = service.selectCountH(subTimes);
            req.setAttribute("subH", subH);

            subTimes.setMonth(String.valueOf(currentMonth - 1 == 0 ? 12 : currentMonth - 1));
            subTimes.setYear(String.valueOf(currentYear - 1));
            //上月物业信息
            subTimes.setType("1");
            SubTimes subELast = service.selectCountH(subTimes);
            req.setAttribute("subELast", subELast);
            //上月供暖信息
            subTimes.setType("2");
            SubTimes subHLast = service.selectCountH(subTimes);
            req.setAttribute("subHLast", subHLast);

            req.setAttribute("month", currentMonth);
            req.getRequestDispatcher("main.jsp").forward(req, resp);
            return;
        }
    }
}

package com.luo.xm.controller;

import com.luo.xm.model.Person;
import com.luo.xm.service.PersonServiceImpl;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * 功能：
 * 作者：Luo。
 * 日期：2023/12/29 9:23
 */
@WebServlet(urlPatterns = "/personExpand")
@MultipartConfig
public class PersonExpand extends HttpServlet {
    @Override
    protected void service(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        PersonServiceImpl personService = new PersonServiceImpl();
        String type = req.getParameter("type");
        if ("addSomePerson".equals(type)) {
            try {
                //1.获取文件
                resp.setCharacterEncoding("utf8");
                Part filePart = req.getPart("file");
                //2.文件非空校验
                if (filePart == null){
                    resp.getWriter().println("文件不能为空");
                    resp.getWriter().close();
                    return;
                }
                //3.获取流
                InputStream fileContent = filePart.getInputStream();
                //4.获取文件名
                String str = filePart.getSubmittedFileName();
                String[] split = str.split("\\.");
                Workbook sheets;
                //4.判断文件后缀
                if ("xlsx".equals(split[split.length-1])){
                    //excel2007+版本解析
                    sheets = new XSSFWorkbook(fileContent);
                }else if ("xls".equals(split[split.length-1])){
                    //excel197-2003版本解析
                    sheets = new XSSFWorkbook(fileContent);
                }else{
                    resp.getWriter().println("文件格式有误");
                    resp.getWriter().close();
                    return;
                }
                //5.获取sheet页
                Sheet sheetAt = sheets.getSheetAt(0);
                //6.读取每行中的列
                List<Person> list = new ArrayList<>();
                for (int i = 0; i <= sheetAt.getLastRowNum(); i++) {
                    //7.拿到每一行
                    Row row = sheetAt.getRow(i);
                    Person person = new Person();
                    //8.对象封装
                    for (int j = 0; j < row.getLastCellNum(); j++) {
                        Cell cell = row.getCell(j);
                        switch (j) {
                            case 0:
                                person.setName(cell.toString());
                                break;
                            case 1:
                                person.setCode(cell.toString());
                                break;
                            case 2:
                                person.setUnit(cell.toString());
                                break;
                            case 3:
                                person.setState((int)cell.getNumericCellValue());
                                break;
                            case 4:
                                person.setGrade((int)cell.getNumericCellValue());
                                break;
                            case 5:
                                person.setEstate((int)cell.getNumericCellValue());
                                break;
                            case 6:
                                person.setHeating((int)cell.getNumericCellValue());
                                break;
                            case 7:
                                person.setReason(cell.toString());
                                break;
                        }
                    }
                    //9.添加到列表
                    list.add(person);
                }
                //10.数据库查询所有code
                List<String> allCode = personService.queryCode();
                List<String> fileCode = list.stream().map(s -> s.getCode()).collect(Collectors.toList());
                //11.对比数据库所有code和批量code是否有重复
                allCode.retainAll(fileCode);
                if (!allCode.isEmpty()){
                    resp.getWriter().println("已有身份证信息和添加文件中的身份证信息重复");
                    resp.getWriter().close();
                    return;
                }
                //12.执行sql并将值返回
                int rows = personService.insertSomeByExcel(list);
                if (rows > 0){
                    resp.getWriter().println("成功啦");
                }else{
                    resp.getWriter().println("失败啦");
                }
                //13.关闭相关流
                sheets.close();
                fileContent.close();
                resp.getWriter().close();
            } catch (Exception e) {
                e.printStackTrace();
                resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                resp.getWriter().println("报错啦");
                resp.getWriter().close();
            }
        }
    }
}

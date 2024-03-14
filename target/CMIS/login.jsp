<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>登录</title>
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="static/css/style.min.css" rel="stylesheet">
    <link href="static/css/login.min.css" rel="stylesheet">
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>
</head>
<body class="signin">
<div class="signinpanel">
    <div class="row">
        <div class="col-sm-7">
            <div class="signin-info">
                <div class="logopanel m-b">
                </div>
                <div class="m-b"></div>
                <h4 style="color: red">欢迎使用 <strong>人员补贴管理平台</strong></h4>

            </div>
        </div>
        <div class="col-sm-5">
            <form action="<%=request.getContextPath()%>/LoginServlet.do" method="post">
                <h4 class="no-margins">登录：</h4>
                <p class="m-t-md">登录到补贴发放管理系统</p>
                <input name="userName" type="text" class="form-control uname" placeholder="账号" />
                <input name="password" type="password" class="form-control pword m-b" placeholder="密码" />
                <!--<a href="">忘记密码了？</a>-->
                <%
                    //如果密码输入错误则提示错误信息
                    if("fal".equals(request.getParameter("bool"))){
                %>
                    <p style="color: red;font-size: 12px">账号或密码错误</p>
                <%
                    }
                %>
                <input type="hidden" name="type" value="L">
                <button type="submit" class="btn btn-success btn-block">登录</button>
            </form>
        </div>
    </div>
    <div class="signup-footer">
        <div class="pull-left">
            &copy; 2021 All Rights Reserved. Javakc
        </div>
    </div>
</div>
</body>
</html>


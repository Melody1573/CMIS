<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>补贴展示</title>
    <link href="static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="static/css/style.min.css?v=4.0.0" rel="stylesheet">
    <link href="static/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <script src="static/js/jquery.min.js?v=2.1.4"></script>
    <script src="static/js/bootstrap.min.js?v=3.3.5"></script>
    <script src="static/js/plugins/datapicker/bootstrap-datepicker.js"></script>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>${type==1?"物业":type==2?"供暖":"err"}补贴列表</h5>
                </div>
                <form role="form" class="form-inline" action="subsidyManage.do?subsidyFlag=goSublist" method="post">
                    <div class="ibox-content">
                        <input type="hidden" name="type" value="${type}"/>
                        <input type="hidden" name="currentSize" value=""/>
                        <input type="hidden" name="num" value="${num}"/>
                        <input type="hidden" name="len" value="${len}"/>
                        <div class="form-group">
                            <label class="font-noraml">人员名称</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" name="name" value="${name}" placeholder="请输入用户名"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="font-noraml">身份证号</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                <input type="text" name="code" value="${code}" placeholder="请输入身份证号"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="form-group" id="data">
                            <label class="font-noraml">补贴月份</label>
                            <div class="input-group date">
                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                <%-- <input type="date" pattern="yyyy-MM-dd" name="month" class="form-control" value="${params.month}">--%>
                                <input type="text" id="datepicker" class="form-control" name="month" value="${month}">
                            </div>
                        </div>
                        <button class="btn btn-success" type="submit">查询</button>
                        <button class="btn btn-primary" type="button" id="save"
                                onclick="window.location.href='<%=request.getContextPath()%>/subsidyManage.do?subsidyFlag=addSub&type=${type}'">
                            添加
                        </button>
                        <button class="btn btn-danger" type="button" id="batch">批删</button>

                    </div>
                    <div class="ibox-content">
                        <table class="table table-bordered table-striped table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th><input type="checkbox" id="checkAll">
                                    <button type="button" id="inverse">反选</button>
                                </th>
                                <th>月份</th>
                                <th>单位</th>
                                <th>姓名</th>
                                <th>身份证号</th>
                                <th>职级</th>
                                <th>金额</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%--这里使用forEach--%>
                            <c:forEach items="${personSubsidyOVS}" var="ov" varStatus="i">
                                <tr>
                                    <td>${(i.index+1)+len*num-len}</td>
                                    <td><input type="checkbox" id="${ov.sid}" class="checks"></td>
                                    <td>${ov.month}</td>
                                    <td>${ov.unit}</td>
                                    <td>${ov.name}</td>
                                    <td>${ov.code}</td>
                                    <td>${ov.grade}</td>
                                    <td>${ov.money}</td>
                                    <td>
                                        <a href="#" id="${ov.sid}" class="updateOne">更新</a>
                                        |
                                        <a href="#" id="${ov.sid}" class="deleteOne" name="${ov.name}">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </form>
                <div class="ibox-content">
                    <div class="btn-group">
                        <%--当前页大于0的情况下,有首页和上页按钮，否则没有--%>
                        <button class="btn btn-white" type="button">首页</button>
                        <button class="btn btn-white" type="button">上页</button>
                        <%--当当前页不等于或小于最大页时，并且总条数大于0时，有下页和末页按钮，否则没有。--%>
                        <button class="btn btn-white" type="button">下页</button>
                        <button class="btn btn-white" type="button">末页</button>
                        <button class="btn btn-danger" type="button" disabled>当前页${num}/总页数${count}/总条数${rows}</button>
                    </div>
                    <select class="form-control" name="pageSize">
                        <option value="10" ${len == 10 ? "selected" : ""}>每页10条</option>
                        <option value="20" ${len == 20 ? "selected" : ""}>每页20条</option>
                        <option value="30" ${len == 30 ? "selected" : ""}>每页30条</option>
                        <option value="40" ${len == 40 ? "selected" : ""}>每页40条</option>
                        <option value="50" ${len == 50 ? "selected" : ""}>每页50条</option>
                    </select>
                    <input class="form-control" id="goPage" type="number" value="${num}" placeholder="请输入跳转页码">
                </div>
            </div>
        </div>
    </div>
</div>

<script type="application/javascript">
    $(document).ready(function () {
        $(".btn-group>button").click(function () {
            let text = $(this).text()
            switch (text) {
                case "首页":
                    if ($("[name = num]").val() > 1) {
                        $("[name = num]").val(1)
                        $(".form-inline").submit()
                    } else {
                        alert("已是第一页")
                    }
                    break;
                case "末页":
                    if ($("[name = num]").val() < ${count}) {
                        $("[name = num]").val(${count})
                        $(".form-inline").submit()
                    } else {
                        alert("已是最后一页")
                    }
                    break;
                case "上页":
                    if ($("[name = num]").val() > 1) {
                        $("[name = num]").val(${num - 1})
                        $(".form-inline").submit()
                    } else {
                        alert("已是第一页")
                    }
                    break;
                case "下页":
                    if ($("[name = num]").val() < ${count}) {
                        $("[name = num]").val(${num + 1})
                        $(".form-inline").submit()
                    } else {
                        alert("已是最后一页")
                    }
                    break;
            }
        })

        $("[name=pageSize]").change(function () {
            $("[name=len]").val($(this).val())
            $("[name=num]").val(1)
            $(".form-inline").submit()
        })

        $("#goPage").change(function () {
            if ($(this).val() < 1) {
                $(this).val(1)
            } else if ($(this).val() > ${count}) {
                $(this).val(${count})
            }
            $("[name=num]").val($(this).val())
            $(".form-inline").submit()
        })

        $("#checkAll").change(function () {
            //获取自己的状态
            let bool = $(this).prop("checked");
            //将自己的状态复制给其他的复选框
            $(".checks").prop("checked", bool);
        })

        $("#inverse").click(function () {
            //遍历每个复选框并将其的值设置为相反的值
            $(".checks").each(function () {
                $(this).prop("checked", !$(this).prop("checked"))
            });
        })

        $("#batch").click(function () {
            //是否确认删除
            let r = confirm("是否确认删除")
            if (r == true) {
                let checkArr = [];
                $(".checks").each(function () {
                    if ($(this).prop("checked") == true) {
                        //得到id数组
                        checkArr.push($(this).attr("id"));
                    }
                })
                //数组序列化
                let checks = checkArr.join()
                //使用ajax将数据发送到后端进行删除
                $.ajax({
                    url: "subsidyManage.do",
                    method: "POST",
                    data: {
                        subsidyFlag: "deleteSome",
                        checks: checks
                    },
                    success: function (data) {
                        alert(data)
                        //删除完成后再次提交表单进行查询刷新
                        $(".form-inline").submit()
                    },
                    error: function (data) {
                        alert("删除失败")
                    }
                })
            }
        })

        $(".deleteOne").click(function () {
            let r = confirm("是否确认删除【" + $(this).attr("name")+"】")
            if (r == true) {
                //数组序列化
                let id = $(this).attr("id");
                //使用ajax将数据发送到后端进行删除
                $.ajax({
                    url: "subsidyManage.do",
                    method: "POST",
                    data: {
                        subsidyFlag: "deleteOne",
                        id: id
                    },
                    success: function (data) {
                        alert(data)
                        //删除完成后再次提交表单进行查询刷新
                        $(".form-inline").submit()
                    },
                    error: function (data) {
                        alert("删除失败")
                    }
                })
            }
        })

        $(".updateOne").click(function () {
            //1.获取id值
            let id = $(this).attr("id")
            //2.跳转到update页面
            window.location.href="subsidyManage.do?subsidyFlag=goUpdate&type=${type}&id="+id
        })
    });
</script>
</body>
</html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>人员管理1</title>
    <link href="./static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="./static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="./static/css/animate.min.css" rel="stylesheet">
    <link href="./static/css/style.min.css?v=4.0.0" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated">
    <div class="row">
        <div class="col-sm-12">
            <form role="form" class="form-inline" action="<%=request.getContextPath()%>/personManage.do" method="post"
                  enctype="application/x-www-form-urlencoded">
                <%--当前页--%>
                <%--<input type="hidden" name="currentSize" id="currentSize" value="">--%>
                <input type="hidden" name="personFlag" id="currentSize" value="query">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>人员管理</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>
                        </div>
                    </div>
                    <!--表格数据搜索 start-->
                    <div class="ibox-content" id="ibox-content-search">
                        <div class="row">
                            <div class="form-group">
                                <label class="font-noraml">姓名：</label>
                                <%--查询后保留条件值--%>
                                <input type="text" name="name" value="" placeholder="请输入姓名" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="font-noraml">身份证号：</label>
                                <input type="text" name="code" value="" placeholder="请输入身份证号" class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="font-noraml">状态：</label>
                                <label>
                                    <select class="form-control" name="state">
                                        <option value="">请选择</option>
                                        <option value="1">离休</option>
                                        <option value="2">退休</option>
                                    </select>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="font-noraml">职级：</label>
                                <label>
                                    <%--使用servletContext初始化数据--%>
                                    <select class="form-control" name="grade">
                                        <option value="">请选择</option>
                                        <c:forEach items="${grades}" var="g">
                                            <option value="${g.key}">${g.value}</option>
                                        </c:forEach>
                                    </select>
                                </label>
                            </div>
                            <div class="form-group">
                                <label class="font-noraml">项目：</label>
                                <div class="checkbox checkbox-inline">
                                    <input type="checkbox" id="checkbox1" name="heating" value="1"><label
                                        for="checkbox1">供暖</label>
                                </div>
                                <div class="checkbox checkbox-inline">
                                    <input type="checkbox" id="checkbox2" name="estate" value="1"><label
                                        for="checkbox2">物业</label>
                                </div>
                            </div>
                            <button class="btn btn-success" type="submit" id="query">搜索</button>
                            <button class="btn btn-warning" type="reset">重置</button>
                            <button class="btn btn-primary" type="button" id="add">添加</button>
                            <button class="btn btn-danger" type="button" id="batch">批删</button>

                            <input class="btn btn-danger" style="background: #1dc5a3;display: inline" type="file"
                                   id="addSome" accept=".xls,.xlsx"></input>
                            <button class="btn btn-primary" style="background: #468477;display: inline" type="button"
                                    id="submitFile">批量添加
                            </button>

                        </div>
                    </div>
                    <!--表格数据搜索 end-->
                </div>
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>人员列表</h5>
                    </div>
                    <!--表格数据展示 start-->
                    <div class="ibox-content">
                        <table class="table table-bordered table-striped table-hover">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="checkAll">
                                    <button type="button" id="inverse">反选</button>
                                </th>
                                <th>#</th>
                                <th>姓名</th>
                                <th>证件</th>
                                <th>单位</th>
                                <th>职级</th>
                                <th>状态</th>
                                <th>补贴项</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%--使用forEach--%>
                            <c:forEach items="${personList}" var="person" varStatus="i">
                                <tr>
                                    <td><input type="checkbox" value="${person.id}" class="check"></td>
                                    <td>${i.index+1 + (num-1) * len}</td>
                                    <td>${person.name}</td>
                                    <td>${person.code}</td>
                                    <td>${person.unit}</td>
                                    <td>${1==person.grade?"省级正职":2==person.grade?"省级副职":3==person.grade?"厅级正职":4==person.grade?"厅级副职":5==person.grade?"县级正职":6==person.grade?"县级副职":"无"}</td>
                                    <td>${person.state == 1 ? "离休" : "退休"}</td>
                                    <td>
                                            ${person.estate == 1 ? "物业" : ""}
                                            ${person.heating == 1 ? "供暖" : ""}
                                    </td>
                                    <td>
                                        <a href="<%=request.getContextPath()%>/personManage.do?personFlag=updatePerson&id=${person.id}">修改</a>
                                        |
                                            <%--<a href="<%=request.getContextPath()%>/personManage.do?personFlag=deleteSome&checkeds=${person.id}">删除</a> |--%>
                                            <%--<a id="${person.id}" class="delete" href="javascript:remove('${person.name}',${person.id})">删除</a>--%>
                                        <a id="${person.id}" class="delete" name="${person.name}">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <!--表格数据展示 end-->
                    <!--表格数据分页 start-->
                    <div class="ibox-content">
                        <div class="btn-group">
                            <button class="btn btn-white" type="button" id="firstPage">首页</button>
                            <button class="btn btn-white" type="button" id="lastPage">上页</button>
                            <button class="btn btn-white" type="button" id="nextPage">下页</button>
                            <button class="btn btn-white" type="button" id="endPage">末页</button>
                            <button class="btn btn-danger" type="button" disabled>
                                当前页${num}/总页数${count}/总条数${rows}</button>
                        </div>
                        <select class="form-control" name="pageSize" id="lenPage">
                            <option value="10">每页10条</option>
                            <option value="20">每页20条</option>
                            <option value="30">每页30条</option>
                            <option value="40">每页40条</option>
                            <option value="50">每页50条</option>
                        </select>
                        <input class="form-control" id="goPage" type="number" placeholder="请输入跳转页码">
                    </div>
                    <!--表格数据分页 end-->
                </div>
            </form>
        </div>
    </div>
</div>
<script src="./static/js/jquery.min.js?v=2.1.4"></script>
<script src="./static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="./static/js/content.min.js?v=1.0.0"></script>
<%--JS脚本块--%>
<script>
    /*引入JQuery Ready事件*/
    $(document).ready(function () {

        //数据回显
        $("#lenPage").val(${len})
        $("#goPage").val(${num})
        if ("${name}" != "null") {
            $("input[name='name']").val("${name}")
        }
        if ("${code}" != "null") {
            $("input[name='code']").val("${code}")
        }
        if ("${state}" != "null") {
            $("select[name='state']").val(${state})
        }
        if ("${grade}" != "null") {
            $("select[name='grade']").val(${grade})
        }
        if ("${heating}" != "null") {
            $("input[name='heating']").prop("checked", ${heating == "1" ? true : false})
        }
        if ("${estate}" != "null") {
            $("input[name='estate']").prop("checked", ${estate == "1" ? true : false})
        }

        var name;
        var code;
        var state;
        var grade;
        var heating;
        var estate;

        function init() {
            name = $("input[name='name']").val();
            code = $("input[name='code']").val();
            state = $("select[name='state']").val();
            grade = $("select[name='grade']").val();
            //获取复选框的值
            heating = $("input[name='heating']").val();
            estate = $("input[name='estate']").val();
            if (name == undefined || name == "") {
                name = null
            }
            if (code == undefined || code == "") {
                code = null
            }
            if (state == undefined || state == "") {
                state = null
            }
            if (grade == undefined || grade == "") {
                grade = null
            }
            //如果复选框没有被选中则令变量为null
            if (!$("input[name='heating']").is(":checked")) {
                heating = null
            }
            if (!$("input[name='estate']").is(":checked")) {
                estate = null
            }
        }

        $(".delete").click(function () {
            let thisName = $(this).attr("name")
            let r = confirm("是否删除" + thisName)
            if (r == true) {
                let id = $(this).attr("id");
                $.ajax({
                    url: "<%=request.getContextPath()%>/personManage.do", // 请求的URL地址
                    type: "POST",
                    data: {
                        personFlag: "deleteSome",
                        checkeds: id
                    },
                    success: function (response) {
                        //回显出来的条数判断删除是否成功
                        if (response > 0) {
                            alert("删除成功")
                        } else {
                            alert("删除失败")
                        }
                        init();
                        window.location.href = '<%=request.getContextPath()%>/personManage.do?personFlag=index&num=${num}&len=${len}&name='
                            + name + '&code=' + code + '&state=' + state + '&grade=' + grade + '&heating=' + heating + '&estate=' + estate
                    },
                    error: function (response) {
                        alert("删除失败");
                    }
                });
            }
        })

        /*使用id选择器定a标签*/
        $("#add").click(function () {
            window.location.href = '<%=request.getContextPath()%>/personManage.do?personFlag=add'
        });

        $("#nextPage").click(function () {
            if (${count > num}) {
                init();
                window.location.href = '<%=request.getContextPath()%>/personManage.do?personFlag=index&num=${num+1}&len=${len}&name='
                    + name + '&code=' + code + '&state=' + state + '&grade=' + grade + '&heating=' + heating + '&estate=' + estate
            }
        });

        $("#lastPage").click(function () {
            if (${num > 1}) {
                init();
                window.location.href = '<%=request.getContextPath()%>/personManage.do?personFlag=index&num=${num-1}&len=${len}&name='
                    + name + '&code=' + code + '&state=' + state + '&grade=' + grade + '&heating=' + heating + '&estate=' + estate
            }
        });

        $("#firstPage").click(function () {
            if (${num != 1}) {
                init();
                window.location.href = '<%=request.getContextPath()%>/personManage.do?personFlag=index&num=1&len=${len}&name='
                    + name + '&code=' + code + '&state=' + state + '&grade=' + grade + '&heating=' + heating + '&estate=' + estate
            }
        })

        $("#endPage").click(function () {
            if (${num != count}) {
                init();
                window.location.href = '<%=request.getContextPath()%>/personManage.do?personFlag=index&num=${count}&len=${len}&name='
                    + name + '&code=' + code + '&state=' + state + '&grade=' + grade + '&heating=' + heating + '&estate=' + estate
            }
        })

        $("#lenPage").change(function () {
            let length = $(this).val();
            init();
            window.location.href = '<%=request.getContextPath()%>/personManage.do?personFlag=index&num=1&len=' + length + '&name='
                + name + '&code=' + code + '&state=' + state + '&grade=' + grade + '&heating=' + heating + '&estate=' + estate
        })

        $("#goPage").change(function () {
            let number = $(this).val();
            if (number < 1) {
                number = 1
            } else if (number > ${count}) {
                number =
                ${count}
            }
            init();
            window.location.href = '<%=request.getContextPath()%>/personManage.do?personFlag=index&num=' + number + '&len=${len}&name='
                + name + '&code=' + code + '&state=' + state + '&grade=' + grade + '&heating=' + heating + '&estate=' + estate
        })

        $("#batch").click(function () {
            let r = confirm("是否删除")
            if (r == true) {
                let checkeds = []
                $(".check").each(function () {
                    if ($(this).is(":checked")) {
                        checkeds.push($(this).val())
                    }
                })
                checkeds = checkeds.join();
                $.ajax({
                    url: "<%=request.getContextPath()%>/personManage.do", // 请求的URL地址
                    type: "POST",
                    data: {
                        personFlag: "deleteSome",
                        checkeds: checkeds
                    },
                    success: function (response) {
                        //回显出来的条数判断删除是否成功
                        if (response > 0) {
                            alert("删除成功")
                        } else {
                            alert("删除失败")
                        }
                        init();
                        window.location.href = '<%=request.getContextPath()%>/personManage.do?personFlag=index&num=${num}&len=${len}&name='
                            + name + '&code=' + code + '&state=' + state + '&grade=' + grade + '&heating=' + heating + '&estate=' + estate
                    },
                    error: function (response) {
                        alert("删除失败");
                    }
                });
            }
        })

        //全选
        $("#checkAll").click(function () {
            let bool = $(this).is(":checked")
            $(".check").each(function () {
                $(this).prop("checked", bool)
            })
        })

        //反选
        $("#inverse").click(function () {
            $(".check").each(function () {
                $(this).prop("checked", !($(this).is(":checked")))
            })
        })

        //批量添加
        $("#submitFile").click(function () {
            let fileInput = $("#addSome")[0];
            let file = fileInput.files[0];
            let formData = new FormData();
            formData.append("file",file);
            $.ajax({
                url:"personExpand?type=addSomePerson",
                method:"post",
                processData: false,
                contentType: false,
                data:formData,
                success:function (data) {
                    alert(data);
                    init();
                    window.location.href = '<%=request.getContextPath()%>/personManage.do?personFlag=index&num=${num}&len=${len}&name='
                        + name + '&code=' + code + '&state=' + state + '&grade=' + grade + '&heating=' + heating + '&estate=' + estate
                },
                error:function () {
                    alert("error")
                }
            })
        })
    });

</script>
</body>
</html>

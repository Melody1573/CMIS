<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>人员修改</title>
    <link href="static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="static/css/animate.min.css" rel="stylesheet">
    <link href="static/css/style.min.css?v=4.0.0" rel="stylesheet">
</head>
<body>
<div class="ibox">
    <div class="ibox-title">
        <h5>人员修改</h5>
    </div>
    <div class="ibox-content">
        <form class="form-horizontal m-t" id="personForm" action="<%=request.getContextPath()%>/personManage.do"
              method="post">
            <%--<input type="hidden" name="tag" value="update">--%>
            <input type="hidden" name="id" value="${person.id}">
            <input type="hidden" name="personFlag" value="updatePersonSubmit">
            <div class="form-group">
                <label class="col-sm-2 control-label">姓名：</label>
                <div class="col-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input type="text" name="name" value="${person.name}" class="form-control"
                               placeholder="请输入人员名称">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">证件：</label>
                <div class="col-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input type="text" name="code" value="${person.code}" class="form-control"
                               placeholder="请输入身份证号">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">单位：</label>
                <div class="col-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input type="text" name="unit" value="${person.unit}" class="form-control"
                               placeholder="请输入人员单位">
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">状态：</label>
                <div class="col-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <select class="form-control" name="state">
                            <option value="0">请选择</option>
                            <option value="1" ${person.state == 1 ? "selected" : ""}>离休</option>
                            <option value="2" ${person.state == 2 ? "selected" : ""}>退休</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">职级：</label>
                <div class="col-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-signal"></i></span>
                        <select class="form-control" name="grade">
                            <option value="0">请选择</option>
                            <c:forEach items="${grades}" var="g">
                                <option value="${g.key}" ${g.key == person.grade ? "selected" : ""}>${g.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">补贴项目：</label>
                <div class="col-sm-10">
                    <div class="input-group">
                        <input id="checkbox1" type="checkbox" ${person.heating == 1 ? "checked" : ""} name="subsidy"
                               value="1"><label for="checkbox1">供暖</label>
                        <input id="checkbox2" type="checkbox" ${person.estate == 1 ? "checked" : ""} name="subsidy"
                               value="2"><label for="checkbox2">物业</label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">更改原因：</label>
                <div class="col-sm-10">
                    <textarea name="reason" class="form-control" placeholder="请输入更改原因">${person.reason}</textarea>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-4 col-sm-offset-3">
                    <button class="btn btn-primary" type="button" id="submit">提交</button>
                    <button class="btn btn-danger" type="reset">重置</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="./static/js/jquery.min.js?v=2.1.4"></script>
<script src="./static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="./static/js/content.min.js?v=1.0.0"></script>
<script src="./static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="./static/js/plugins/validate/messages_zh.min.js"></script>
<script src="./static/js/plugins/validate/custom.validate.js"></script>
<script>
    $(document).ready(function () {
        var icon = "<i class='fa fa-times-circle'></i>  ";

        function formCheck() {
            return  $('#personForm').validate({
                //表单交验
                rules: {
                    name: {
                        required: true,                                  //去空格后大于0
                        rangelength: [2, 25],
                        chinese: true
                    },
                    code: {
                        required: true,
                        rangelength: [18, 18],
                        remote: {
                            url: 'personManage.do',
                            data: {
                                personFlag: 'updatePersonCode',
                                id:${person.id},
                                code: function () {
                                    return $('[name=code]').val();
                                }
                            }
                        }
                        //password:true
                    },
                    unit: {
                        required: true,
                        rangelength: [4, 25],
                        chinese: true
                    },
                    state: {
                        statekey: true
                    },
                    grade: {
                        gradekey: true
                    },
                    subsidy: {
                        str: true
                        // errorPlacement:true
                    },
                    reason: {
                        maxlength: [200]
                    }
                },
                //重写提示信息
                messages: {
                    name: {
                        required: icon + '人员姓名为必填项',
                        rangelength: icon + '人员姓名长度要求为 {0} - {1} 之间的字串',
                        chinese: icon + '请输入中文'
                    },
                    code: {
                        required: icon + "人员证件为必填项",
                        rangelength: icon + "人员证件长度要求{0}位",
                        remote: icon + '人员证件已存在请修改'
                    },
                    unit: {
                        required: icon + '单位名称为必填项',
                        rangelength: icon + '单位名称长度要求为 {0} - {1} 之间的字串',
                        chinese: icon + '请输入中文'
                    },
                    reason: {
                        maxlength: icon + '最多输入200个字'
                    }
                },
                errorPlacement: function (error, element) {
                    if (element.is(":checkbox")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            })
        }

        //提交表单
        $("#submit").click(function (event) {
            event.preventDefault()
            console.log(formCheck().form())
            if (formCheck().form()) {
                let r = confirm("确认修改?");
                if (r == true) {
                    $.ajax({
                        url: "<%=request.getContextPath()%>/personManage.do",
                        method: "post",
                        data: $("#personForm").serialize(),
                        success: function (data) {
                            if (data > 0) {
                                alert("修改成功")
                                window.location.href = "personManage.do?personFlag=index"
                            } else {
                                alert("修改失败")
                            }
                        }
                    })
                }
            }
        })
    });
</script>
</body>
</html>

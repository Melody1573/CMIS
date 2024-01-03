<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>人员添加</title>
    <link href="./static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="./static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="./static/css/animate.min.css" rel="stylesheet">
    <link href="./static/css/style.min.css?v=4.0.0" rel="stylesheet">
</head>
<body>
<div class="ibox">
    <div class="ibox-title">
        <h5>人员添加</h5>
    </div>
    <div class="ibox-content">
        <form style="margin: auto;width: 60%" class="form-horizontal m-t" id="personForm"
              action="<%=request.getContextPath()%>/personManage.do?personFlag=insertPerson"
              method="post">
            <input type="hidden" name="tag" value="add">
            <div style="padding-left: 20%" class="form-group">
                <label class="col-sm-2 control-label">姓名：</label>
                <div class="col-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                        <input style="width: 50%" type="text" name="name" value="" class="form-control"
                               placeholder="请输入人员名称">
                    </div>
                </div>
            </div>
            <div style="padding-left: 20%" class="form-group">
                <label class="col-sm-2 control-label">证件：</label>
                <div class="col-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input style="width: 50%" type="text" name="code" value="" class="form-control"
                               placeholder="请输入身份证号">
                    </div>
                </div>
            </div>
            <div style="padding-left: 20%" class="form-group">
                <label class="col-sm-2 control-label">单位：</label>
                <div class="col-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                        <input style="width: 50%" type="text" name="unit" value="" class="form-control"
                               placeholder="请输入人员单位">
                    </div>
                </div>
            </div>
            <div style="padding-left: 20%" class="form-group">
                <label class="col-sm-2 control-label">状态：</label>
                <div class="col-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                        <select style="width: 50%" class="form-control" name="state">
                            <option value="0">请选择</option>
                            <option value="1">离休</option>
                            <option value="2">退休</option>
                        </select>
                    </div>
                </div>
            </div>
            <div style="padding-left: 20%" class="form-group">
                <label class="col-sm-2 control-label">职级：</label>
                <div class="col-sm-10">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-signal"></i></span>
                        <select style="width: 50%" class="form-control" name="grade">
                            <option value="0">请选择</option>
                            <%--使用forEach--%>
                            <c:forEach items="${grades}" var="g" varStatus="i">
                                <option value="${g.key}">${g.value}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div style="padding-left: 20%" class="form-group">
                <label class="col-sm-2 control-label">补贴项目：</label>
                <div class="col-sm-10">
                    <div class="input-group">
                        <input id="checkbox1" type="checkbox" name="subsidy" value="1"><label for="checkbox1">供暖</label>
                        <input id="checkbox2" type="checkbox" name="subsidy" value="2"><label for="checkbox2">物业</label>
                    </div>
                </div>
            </div>
            <div style="padding-left: 20%" class="form-group">
                <label class="col-sm-2 control-label">更改原因：</label>
                <div class="col-sm-10">
                    <textarea style="width: 52%" name="reason" class="form-control" placeholder="请输入更改原因"></textarea>
                </div>
            </div>
            <div style="padding-left: 20%" class="form-group">
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
            $('#personForm').validate({
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
                            url: 'personManage.do?personFlag=selectByCode',
                            data: {
                                tag: 'code',
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
                        str: true,
                        // errorPlacement: true
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

        $("#submit").click(function (event) {
            // 阻止表单的默认提交行为
            event.preventDefault();
            // 表单校验
            // if (formCheck().form()) {
            // 在这里执行您的自定义操作
            var selectedValues = [];
            $('input[name="subsidy"]:checked').each(function () {
                selectedValues.push($(this).val())
            });
            let sel = selectedValues.join();
            $.ajax({
                url: "<%=request.getContextPath()%>/personManage.do", // 请求的URL地址
                type: "POST",
                data: {
                    personFlag: "insertPerson",
                    name: $("input[name='name']").val(),
                    code: $("input[name='code']").val(),
                    unit: $("input[name='unit']").val(),
                    state: $("select[name='state'] option:selected").val(),
                    grade: $("select[name='grade'] option:selected").val(),
                    subsidy: sel,
                    reason: $("textarea[name='reason']").val()
                },
                success: function (response) {
                    if (response > 0) {
                        alert("添加成功")
                        window.location.href = "<%=request.getContextPath()%>/personManage.do?personFlag=index";
                    } else {
                        let info;
                        switch (response) {
                            case "-1":
                                info = "名字不能为空"
                                break;
                            case "-2":
                                info = "身份证号长度不正确"
                                break;
                            case "-3":
                                info = "状态为必选项"
                                break;
                            case "-4":
                                info = "职级为必选项"
                                break;
                            case "-5":
                                info = "不贴项为必选项"
                                break;
                            case "-6":
                                info = "身份证不符合格式要求"
                                break;
                            case "-7":
                                info = "身份证号已存在"
                                break;
                            case "-8":
                                info = "说明文字多余200字"
                                break;
                            case "-9":
                                info = "名字长度必须是2-50之间"
                                break;
                            case "-10":
                                info = "单位不能为空"
                                break;
                            case "-11":
                                info = "单位长度必须是5-50之间"
                                break;
                        }
                        alert("添加失败【" + info + "】");
                    }
                },
                error: function (xhr, status, error) {
                    alert("添加失败\n错误代码error")
                }
            });
            // }
        })
    })
</script>
</body>
</html>

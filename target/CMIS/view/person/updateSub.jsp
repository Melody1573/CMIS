<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>补贴添加</title>
    <link rel="shortcut icon" href="favicon.ico">
    <link href="static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="static/css/animate.min.css" rel="stylesheet">
    <link href="static/css/style.min.css?v=4.0.0" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>补贴添加</h5>
                </div>
                <div class="ibox-content">
                    <form class="form-horizontal m-t" id="subsidyForm" action="" method="post">
                        <input type="hidden" name="subsidyFlag" value="update">
                        <input type="hidden" name="type" value="${type}">
                        <input type="hidden" name="personId" value="${personSubsidyOV.pid}">
                        <input type="hidden" name="subId" value="${personSubsidyOV.sid}">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名：</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input type="text" id="personId" class="form-control"
                                           value="${personSubsidyOV.name}" readonly>
                                    <span>点击输入框选择补贴人员</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">身份证号：</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                    <input type="text" id="personCode" class="form-control"
                                           value="${personSubsidyOV.code}" readonly>
                                    <span>根据选择的人员自动填充身份证号码</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">补贴金额：</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-cny"></i></span>
                                    <input type="text" name="money" value="${personSubsidyOV.money}"
                                           class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">更改原因：</label>
                            <div class="col-sm-10">
                                <textarea name="reason" class="form-control">${personSubsidyOV.reason}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-3">
                                <button class="btn btn-primary" type="submit" id="subbtn">提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">标题</h4>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="ok">确认</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<script src="static/js/jquery.min.js?v=2.1.4"></script>
<script src="static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="static/js/content.min.js?v=1.0.0"></script>
<script src="static/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script>
    $("#subbtn").click(function (event) {
        //阻止默认事件
        event.preventDefault()
        //发送ajax请求来更改信息
        $.ajax({
            url: "subsidyManage.do",
            method: "POST",
            data: $("#subsidyForm").serialize(),
            success: function (data) {
                if (data > 0){
                    alert("更新成功")
                }else{
                    alert("更新失败")
                }
                window.location.href="subsidyManage.do?subsidyFlag=goSublist&type=${type}"
            },
            error: function () {
                alert("更新失败")
            }
        })
    })
</script>
</body>
</html>

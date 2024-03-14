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
                        <input type="hidden" name="subsidyFlag" value="addSubSubmit">
                        <input type="hidden" name="type" value="">
                        <input type="hidden" name="personId" value="">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名：</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input type="text" id="personId" class="form-control" readonly>
                                    <span>点击输入框选择补贴人员</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">身份证号：</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
                                    <input type="text" id="personCode" class="form-control" readonly>
                                    <span>根据选择的人员自动填充身份证号码</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">补贴金额：</label>
                            <div class="col-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-cny"></i></span>
                                    <input type="number" name="money" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">更改原因：</label>
                            <div class="col-sm-10">
                                <textarea name="reason" class="form-control" placeholder="请输入更改原因"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-3">
                                <button class="btn btn-primary" type="button" id="subtn">提交</button>
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
                <h4 class="modal-title">选择物业补贴人员信息</h4>
            </div>
            <div class="modal-body">

            </div>
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
<script src="static/js/plugins/validate/jquery.validate.min.js"></script>
<script src="static/js/plugins/validate/messages_zh.min.js"></script>
<script src="static/js/plugins/validate/custom.validate.js"></script>
<script>
    $(document).ready(function () {
        var icon = "<i class='fa fa-times-circle'></i>  ";

        function personForm() {
            return $('#subsidyForm').validate({
                //表单交验
                rules: {
                    reason: {
                        required: true,
                        maxlength: [10]
                    }
                },
                messages: {
                    reason: {
                        maxlength: icon + '最多输入10个字'
                    }

                },
                errorPlacement: function (error, element) {
                    if (element.is(":checkbox")) {
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });
        }

        $('#personId').click(function () {
            // 打开模态窗
            $('#modal').modal('show');
            $.get('subsidyManage.do', {//需要返回json集合字符串
                subsidyFlag: 'subsidy',
                <%--type:'${requestScope.type}'--%>
                type: '${type}'
            }, function (result) {
                let html = '<table class="table table-bordered table-striped table-hover">';
                html += ' <thead>';
                html += '    <tr>';
                html += '        <th>#</th>';
                html += '        <th>序号</th>';
                html += '        <th>姓名</th>';
                html += '        <th>证件</th>';
                html += '        <th>单位</th>';
                html += '    </tr>';
                html += ' </thead>';
                html += ' <tbody>';
                $.each(result, function (i, o) {
                    html += '  <tr>';
                    html += '      <td><input type="radio" name="subsidyPersonId" value="' + o.id + '"></td>';
                    html += '      <td>' + (i + 1) + '</td>';
                    html += '      <td>' + o.name + '</td>';
                    html += '      <td>' + o.code + '</td>';
                    html += '      <td>' + o.unit + '</td>';
                    html += '  </tr>';
                });
                html += ' </tbody>';
                html += '</table>';
                $('.modal-body').html(html);
            });
            // 关闭模态窗
            // $('#modal').modal('hide');
        });

        $("#subtn").click(function (event) {
            event.preventDefault();
            personForm().form();
            $.ajax({
                url: "subsidyManage.do",
                type: "POST",
                data: $("#subsidyForm").serialize(),
                success: function (respone) {
                    if (respone > 0) {
                        alert("添加成功")
                        window.location.href = "<%=request.getContextPath()%>/subsidyManage.do?subsidyFlag=goSublist&type=${type}"
                    } else {
                        alert("添加失败\n错误代码" + respone)
                    }
                },
                error: function () {
                    alert("添加失败\n错误代码error")
                }
            })
        })

        $(document).delegate('#ok', 'click', function () {
            let total = $('[name=subsidyPersonId]:checked');
            if ($(total).length === 0) {
                alert("请选择补贴人员");
                return false;
            }
            let person = $(total).first();
            let id = $(person).val();
            let name = $(person).parent().nextAll().eq(1).text();//数组  除id外的其他值
            let code = $(person).parent().nextAll().eq(2).text();//数组  除id外的其他值

            //1.回写
            $('[name=personId]').val(id);
            $('#personId').val(name);
            $('#personCode').val(code);
            $('[name=type]').val(${type});
            //2.关闭弹窗
            $('#modal').modal('hide');

        });
    });
</script>
</body>
</html>

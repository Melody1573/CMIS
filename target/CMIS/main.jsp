<%--
  Created by IntelliJ IDEA.
  User: Luo
  Date: 2024/1/3
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="gbk">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>人员补贴管理系统 - 主页</title>
    <link href="static/css/bootstrap.min.css?v=3.3.5" rel="stylesheet">
    <link href="static/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="static/css/style.min.css?v=4.0.0" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="row">
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-success pull-right">月</span>
                    <h5>物业补贴</h5>
                </div>
                <div class="ibox-content">
                    <table class="table table-bordered table-striped table-hover">
                        <thead>
                        <tr>
                            <th>上个月</th>
                            <th>总人数</th>
                            <th>总金额</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${month-1 == 0?"12":month}月份</td>
                            <td>${subELast.personCount}</td>
                            <td>${subELast.sumMoney}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-success pull-right">月</span>
                    <h5>物业补贴</h5>
                </div>
                <div class="ibox-content">
                    <table class="table table-bordered table-striped table-hover">
                        <tr>
                            <th>当前月</th>
                            <th>总人数</th>
                            <th>总金额</th>
                        </tr>
                        <tbody>
                            <td>${month}月份</td>
                            <td>${subE.personCount}</td>
                            <td>${subE.sumMoney}</td>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-success pull-right">月</span>
                    <h5>供暖补贴</h5>
                </div>
                <div class="ibox-content">
                    <table class="table table-bordered table-striped table-hover">
                        <thead>
                        <tr>
                            <th>上个月</th>
                            <th>总人数</th>
                            <th>总金额</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${month-1 == 0?"12":month}月份</td>
                            <td>${subHLast.personCount}</td>
                            <td>${subHLast.personCount}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <span class="label label-success pull-right">月</span>
                    <h5>供暖补贴</h5>
                </div>
                <div class="ibox-content">
                    <table class="table table-bordered table-striped table-hover">
                        <thead>
                        <tr>
                            <th>当前月</th>
                            <th>总人数</th>
                            <th>总金额</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>${month}月份</td>
                            <td>${subH.personCount}</td>
                            <td>${subH.sumMoney}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>补贴</h5>
                    <div class="pull-right">
                        <div class="btn-group">
                            <button type="button" class="btn btn-xs btn-primary active">天</button>
                            <button type="button" class="btn btn-xs btn-primary">月</button>
                            <button type="button" class="btn btn-xs btn-primary">年</button>
                        </div>
                    </div>
                </div>
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-9">
                            <div id="subsidyChat" style="width: 100%;height: 300px;"></div>
                        </div>
                        <div class="col-sm-3">
                            <ul class="stat-list">
                                <li>
                                    <h2 class="no-margins">2,346</h2>
                                    <small>总体贴</small>
                                    <div class="stat-percent">48% <i class="fa fa-level-up text-navy"></i>
                                    </div>
                                    <div class="progress progress-mini">
                                        <div style="width: 48%;" class="progress-bar"></div>
                                    </div>
                                </li>
                                <li>
                                    <h2 class="no-margins ">4,422</h2>
                                    <small>物业补贴</small>
                                    <div class="stat-percent">60% <i class="fa fa-level-down text-navy"></i>
                                    </div>
                                    <div class="progress progress-mini">
                                        <div style="width: 60%;" class="progress-bar"></div>
                                    </div>
                                </li>
                                <li>
                                    <h2 class="no-margins ">9,180</h2>
                                    <small>供暖补贴</small>
                                    <div class="stat-percent">22% <i class="fa fa-bolt text-navy"></i>
                                    </div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar"></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="static/js/jquery.min.js?v=2.1.4"></script>
<script src="static/js/bootstrap.min.js?v=3.3.5"></script>
<script src="static/js/plugins/echarts/echarts-all.js"></script>
<script>
    $(document).ready(function () {
        $('.btn-group>button').click(function () {
            $('.btn-group>button').removeClass('active');
            $(this).addClass('active');
        });

        let subsidyChat = echarts.init(document.getElementById('subsidyChat'));
        let subsidyChatOption = {
            tooltip: {
                trigger: 'axis'
            },
            xAxis: {
                type: 'category',
                data: ['1号', '2号', '3号', '4号', '5号', '6号', '7号', '8号', '9号', '10号', '11号', '12号']
            },
            yAxis: {
                type: 'value'
            },
            legend: {
                data: ['物业补贴', '供暖补贴']
            },
            series: [
                {
                    name: '物业补贴',
                    data: [150, 230, 224, 218, 135, 147, 260, 180, 280, 101, 220, 81],
                    type: 'line'
                },
                {
                    name: '供暖补贴',
                    data: [250, 130, 124, 118, 235, 247, 160, 190, 229, 229, 490, 220],
                    type: 'line'
                }
            ]
        };
        subsidyChat.setOption(subsidyChatOption);
    });
</script>
</body>

</html>


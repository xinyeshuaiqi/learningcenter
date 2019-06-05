<!DOCTYPE html>

<html lang="en">

<head>

    <title>活动详情</title>

    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/css/bootstrap.css" />
    <link rel="stylesheet" href="/css/style.css" />

    <style type="text/css">
        a:hover{
            color: #b1dfbb;
        }
        a{
            color: chocolate;
        }

    </style>

</head>

<body>

<div style="width: 100% ; height: 432px; background:url(../images/bg.jpg) no-repeat 0px 0px; ">
    <div style="margin-left: 100px; padding-top: 50px;font-family:STHupo ;color: black;font-size: xx-large">
        华大学城
    </div>

    <div style="margin-left: 140px; padding-top: 20px;font-family:STHupo ;color: black;font-size: x-large">
        活动详情
    </div>

    <div style="margin-left: 140px; padding-top: 20px;font-family:STHupo ;color: black;font-size: x-large">
        <tr style="font-size: medium">
            <td><a href="/homepage"><- 返回个人主页<a></td>
            &nbsp;&nbsp;
            <td><a href="/">首页<a></td>&nbsp;
            <td><a href="/topicView">学吧<a></td>&nbsp;
            <td><a href="/materialsView">资料库<a></td>&nbsp;
            <td><a href="/bookView">图书馆<a></td>&nbsp;
            <td><a href="/activityView">活动<a></td>
        </tr>
    </div>

</div>

<div style="margin-top: -30px;margin-left: 100px;" class="about-bottom">
    <div class="container" >
        <div  class="col-md-6 agileinfo_about_grids_bottom_right">
            <div class="agileinfo_about_grids_bottom_right-pos" style="margin-left: 600px;background-color: cornsilk">
                <h3 style="font-family: YouYuan;">活动详情</h3>

                <br/>

                <div class="container">
                    <table style="font-family: YouYuan" class="table table-striped">
                        <tbody>
                        <tr class="table-info">
                            <td>主题</td>
                            <td>
                                ${(theActivity.topic)!''}
                            </td>
                        </tr>
                        <tr>
                            <td>描述</td>
                            <td>${(theActivity.description)!''}</td>
                        </tr>
                        <tr class="table-info">
                            <td>创建人</td>
                            <td>${(theActivity.nickname)!''}</td>
                        </tr>

                        <tr>
                            <td>创建时间</td>
                            <td>${(theActivity.createTime)?string('yyyy-MM-dd HH:mm:ss')}</td>
                        </tr>

                        <tr class="table-info">
                            <td>开始时间</td>
                            <td>
                            ${(theActivity.startTime)?string('yyyy-MM-dd HH:mm:ss')}
                            </td>
                        </tr>

                        <tr>
                            <td>地点</td>
                            <td>
                            ${(theActivity.address)!''}
                            </td>
                        </tr>

                        <tr class="table-info">
                            <td>预计耗时</td>
                            <td>
                                <#if (theActivity.cost) == 100>  <#--判断user和name有一个不为空就进if语句-->
                                     5小时以上
                                <#else >
                                    ${(theActivity.cost)!''}小时
                                </#if>
                            </td>
                        </tr>

                        <tr>
                            <td>人数</td>
                            <td>
                            <#if (theActivity.totalNumber) == 1>  <#--判断user和name有一个不为空就进if语句-->
                                1-20人
                            <#elseif (theActivity.totalNumber) == 2>
                                20-50人
                            <#elseif (theActivity.totalNumber) == 3>
                                50-100人
                            <#elseif (theActivity.totalNumber) == 4>
                                100人以上
                            </#if>
                            </td>
                        </tr>


                        </tbody>
                    </table>

                    <#--<div style="margin-left: 350px;margin-top: 30px">
                        <button type="button" class="btn btn-outline-danger">编辑</button>
                    </div>-->

                </div>

            </div>
        </div>
    </div>

</div>
</div>



<div class="copy-right" style="margin-top: 600px">
    <div class="container">
        <p>Copyright ©2019 华大学城  All Rights Reserved<br/>
            班级：15软件工程1班  &nbsp;&nbsp;    姓名：汪明鑫  &nbsp;&nbsp; 学号：1525161009<br/></p>

    </div>
</div>

<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/layer/layer.js"></script>

</body>

</html>
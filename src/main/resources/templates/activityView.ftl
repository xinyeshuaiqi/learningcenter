<!DOCTYPE html>

<html lang="en">

<head>

    <title>活动</title>

    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/css/bootstrap.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/js/layui/css/layui.css" />

    <style type="text/css">
        a:hover{
            color: silver;
        }
        a{
            color: #00FFFF;
        }

    </style>

</head>

<body style="background-color: lightcyan">

<div class="rounded" style="width: 80% ; height:640px ; margin-left: 50px;margin-top: 50px; background:url(../images/b1.jpg) no-repeat 0px 0px;  ">
    <div style="margin-left: 100px; padding-top: 50px;font-family:STHupo ;color: wheat;font-size: xx-large">
        华大学城
    </div>

    <div style="margin-left: 140px; padding-top: 20px;font-family:STHupo ;color: wheat;font-size: x-large">
        活动
    </div>

    <div style="margin-left: 140px; padding-top: 20px;font-family:STHupo ;color: wheat;font-size: x-large">
        <tr style="font-size: medium">
            <td><a href="/homepage"><i  class="layui-icon layui-icon-prev-circle"></i>返回个人主页<a></td>
            &nbsp;&nbsp;

            <td><a href="/"><i class="layui-icon layui-icon-username"></i>首页<a></td>&nbsp;
            <td><a href="/topicView">学吧<a></td>&nbsp;
            <td><a href="/materialsView">资料库<a></td>&nbsp;
            <td><a href="/bookView">图书馆<a></td>&nbsp;
            <#--<td><a href="#" class="active">活动<a></td>-->
        </tr>
    </div>

</div>

<div style="margin-top: -600px;margin-left: 1400px"><img src="/images/b2.jpg" > </div>
<div style="margin-top: 18px;margin-left: 1100px"><img src="/images/building.jpg" > </div>

    <div class="layui-card col-10 rounded layui-bg-gray" style="margin-left: 50px;margin-top: 100px;font-family: YouYuan">
        <div class="layui-card-header" style="font-size: xx-large;color: #FF5722;font-weight: bolder" >
            活动列表

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            <button class="layui-btn layui-btn-radius" onclick="createActivity()">
                <i class="layui-icon">&#xe608;</i> 创建活动
            </button>

        </div>
        <br/>
        <div class="layui-card-body">


            <table  class="layui-table" lay-size="lg" style="font-family: YouYuan;">
                <colgroup>
                    <col width="5%">
                    <col width="13%">
                    <col width="12%">
                    <col width="7%">
                    <col width="8%">
                    <col width="8%">
                    <col width="12%">
                    <col width="13%">
                </colgroup>

                <thead >
                <tr>
                    <th>序号</th>
                    <th>活动主题</th>
                    <th>开始时间</th>
                    <th>地点</th>
                    <th>预计用时</th>
                    <th>人数</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <#if activities??>
                <#list activities as a>
                <tr>
                    <td>${a_index+1}</td>
                    <td>${(a.topic)!""}</td>
                    <td>${(a.startTime?string('yyyy-MM-dd HH:mm:ss'))!""}</td>
                    <td>${(a.address)!""}</td>
                    <td>
                            <#if (a.cost) == 100>  <#--判断user和name有一个不为空就进if语句-->
                                5小时以上
                            <#else >
                                ${(a.cost)!''}小时
                            </#if>
                    </td>
                    <td>
                            <#if (a.totalNumber) == 1>  <#--判断user和name有一个不为空就进if语句-->
                                1-20人
                            <#elseif (a.totalNumber) == 2>
                                20-50人
                            <#elseif (a.totalNumber) == 3>
                                50-100人
                            <#elseif (a.totalNumber) == 4>
                                100人以上
                            </#if>
                    </td>

                    <td>${(a.createTime?string('yyyy-MM-dd HH:mm:ss'))!""}</td>

                    <td>
                        <button class="layui-btn layui-btn-sm layui-btn-radius layui-btn-normal" onclick="searchDetail(${(a.id)!""})">
                            查看详情
                        </button>
                        <button class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm" onclick="takeActivity(${(a.id)!""})">
                            报名参加
                        </button>
                    </td>
                </tr>
                </#list>
                </#if>

                </tbody>
            </table>



        </div>
    </div>



<div class="copy-right" style="margin-top: 100px;">
    <div class="container">
        <p>Copyright ©2019 华大学城  All Rights Reserved<br/>
            班级：15软件工程1班  &nbsp;&nbsp;    姓名：汪明鑫  &nbsp;&nbsp; 学号：1525161009<br/></p>

    </div>
</div>

<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/layer/layer.js"></script>
<script type="text/javascript" src="/js/layui/layui.js"></script>
<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'form'], function(){
        var layer = layui.layer
                ,form = layui.form;

    });
</script>

<script type="text/javascript">
   function searchDetail(data) {
        window.location.href = "/activityInfo?id="+data;
   }
</script>

<script type="text/javascript">
    function takeActivity(data) {
        window.location.href="takeActivity?id="+data;
    }
</script>

<script type="text/javascript">
    function createActivity() {
        window.location.href="/createActivity";
    }
</script>


</body>

</html>
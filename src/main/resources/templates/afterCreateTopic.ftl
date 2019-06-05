<!DOCTYPE html>

<html lang="en">

<head>

    <title>帖子信息</title>

    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/css/bootstrap.css" />
    <link rel="stylesheet" href="/js/layui/css/layui.css" />
    <link rel="stylesheet" href="/css/style.css" />

    <style type="text/css">
        a{
            color: #1c7430;
        }

        a:hover{
           color: chartreuse;
        }
    </style>

</head>

<body>


<div style="margin-left: 50px;margin-top: 50px">
    <img src="/images/banner.jpg" class="rounded-circle" width="20%" height="10%">
</div>

<div style="width: 100%;height: 60px;background-color: lightgrey;margin-top: -160px">

    <div style="padding-left: 1400px;padding-top: 10px">
        <span  style="font-family: YouYuan" >
          <a href="/" style="font-size: x-large;">首页</a>
          <a href="/homepage" style="font-size: x-large;">个人主页</a>
          <a href="/topicView" style="font-size: x-large;">学吧</a>
          <a href="/materialsView" style="font-size: x-large;">资料库</a>
          <a href="/bookView" style="font-size: x-large;">图书馆</a>
          <a href="/activityView" style="font-size: x-large;">活动</a>
        </span>
    </div>
</div>

<div class="card" style="width: 60%;margin: 200px auto">

    <div class="card-body" style="font-family: YouYuan">
        <h2 class="card-title" style="font-family: YouYuan">帖子信息</h2>
        <br/>
        <br/>
       <#-- <img src="http://${fileurl}/${book.coverPath}" class="rounded" style="width: 500px;height: 500px">-->

        <div>
            <table class="table  table-hover">

                <tbody>
                <tr>
                    <td>标题</td>
                    <td>${topic.title}</td>
                </tr>
                <tr>
                    <td>内容</td>
                    <td>${(topic.content)!""}</td>
                </tr>
                <tr>
                    <td>发表时间</td>
                    <td>${(topic.createTime?string('yyyy-MM-dd HH:mm:ss'))!""}</td>
                </tr>

                <tr>
                    <td>发表人</td>
                    <td>${(topic.nickName)!""}</td>
                </tr>

                </tbody>
            </table>

        </div>

    </div>
</div>


<div class="copy-right" style="margin-top: -100px">
    <div class="container">
        <p>Copyright ©2019 华大学城  All Rights Reserved<br/>
            班级：15软件工程1班  &nbsp;&nbsp;    姓名：汪明鑫  &nbsp;&nbsp; 学号：1525161009<br/></p>

    </div>
</div>

<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/layer/layer.js"></script>
<script type="text/javascript" src="/js/layui/layui.js"></script>

</body>

</html>
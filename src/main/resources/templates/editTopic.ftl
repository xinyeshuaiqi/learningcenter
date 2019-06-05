<!DOCTYPE html>

<html lang="en">

<head>

    <title>编辑帖子</title>

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
            background-color: #00F7DE;
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

<div class="card" style="width: 50%;margin: 200px auto">

    <div class="card-body" style="font-family: YouYuan">

        <h2 class="card-title" style="font-family: YouYuan">编辑帖子</h2>
        <br/>
        <br/>

        <form class="layui-form " action="/toEditTopic">

            <input type="hidden" name="id" value="${(topic.id)!""}"/>

            <div class="layui-form-item">
                <label class="layui-form-label">标题</label>
                <div class="layui-input-block">
                    <input type="text" id="title" name="title" required  lay-verify="required" placeholder="标题" autocomplete="off" class="layui-input"
                    value="${(topic.title)!""}">
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">内容</label>
                <div class="layui-input-block">
                    <textarea name="content" placeholder="内容" class="layui-textarea" lay-verify="required" maxlength="300">
                        ${(topic.content)!""}
                    </textarea>
                </div>
            </div>


            <br/>
            <br/>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <button class="layui-btn layui-btn" lay-submit lay-filter="formDemo">编辑</button>
                </div>
            </div>
        </form>

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

<script>
    //注意：导航 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;

        //…
    });

    layui.use('form', function(){
        var form = layui.form;

        //监听表单提交
        form.on('submit(formDemo)', function(data){
            //layer.msg(JSON.stringify(data.field));
            return true;
        });
    });

</script>


</body>

</html>
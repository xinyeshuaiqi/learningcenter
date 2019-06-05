<!DOCTYPE html>

<html lang="en">

<head>

    <title>上传资料</title>

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


<div style="margin-left: 50px;margin-top: 30px">
    <img src="/images/file.jpg" class="rounded-circle" width="10%" height="20%">
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

        <h2 class="card-title" style="font-family: YouYuan">上传资料</h2>
        <br/>
        <br/>

        <form class="layui-form " action="/toUploadFile">

            <input type="hidden" id="filePath" name="filePath" />

            <div class="layui-form-item">
                <label class="layui-form-label">资料</label>
                <div class="layui-input-block">
                    <button type="button" class="layui-btn" id="test1">
                        <i class="layui-icon">&#xe67c;</i>上传资料
                    </button>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">资料名</label>
                <div class="layui-input-block">
                    <input type="text" id="name" name="name" required  lay-verify="required" placeholder="请输入资料名" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">类型</label>
                <div class="layui-input-block">
                    <select name="type" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="课件">课件</option>
                        <option value="视频">视频</option>
                        <option value="文档">文档</option>
                        <option value="笔记">笔记</option>
                        <option value="电子书">电子书</option>
                        <option value="其他">其他</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">描述</label>
                <div class="layui-input-block">
                    <textarea name="description" placeholder="简单描述资料的内容" class="layui-textarea" lay-verify="required" maxlength="30"></textarea>
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

                    <button class="layui-btn layui-btn-radius layui-btn-normal" lay-submit lay-filter="formDemo">立即提交</button>
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

<script>
    layui.use('upload', function(){
        var upload = layui.upload;

        //执行实例
        var uploadInst = upload.render({
            elem: '#test1' //绑定元素
            ,url: '/upload' //上传接口
            ,done: function(res){
                //上传完毕回调
                layer.msg("上传成功！"+res.msg);

                var filePath = $("#filePath");
                filePath.val(res.msg);
            }
            ,error: function(){
                layer.msg("上传失败，请稍后重试！");
            }
            ,accept: 'file' //允许上传的文件类型
        });
    });
</script>

</body>

</html>
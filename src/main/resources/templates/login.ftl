<!DOCTYPE html>

<html lang="en">

<head>

    <title>登录</title>

    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/css/bootstrap.css" />
    <link rel="stylesheet" href="/css/login.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/css/webbase.css" />
    <link rel="stylesheet" href="/css/pages-login-manage.css" />

</head>

<body>
<div style="height:1px;"></div>
<div class="login">
    <header style="font-family: YouYuan">
        <h3 style="color: red">${msg!''}<h3>
            <br/>
        <h1>华大学城<h1>
            <h1>登录</h1>
    </header>
    <div class="sr">
        <form action="/toLogin" id="registry_form" >
            <div class="name">
                <label>
                    <i class="sublist-icon glyphicon glyphicon-user"></i>
                </label>
                <input type="text"  id="number" name="number" placeholder="学号/教师号" style="font-family: YouYuan;font-size: medium" class="name_inp" value="${(formUser.number)!''}">
            </div>
            <div class="name">
                <label>
                    <i class="sublist-icon glyphicon glyphicon-pencil"></i>
                </label>
                <input type="password" id="password" name="password"  placeholder="密码" style="font-family: YouYuan;font-size: medium" class="name_inp">
            </div>

            <div style="margin-left: 25px" class="setting" >
                <div id="slider">
                    <div id="slider_bg"></div>
                    <span id="label">>></span> <span id="labelTip">拖动滑块验证</span> <#-- 为了防止暴力破解 -->
                </div>
            </div>

            &nbsp;&nbsp;
            <button class="dl" onclick="goIndex()">返回主页</button>&nbsp;
            <button class="dl" onclick="login()">登录</button>&nbsp;
            <button class="dl" onclick="goRegistry()">前往注册</button>
        </form>
    </div>
</div>

<div class="copy-right">
    <div class="container">
        <p>Copyright ©2019 华大学城  All Rights Reserved<br/>
            班级：15软件工程1班  &nbsp;&nbsp;    姓名：汪明鑫  &nbsp;&nbsp; 学号：1525161009<br/></p>

    </div>
</div>

<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/layer/layer.js"></script>
<script type="text/javascript" src="/js/jquery.slideunlock.js"></script>
<script type="text/javascript">
    function  goIndex() {
        window.event.returnValue=false;
        window.location.href = "/";
    }
</script>

<script type="text/javascript">
    function  login() {

        var number = $("#number").val();
        var password = $("#password").val();

        if(number ==null || number.length==0 || number.trim() == "") {
            layer.alert("学号/教师号不能为空！");
            $("#number").val("");
            return;
    }

        if(password ==null || password.length==0 || password.trim() == "") {
            layer.alert("密码不能为空！");
            $("#number").val("");
            return;
        }

        window.event.returnValue=false;
        var registry_form = $("#registry_form");
        registry_form.submit();
    }
</script>

<script type="text/javascript">
    function  goRegistry() {
        window.event.returnValue=false;
        window.location.href = "/registry";
    }
</script>

<script>
    $(function(){
        var slider = new SliderUnlock("#slider",{
            successLabelTip : "欢迎登录华大学城"
        },function(){
             layer.alert("验证成功");
        });
        slider.init();
    })
</script>

</body>

</html>
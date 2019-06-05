<!DOCTYPE html>

<html lang="en">

<head>

    <title>注册</title>

    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/css/bootstrap.css" />
    <link rel="stylesheet" href="/css/login.css" />
    <link rel="stylesheet" href="/css/style.css" />


</head>

<body>

<div class="registry">
    <header style="font-family: YouYuan">
        <h3 style="color: red">${msg!''}<h3>
            <br/>
        <h1>华大学城<h1>
        <h1>注册</h1>
    </header>
    <div class="sr">
        <form action="/toRegistry" id="registry_form">
            <div class="name">
                <label>
                    <i class="sublist-icon glyphicon glyphicon-user"></i>
                </label>
                <input type="text" id="number" placeholder="学号/教师号"  maxlength="10" name="number" class="name_inp">
            </div>
            <div class="name">
                <label>
                    <i class="sublist-icon glyphicon glyphicon-user"></i>
                </label>
                <input type="text" id="classes" placeholder="班级(2015级软件工程1班)教师可不填" maxlength="18" name="classes" class="name_inp">
            </div>
            <div class="name">
                <label>
                    <i class="sublist-icon glyphicon glyphicon-user"></i>
                </label>
                <input type="text" id="name"   placeholder="请填写你的真实姓名" name="name" maxlength=12 class="name_inp">
            </div>

            <div class="name">
                <label>
                    <i class="sublist-icon glyphicon glyphicon-pencil"></i>
                </label>
                <input type="text" id="nickname"    placeholder="昵称" name="nickname" maxlength=12 class="name_inp">
            </div>

            <div class="name">
                <label>
                    <i class="sublist-icon glyphicon glyphicon-pencil"></i>
                </label>
                <input type="tel"  id="phoneNumber" placeholder="手机号" name="phoneNumber" maxlength=11 class="name_inp">
            </div>

            <div class="name">
                <label>
                    <i class="sublist-icon glyphicon glyphicon-pencil"></i>
                </label>
                <input type="password" id="password"  placeholder="请输入6至16位密码" minlength="6" maxlength="16" name="password" class="name_inp">
            </div>

            <div class="name">
                <label>
                    <i class="sublist-icon glyphicon glyphicon-pencil"></i>
                </label>
                <input type="password" id="confirmPassword"  placeholder="确认密码" name="confirmPassword" class="name_inp">
            </div>

            <div style="color: black;font-family: YouYuan">
                <label>
                    <i class="sublist-icon glyphicon glyphicon-pencil"></i>
                </label>
                <label class="radio-inline"><input type="radio" checked="checked" name="sex" value="0">男</label>
                &nbsp;
                <label class="radio-inline"><input type="radio" name="sex" value="1">女</label>
                &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                <label class="radio-inline"><input type="radio" checked="checked" name="type" value="0">学生</label>
                &nbsp;
                <label class="radio-inline"><input type="radio" name="type" value="1">教师</label>
            </div>

            <br/>

            <div class="form-group">
                <textarea class="form-control" id="signature" placeholder="填写你的个性签名(可以不填，最多50字)" maxlength="50" rows="3" name="signature" required="false" style="resize: none"></textarea>
            </div>

            <br/>
            <button class="dl" onclick="goIndex()">返回主页</button> &nbsp;
            <button class="dl" onclick="registry()">注册</button>&nbsp;
            <button class="dl" onclick="goLogin()">前往登陆</button>
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
<script type="text/javascript" src="/js/jquery.form.js"></script>

<script type="text/javascript">
    function  goIndex() {
        window.event.returnValue=false;
        window.location.href = "/";
    }
</script>

<script type="text/javascript">
    function  registry() {

        var number = $("#number").val();
        var classes = $("#classes").val();
        var name = $("#name").val();
        var nickname = $("#nickname").val();
        var phoneNumber = $("#phoneNumber").val();
        var password = $("#password").val();
        var confirmPassword = $("#confirmPassword").val();

        //获取选择框的值  老师或学生
        var type = $("input[name='type']:checked").val();

        //注意去空格
        if(number ==null || number.length==0 || number.trim() == "") {
            layer.alert("学号/教师号不能为空！");
            return;
        }

        //学生必须填班级，老师不用
        if(type == 0){
            if(classes ==null || classes.length==0 || classes.trim() == "") {
                layer.alert("班级不能为空！");
                return;
            }
        }

        if(name ==null || name.length==0 || name.trim() == "") {
            layer.alert("姓名不能为空！");
            return;
        }

        if(nickname ==null || nickname.length==0 || nickname.trim() == "") {
            layer.alert("昵称不能为空！");
            return;
        }

        if(phoneNumber ==null || phoneNumber.length==0 || phoneNumber.trim() == "") {
            layer.alert("手机号不能为空！");
            return;
        }

        if(password ==null || password.length==0 || password.trim() == "") {
            layer.alert("密码不能为空！");
            return;
        }

        if(confirmPassword ==null || confirmPassword.length==0 || confirmPassword.trim() == "") {
            layer.alert("确认密码不能为空！");
            return;
        }

        if(password.length <6 || password.length>16) {
            layer.alert("请输入6-16位密码！");
            return;
        }

        if(password != confirmPassword) {
            layer.alert("密码和确认密码不同！");
            return;
        }

        window.event.returnValue=false;
        //window.location.href = "/toRegistry";
        var registry_form = $("#registry_form");
        /*registry_form.ajaxForm({
            success:processData
        });*/
        registry_form.submit();

    }

    /*function processData(data) {    // data 保存提交后返回的数据，一般为 json 数据
        var ret = eval("("+data+")");
        if(ret=="success")  {
            layer.msg("注册成功，欢迎加入大家庭！");
        }
        else if(ret=="fail"){
            layer.msg("注册失败，请稍后重试！");
        }
        else if(ret =="exist"){
            layer.msg("注册失败，该学号已注册！请正确填写学号！");
        }
    }*/

</script>

<script type="text/javascript">
    function  goLogin() {
        window.event.returnValue=false;
        window.location.href = "/login";
    }
</script>

</body>

</html>
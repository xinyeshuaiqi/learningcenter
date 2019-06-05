<!DOCTYPE html>

<html lang="en">

<head>

    <title>后台管理</title>

    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/css/bootstrap.css" />
    <link rel="stylesheet" href="/js/layui/css/layui.css" />
    <link rel="stylesheet" href="/css/style.css" />


    <!-- 管理后台 -->

    <!-- theme stylesheet-->
    <link rel="stylesheet" href="/css/style.default.css" id="theme-stylesheet">
    <!-- Custom stylesheet - for your changes-->
    <link rel="stylesheet" href="/css/custom.css">


</head>

<body>



<div class="page">
    <!-- Main Navbar-->
    <header class="header">
        <nav class="navbar">

            <div class="container-fluid">
                <div class="navbar-holder d-flex align-items-center justify-content-between">
                    <!-- Navbar Header-->
                    <div class="navbar-header">
                        <!-- Navbar Brand --><a href="/admin" class="navbar-brand d-none d-sm-inline-block">
                        <div class="brand-text d-none d-lg-inline-block"><strong>华大学城后台管理</strong></div></a>
                        <!-- Toggle Button--><a id="toggle-btn" href="#" class="menu-btn active"><span></span><span></span><span></span></a>

                        </br/>
                        <div class="brand-text d-none d-lg-inline-block"><a href="/">< 前往前台</a></div>
                    </div>
                    <!-- Navbar Menu -->
                    <ul class="nav-menu list-unstyled d-flex flex-md-row align-items-md-center">
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <div class="page-content d-flex align-items-stretch">
        <!-- Side Navbar -->
        <nav class="side-navbar">
            <!-- Sidebar Header-->
            <div class="sidebar-header d-flex align-items-center">
                <div class="avatar"><i class="layui-icon layui-icon-username" style="font-size: 40px; color: #1E9FFF;"></i>   </div>
                <div class="title">
                    <h1 class="h4">${(nowuser.nickname)!""}</h1>
                </div>
            </div>
            <!-- Sidebar Navidation Menus--><span class="heading">Main</span>
            <ul class="list-unstyled">
                <li class="active"><a href="/admin"> <i class="icon-home"></i>主页 </a></li>
                <li><a href="/userAdmin"> <i class="icon-grid"></i>用户管理 </a></li>
                <li><a href="/activityAdmin"> <i class="icon-grid"></i>活动管理 </a></li>
                <li><a href="/bookAdmin"> <i class="icon-grid"></i>书籍管理 </a></li>
                <li><a href="/materialsAdmin"> <i class="icon-grid"></i>资料管理 </a></li>
                <li><a href="/topicAdmin"> <i class="icon-grid"></i>帖子管理 </a></li>

            </ul>

        </nav>


        <div class="content-inner">
            <!-- Page Header-->
            <header class="page-header">
                <div class="container-fluid">
                    <h2 class="no-margin-bottom">管理后台主页</h2>
                </div>
            </header>




                        <div class="col-lg-3" style="margin-top:100px;margin-left: 100px">
                            <div class="card">

                                <div class="card-body">
                                    <h3>修改密码</h3>
                                    <br/>

                                    <form class="layui-form" action="/updatePas" onsubmit="check()">

                                        <input type="hidden" id="id" name="id" value="${id!""}"/>

                                        <div class="layui-form-item">
                                            <div class="layui-input-inline">
                                                <input type="password" name="password" id="password" required lay-verify="required" placeholder="请输入6-16位新密码" minlength="6" maxlength="16" autocomplete="off" class="layui-input">
                                            </div>
                                        </div>

                                        <div class="layui-form-item">
                                            <div class="layui-input-inline">
                                                <input type="password" name="confirmPassword" id="confirmPassword" required lay-verify="required" placeholder="请确认新密码" autocomplete="off" class="layui-input">
                                            </div>
                                        </div>

                                        <div class="layui-form-item">
                                            <div class="layui-input-block">
                                                <button class="layui-btn" lay-submit lay-filter="formDemo">提交</button>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>

                        <input type="hidden" id="msg" name="msg" value="${msg!""}"/>

                        <div class="copy-right" style="margin-top: 700px;width: 100%">
                            <div class="container">
                                <p>Copyright ©2019 华大学城  All Rights Reserved<br/>
                                    班级：15软件工程1班  &nbsp;&nbsp;    姓名：汪明鑫  &nbsp;&nbsp; 学号：1525161009<br/></p>

                            </div>
                        </div>

                    </div>
                </div>
        </div>







<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/layer/layer.js"></script>
<script type="text/javascript" src="/js/layui/layui.js"></script>
        <script type="text/javascript" src="/js/front.js"></script>

<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){

            var password = $("#password").val();
            var confirmPassword = $("#confirmPassword").val();

            if(password.length <6 || password.length>16) {
                layer.alert("请输入6-16位密码！");
                return false;
            }

            if(password != confirmPassword) {
                layer.alert("密码和确认密码不同！");
                return false;
            }

            return true;
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function(){
        var msg = $("#msg").val();
        if(msg == "" || msg == null){
        }else{
            layer.alert(msg);
        }
    })
</script>


</body>

</html>
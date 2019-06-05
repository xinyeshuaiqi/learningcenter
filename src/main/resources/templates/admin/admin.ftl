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


            <!-- Client Section-->
            <section class="client no-padding-top">
                <div class="container-fluid">
                    <div class="row">


                        <div class="col-lg-4" style="margin-top:50px">
                            <div class="work-amount card">

                                <div class="card-body">
                                    <h3>欢迎登陆华大学城后台管理！</h3>

                                </div>
                            </div>
                        </div>


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



</body>

</html>
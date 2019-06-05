<!DOCTYPE html>

<html lang="en">

<head>

    <title>活动管理</title>

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
                <li><a href="/admin"> <i class="icon-home"></i>主页 </a></li>
                <li><a href="/userAdmin"> <i class="icon-grid"></i>用户管理 </a></li>
                <li class="active"><a href="/activityAdmin"> <i class="icon-grid"></i>活动管理 </a></li>
                <li><a href="/bookAdmin"> <i class="icon-grid"></i>书籍管理 </a></li>
                <li><a href="/materialsAdmin"> <i class="icon-grid"></i>资料管理 </a></li>
                <li><a href="/topicAdmin"> <i class="icon-grid"></i>帖子管理 </a></li>

            </ul>

        </nav>


        <div class="content-inner">
            <!-- Page Header-->
            <header class="page-header">
                <div class="container-fluid">
                    <h2 class="no-margin-bottom">活动管理</h2>
                </div>
            </header>

            <section class="tables">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">

                                <div class="card-body">
                                    <div class="table-responsive">

                                        <table class="layui-table">
                                            <#--<colgroup>
                                                <col width="150">
                                                <col width="200">
                                                <col>
                                            </colgroup>-->
                                            <thead>
                                            <tr>
                                                <th>序号</th>
                                                <th>主题</th>
                                                <th>描述</th>
                                                <th>发布人</th>
                                                <th>创建时间</th>
                                                <th>开始时间</th>
                                                <th>地点</th>
                                                <th>预计需要时长</th>
                                                <th>人数</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>

                                                <#list activityList as activity>

                                                <tr>
                                                    <td>${activity_index+1}</td>
                                                    <td>${activity.topic}</td>
                                                    <td>${activity.description}</td>
                                                    <td>${(activity.nickname)!""}</td>
                                                    <td>${(activity.createTime?string('yyyy-MM-dd HH:mm:ss'))!""}</td>
                                                    <td>${(activity.startTime?string('yyyy-MM-dd HH:mm:ss'))!""}</td>
                                                    <td>
                                                        ${activity.address}
                                                    </td>

                                                    <td>
                                                        ${activity.cost}
                                                    </td>

                                                    <td>
                                                        <#if (activity.totalNumber) == 1>  <#--判断user和name有一个不为空就进if语句-->
                                1-20人
                                                        <#elseif (activity.totalNumber) == 2>
                                20-50人
                                                        <#elseif (activity.totalNumber) == 3>
                                50-100人
                                                        <#elseif (activity.totalNumber) == 4>
                                100人以上
                                                        </#if>
                                                    </td>

                                                    <td>
                                                        <button class="layui-btn layui-btn-sm" onclick="deleteActivityById(${activity.id})">
                                                            <i class="layui-icon">&#xe640;</i>
                                                        </button>
                                                    </td>


                                                </tr>

                                                </#list>


                                            </tbody>
                                        </table>


                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>


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

<script type="text/javascript">
    function deleteActivityById(data) {
        //window.location.href="/deleteById?id="+data;

        layer.alert('确定删除？', {
            skin: 'layui-layer-lan'
            ,anim: 4 //动画类型
            ,time: 0 //不自动关闭
            ,btn: ['确定', '取消']
            ,yes: function(index){
                layer.close(index);
                $.ajax({
                    url: "/deleteById?id="+data,
                    type: "GET",
                    async: true,
                    dataType: 'json',
                    contentType: 'application/json;charset=UTF-8',
                    success: function (response) {
                        if (response.success) {
                            layer.msg('删除成功！', {time:1000}
                                    ,function () {
                                        window.location.href = "/activityAdmin";
                                    }
                            );
                        } else {
                            layer.msg('删除失败！');
                        }
                    }
                });
            }
        });

    }
</script>



</body>

</html>
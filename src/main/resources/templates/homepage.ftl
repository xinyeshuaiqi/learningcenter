<!DOCTYPE html>

<html lang="en">

<head>

    <title>个人主页</title>

    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/css/bootstrap.css" />
    <link rel="stylesheet" href="/css/style.css" />
    <link rel="stylesheet" href="/js/layui/css/layui.css" />

    <style type="text/css">
        a:hover{
            color: #b1dfbb;
        }
        a{
            color: chocolate;
        }

        /* Make the image fully responsive */
        .carousel-inner img {
            width: 800px;
            height: 400px;
        }

    </style>

</head>

<body>

<div style="width: 100% ; height: 432px; background:url(../images/bg.jpg) no-repeat 0px 0px; ">
   <div style="margin-left: 100px; padding-top: 50px;font-family:STHupo ;color: black;font-size: xx-large">
       华大学城
   </div>

    <div style="margin-left: 140px; padding-top: 20px;font-family:STHupo ;color: black;font-size: x-large">
       ${(nowuser.nickname)!''}的个人主页
    </div>

    <div style="margin-left: 140px; padding-top: 20px;font-family:STHupo ;color: black;font-size: x-large">
        <tr style="font-size: medium">
            <td><a href="/">首页<a></td>&nbsp;
            <td><a href="/topicView">学吧<a></td>&nbsp;
            <td><a href="/materialsView">资料库<a></td>&nbsp;
            <td><a href="/bookView">图书馆<a></td>&nbsp;
            <td><a href="/activityView">活动<a></td>&nbsp;
            <td><a href="/resetPassword">忘记密码<a></td>&nbsp;
            <td><a href="/loginout">退出登陆<a></td>
        </tr>
    </div>

</div>

<#--<div>
    头像
</div>-->

<div id="demo" style="width: 40%; height: auto ; margin-left: 1000px;margin-top: 80px"  class="carousel slide" data-ride="carousel">

    <!-- 指示符 -->
    <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
        <li data-target="#demo" data-slide-to="3"></li>
    </ul>

    <!-- 轮播图片 -->
    <div  class="carousel-inner" >
        <div class="carousel-item ">
            <a href="/uploadFile"><img src="/images/a.jpg"></a>
            <div class="carousel-caption">
                <h3 style="font-family: STHupo" >我要上传资料 </h3>
                <p></p>
            </div>
        </div>
        <div class="carousel-item active">
            <a href="/borrowBook"><img src="/images/book.jpg"></a>
            <div class="carousel-caption">
                <h3 style="font-family: STHupo" >我要借出书籍</h3>
                <p></p>
            </div>
        </div>
        <div class="carousel-item">
            <a href="/createActivity"><img src="/images/building.jpg"></a>
            <div class="carousel-caption">
                <h3 style="font-family: STHupo" >我要创建活动</h3>
                <p></p>
            </div>
        </div>
        <div class="carousel-item">
            <a href="/createTopic"><img src="/images/portfolio-8.jpg"></a>
            <div class="carousel-caption">
                <h3 style="font-family: STHupo" >我要发表帖子</h3>
                <p></p>
            </div>
        </div>
    </div>

    <!-- 左右切换按钮 -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>

</div>

<div style="margin-top: -480px" class="about-bottom">
    <div class="container">
        <div class="col-md-7 agileinfo_about_grids_bottom_right" style="margin-left: 200px">
            <div class="agileinfo_about_grids_bottom_right-pos">
                <h3 style="font-family: YouYuan;">${(nowuser.nickname)!''}</h3>
                <br/>
                <div class="container">
                    <table style="font-family: YouYuan;font-size: large"  class="table table-striped">
                        <tbody>
                        <tr <#--class="table-warning"-->>
                            <td>身份</td>
                            <td>
                                    <#if nowuser.type ==0>
                                        学生
                                    <#else>
                                        教师
                                    </#if>

                            </td>
                        </tr>
                        <tr>
                            <td>班级</td>
                            <td>${(nowuser.classes)!''}</td>
                        </tr>
                        <tr <#--class="table-warning"-->>
                            <td>学号</td>
                            <td>${(nowuser.number)!''}</td>
                        </tr>

                        <tr>
                            <td>姓名</td>
                            <td>${(nowuser.name)!''}</td>
                        </tr>
                        <tr <#--class="table-warning"-->>
                            <td>性别</td>
                            <td>
                            <#if nowuser.sex ==0>
                                男
                            <#else>
                                        女
                            </#if>
                            </td>
                        </tr>
                        <tr>
                            <td>手机号</td>
                            <td>
                            ${(nowuser.phoneNumber)!''}
                            </td>
                        </tr>

                        </tbody>
                    </table>

                </div>

                <div class="container">
                    <div style="font-family: YouYuan;background-color: #b1dfbb" class="card">
                        <div class="card-body">
                            <p class="card-title" style="font-size: large;color: black;margin-top: -10px">个性签名</p>
                            <p class="card-text" style="font-size: medium;color: black;margin-top: -6px;margin-top: 6px;"> ${(nowuser.signature)!''}</p>
                        </div>
                    </div>
                </div>

                <div style="margin-left: 400px;margin-top: 30px">
                    <button type="button" class="btn btn-outline-danger" onclick="editInfo()">编辑基本信息</button>
                </div>

            </div>
        </div>

    </div>
</div>
<#--
<div style="margin-top: 550px" class="about-bottom">
    <div class="container">
        <div class="col-md-7 agileinfo_about_grids_bottom_right" style="margin-left: 200px">
            <div class="agileinfo_about_grids_bottom_right-pos">
                <h3 style="font-family: YouYuan;">我的备忘录</h3>

                <br/>
                <div class="form-group">
                    <textarea class="form-control"  placeholder="填写备忘录" maxlength="50" rows="3" required="false" style="resize: none"></textarea>
                </div>

                <div style="margin-left: 480px;margin-top: 30px">
                    <button type="button" class="btn btn-outline-danger">编辑</button>
                </div>
            </div>
        </div>

    </div>
</div>-->


<div class="container" style="margin-top: 600px">

    <div class="card bg-light text-dark" style="height: auto">
        <div class="card-body">
            <div class="card-title"><h3 style="font-family: YouYuan">我上传的资料

                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;

                <button class="layui-btn" onclick="uploadFile()">
                    <i class="layui-icon">&#xe608;</i> 上传资料
                </button>

            </h3></div>

            <table class="layui-table">

                <thead>
                <tr>
                    <th>序号</th>
                    <th>资料名</th>
                    <th>类型</th>
                    <th>描述</th>
                    <th>创建时间</th>
                    <th>下载数</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                     <#list materialsList as materials>
                     <tr>
                         <td>${materials_index+1}</td>
                         <td>${(materials.name)!""}</td>
                         <td>${(materials.type)!""}</td>

                         <td>
                             ${(materials.description)!""}
                         </td>

                         <td>${(materials.createTime?string('yyyy-MM-dd HH:mm:ss'))!""}</td>

                         <td>${(materials.downloadNum)!""}</td>

                         <td>
                             <button class="layui-btn layui-btn-sm" onclick="editMaterials(${materials.id})">
                                 <i class="layui-icon">&#xe642;</i>
                             </button>
                             <button class="layui-btn layui-btn-sm" onclick="deleteMaterialsById(${materials.id})">
                                 <i class="layui-icon">&#xe640;</i>
                             </button>
                             <button class="layui-btn layui-btn-sm" onclick="materialsInfo(${materials.id})" >
                                 <i class="layui-icon">查看详情&#xe602;</i>
                             </button>
                         </td>
                     </tr>
                     </#list>
                </tbody>
            </table>

        </div>
    </div>

    <div class="card bg-light text-dark" style="height: auto;margin-top: 50px">
        <div class="card-body" >
            <div class="card-title"><h3 style="font-family: YouYuan">我借出的书籍

                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;

                <button class="layui-btn" onclick="createBook()">
                    <i class="layui-icon">&#xe608;</i> 借出书籍
                </button>
            </h3></div>

            <table class="layui-table">

                <thead>
                <tr>
                    <th>序号</th>
                    <th>书名</th>
                    <th>类型</th>
                    <th>状态</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <#list bookList as book>
                <tr>
                    <td>${book_index+1}</td>
                    <td>${(book.name)!""}</td>
                    <td>${(book.type)!""}</td>

                    <td>
                        <#if book.status == 0>
                                未借出
                        <#else>
                                借出
                        </#if>
                    </td>

                    <td>${(book.createTime?string('yyyy-MM-dd HH:mm:ss'))!""}</td>

                    <td>
                        <button class="layui-btn layui-btn-sm" onclick="editBook(${book.id})">
                            <i class="layui-icon">&#xe642;</i>
                        </button>
                        <button class="layui-btn layui-btn-sm" onclick="deleteBookById(${book.id})">
                            <i class="layui-icon">&#xe640;</i>
                        </button>
                        <button class="layui-btn layui-btn-sm" onclick="bookDetail(${book.id})" >
                            <i class="layui-icon">查看详情&#xe602;</i>
                        </button>
                    </td>
                </tr>
                </#list>

                </tbody>
            </table>

        </div>
    </div>

    <div class="card bg-light text-dark" style="height: auto;margin-top: 50px">
        <div class="card-body" >
            <div class="card-title" >
                <h3 style="font-family: YouYuan">我创建的活动

                    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                    &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                    &nbsp; &nbsp;

                    <button class="layui-btn" onclick="createActivity()">
                        <i class="layui-icon">&#xe608;</i> 创建活动
                    </button>
                </h3>
            </div>

            <table class="layui-table" style="font-family: YouYuan">
                <colgroup>
                    <col width="5%">
                    <col width="15%">
                    <col width="13%">
                    <col width="7%">
                    <col width="7%">
                    <col width="7%">
                    <col width="13%">
                    <col width="10%">
                </colgroup>

                <thead>
                <tr>
                    <th>序号</th>
                    <th>主题</th>
                    <th>时间</th>
                    <th>地点</th>
                    <th>用时</th>
                    <th>人数</th>
                    <th>创建时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                <#list activitieList as activity>
                    <tr>
                        <td>${activity_index+1}</td>
                        <td>${(activity.topic)!""}</td>
                        <td>${(activity.startTime?string('yyyy-MM-dd HH:mm:ss'))!""}</td>
                        <td>${(activity.address)!""}</td>
                        <td>
                            <#if (activity.cost) == 100>  <#--判断user和name有一个不为空就进if语句-->
                                5小时以上
                            <#else >
                                ${(activity.cost)!''}小时
                            </#if>
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
                        <td>${(activity.createTime?string('yyyy-MM-dd HH:mm:ss'))!""}</td>
                        <td>
                            <button class="layui-btn layui-btn-sm" onclick="editActivity(${activity.id})">
                                <i class="layui-icon">&#xe642;</i>
                            </button>
                            <button class="layui-btn layui-btn-sm" onclick="deleteById(${activity.id})">
                                <i class="layui-icon">&#xe640;</i>
                            </button>
                        </td>
                    </tr>
                </#list>

                </tbody>
            </table>

        </div>
    </div>

    <div class="card bg-light text-dark" style="height: auto;margin-top: 50px">
        <div class="card-body">
            <div class="card-title">
                <h3 style="font-family: YouYuan">我发表的帖子
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
                &nbsp; &nbsp;

                <button class="layui-btn" onclick="createTopic()">
                    <i class="layui-icon">&#xe608;</i> 发表帖子
                </button>

                </h3>

            </div>

            <table class="layui-table">

                <thead>
                <tr>
                    <th>序号</th>
                    <th>标题</th>
                    <th>发表时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                    <#list topicList as topic>
                    <tr>
                        <td>${topic_index+1}</td>
                        <td>${(topic.title)!""}</td>

                        <td>${(topic.createTime?string('yyyy-MM-dd HH:mm:ss'))!""}</td>
                        <#--<td>${(topic.updateTime?string('yyyy-MM-dd HH:mm:ss'))!""}</td>-->

                        <td>
                            <button class="layui-btn layui-btn-sm" onclick="editTopic(${topic.id})">
                                <i class="layui-icon">&#xe642;</i>
                            </button>
                            <button class="layui-btn layui-btn-sm" onclick="deleteTopicById(${topic.id})">
                                <i class="layui-icon">&#xe640;</i>
                            </button>
                            <button class="layui-btn layui-btn-sm" onclick="topicInfo(${topic.id})" >
                                <i class="layui-icon">查看详情&#xe602;</i>
                            </button>
                        </td>
                    </tr>
                    </#list>

                </tbody>
            </table>

        </div>
    </div>
</div>


<div class="copy-right" style="margin-top: 100px">
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
    function createActivity() {
        window.location.href="/createActivity";
    }
</script>

<script type="text/javascript">
    function deleteById(data) {
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
                                    window.location.href = "/homepage";
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

<script type="text/javascript">

    function editActivity(data) {
        window.location.href="/editActivity?id="+data;
    }

</script>

<script type="text/javascript">

    function editInfo() {
        window.location.href="/editInfo";
    }

</script>

<script type="text/javascript">
    function bookDetail(data) {
        window.location.href="/bookInfo?id="+data;
    }
</script>

<script type="text/javascript">
    function editBook(data) {
        window.location.href="/editBook?id="+data;
    }
</script>

<script type="text/javascript">
    function deleteBookById(data) {

        alert(data);

        layer.alert('确定删除？', {
            skin: 'layui-layer-lan'
            ,anim: 4 //动画类型
            ,time: 0 //不自动关闭
            ,btn: ['确定', '取消']
            ,yes: function(index){
                layer.close(index);
                $.ajax({
                    url: "/deleteBookById?id="+data,
                    type: "GET",
                    async: true,
                    dataType: 'json',
                    contentType: 'application/json;charset=UTF-8',
                    success: function (response) {
                        if (response.success) {
                            layer.msg('删除成功！', {time:1000}
                                    ,function () {
                                        window.location.href = "/homepage";
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

<script type="text/javascript">
    function createBook() {
        window.location.href="/borrowBook";
    }
</script>


<script type="text/javascript">
    function uploadFile() {
        window.location.href="/uploadFile";
    }
</script>

<script type="text/javascript">
    function deleteMaterialsById(data) {

        alert(data);

        layer.alert('确定删除？', {
            skin: 'layui-layer-lan'
            ,anim: 4 //动画类型
            ,time: 0 //不自动关闭
            ,btn: ['确定', '取消']
            ,yes: function(index){
                layer.close(index);
                $.ajax({
                    url: "/deleteMaterialsById?id="+data,
                    type: "GET",
                    async: true,
                    dataType: 'json',
                    contentType: 'application/json;charset=UTF-8',
                    success: function (response) {
                        if (response.success) {
                            layer.msg('删除成功！', {time:1000}
                                    ,function () {
                                        window.location.href = "/homepage";
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

<script type="text/javascript">
    function materialsInfo(data) {
        window.location.href="/materialsInfo?id="+data;
    }
</script>

<script type="text/javascript">
    function editMaterials(data) {
        window.location.href="/editMaterials?id="+data;
    }
</script>

<script type="text/javascript">
    function createTopic() {
        window.location.href="/createTopic";
    }
</script>

<script type="text/javascript">
    function deleteTopicById(data) {

        alert(data);

        layer.alert('确定删除？', {
            skin: 'layui-layer-lan'
            ,anim: 4 //动画类型
            ,time: 0 //不自动关闭
            ,btn: ['确定', '取消']
            ,yes: function(index){
                layer.close(index);
                $.ajax({
                    url: "/deleteTopicById?id="+data,
                    type: "GET",
                    async: true,
                    dataType: 'json',
                    contentType: 'application/json;charset=UTF-8',
                    success: function (response) {
                        if (response.success) {
                            layer.msg('删除成功！', {time:1000}
                                    ,function () {
                                        window.location.href = "/homepage";
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

<script type="text/javascript">
    function topicInfo(data) {
        window.location.href="/topicInfo?id="+data;
    }
</script>

<script type="text/javascript">
    function editTopic(data) {
        window.location.href="/editTopic?id="+data;
    }
</script>

</body>

</html>
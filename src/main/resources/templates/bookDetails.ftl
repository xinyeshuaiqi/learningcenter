<!DOCTYPE html>

<html lang="en">

<head>

    <title>图书详情</title>

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
    <img src="/images/book.jpg" class="rounded-circle" >
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

<div class="card" style="width: 40%;margin: 200px auto">

    <div class="card-body" style="font-family: YouYuan">
        <h2 class="card-title" style="font-family: YouYuan">图书详情</h2>
        <br/>
        <br/>
        <img src="http://${fileurl}/${book.coverPath}" class="rounded" style="width: 500px;height: 500px">
        <br/>
        <br/>
        <div>
            <table class="table  table-hover">

                <tbody>
                <tr>
                    <td>书名</td>
                    <td>${book.name}</td>
                </tr>
                <tr>
                    <td>类型</td>
                    <td>${(book.type)!}</td>
                </tr>
                <tr>
                    <td>描述</td>
                    <td>${(book.description)!}</td>
                </tr>

                <tr>
                    <td>发布时间</td>
                    <td>${(book.createTime?string('yyyy-MM-dd HH:mm:ss'))!""}</td>
                </tr>

                <tr>
                    <td>发布人</td>
                    <td>${(book.nickname)!""}</td>
                </tr>

                <tr>
                    <td>发布人手机号</td>
                    <td>${(book.phoneNumber)!""}</td>
                </tr>

                <tr>
                    <td>状态</td>
                    <td>
                        <#if book.status == 0>
                            未借出
                        <#else>
                            借出
                        </#if>
                    </td>
                </tr>

                </tbody>
            </table>

        </div>
        <br/>
        <br/>
        <br/>
        <div style="font-family: YouYuan">
            <table class="table  table-hover">
                <title>借书列表</title>

                <thead>
                    <tr>
                        <th>借书人</th>
                        <th>借出时间</th>
                        <th>预计归还时间</th>
                        <th>实际归还时间</th>
                    </tr>

                </thead>

                <tbody>
                    <#list borrowBooks as borrowBook>
                    <tr>

                        <td>
                            ${(borrowBook.nickname)!""}
                        </td>

                        <td>
                            ${(borrowBook.borrowTime?string('yyyy-MM-dd HH:mm:ss'))!""}
                        </td>

                        <td>
                            ${(borrowBook.willreturnTime?string('yyyy-MM-dd HH:mm:ss'))!""}
                        </td>

                        <td>
                            ${(borrowBook.realreturnTime?string('yyyy-MM-dd HH:mm:ss'))!""}
                        </td>

                    </tr>

                    </#list>

                </tbody>
            </table>

        </div>




        <!-- 图书未借出才显示这一块 -->
        <#if book.status == 0>
        <br/>
        <br/>
        <br/>
        <br/>

            <form class="layui-form" action="/takeBook">
                <input type="hidden" name="id" value="${(book.id)!""}">

                <span style="font-family: YouYuan">选择借书时长</span>
                <br/>
                <br/>
                <select name="keepTime" lay-verify="required">
                    <option value="5">5天</option>
                    <option value="30">30天</option>
                    <option value="50">60天</option>
                    <option value="90">90天</option>
                </select>
                <br/>
                <br/>
                <button class="layui-btn layui-btn-fluid" type="submit">我要借书</button>
            </form>

        <#else>

        </#if>


    </div>
</div>

<#--<div id="selectTime" class="card bg-secondary" style="width: 30%;margin: auto; margin-top: -500px;"  hidden>

    <div class="card-body" style="font-family: YouYuan">
        <h3 class="card-title" style="font-family: YouYuan;color: wheat">选择借书时长</h3>
        <br/>
        <form class="layui-form" action="/takeBook">
            <input type="hidden" name="id" value="${(book.id)!""}">

            <select name="keepTime" lay-verify="required">
                <option value="5">5天</option>
                <option value="30">30天</option>
                <option value="50">60天</option>
                <option value="90">90天</option>
            </select>
            <br/>
            <button type="submit" class="layui-btn layui-btn-fluid">确认</button>
        </form>


    </div>
</div>-->


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

<script type="text/javascript">
    layui.use('form', function(){
        var form = layui.form;

    });
</script>

<#--<script type="text/javascript">
    function borrowBook(data) {

        layer.confirm('确定参加吗?', {
            btn: ['确定','取消'] //按钮
        }, function(){

            layer.load();

            //此处演示关闭
            setTimeout(function(){
                layer.closeAll('loading');
            }, 1000);


            return true;

        }, function(){
        });

    }
</script>-->

</body>

</html>
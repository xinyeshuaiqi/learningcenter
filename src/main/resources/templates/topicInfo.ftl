<!DOCTYPE html>

<html lang="en">

<head>

    <title>帖子详情</title>

    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/css/bootstrap.css" />
    <link rel="stylesheet" href="/js/layui/css/layui.css" />
    <link rel="stylesheet" href="/css/style.css" />

    <style type="text/css">
        #top a{
            color: #1c7430;
        }

        #top a:hover{
           color: chartreuse;
        }

        #isLike a:hover{
            color: red;
        }

    </style>

</head>


<body>


<div style="margin-left: 50px;margin-top: 50px">
    <img src="/images/file.jpg" class="rounded-circle" width="10%" height="20%">
</div>

<div style="width: 100%;height: 60px;background-color: lightgrey;margin-top: -160px">

    <div id="top" style="padding-left: 1400px;padding-top: 10px">
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
        <h2 class="card-title" style="font-family: YouYuan">帖子信息</h2>
        <br/>
        <br/>
       <#-- <img src="http://${fileurl}/${book.coverPath}" class="rounded" style="width: 500px;height: 500px">-->

        <div>
            <table <#--class="table  table-hover"--> class="layui-table" lay-skin="line" lay-size="lg">

                <colgroup>
                    <col width="150">

                </colgroup>

                <tbody >
                <tr >
                    <td>标题</td>
                    <td>${topic.title}</td>
                </tr>
                <tr>
                    <td>内容</td>
                    <td>${(topic.content)!}</td>
                </tr>
                <tr>
                    <td>发布人</td>
                    <td>${(topic.nickName)!""}</td>
                </tr>
                <tr>
                    <td>发表时间</td>
                    <td>${(topic.createTime?string('yyyy-MM-dd HH:mm:ss'))!""}</td>
                </tr>
                <tr>
                    <td>修改时间</td>
                    <td>${(topic.updateTime?string('yyyy-MM-dd HH:mm:ss'))!""}</td>
                </tr>

                </tbody>
            </table>
            <br/>
            <div id="isLike" style="margin-left: 20px;font-size: x-large">
                <font  color="red">${(topic.likeNum)!""}赞
                    <a href="/like?id=${topic.id}"><i class="layui-icon layui-icon-praise" style="font-size: 20px;"></i></a>
                </font>
                &nbsp;
                <font  color="#d2691e">${(topic.dislikeNum)!""}踩
                    <a href="/dislike?id=${topic.id}"><i class="layui-icon layui-icon-tread" style="font-size: 20px;"></i></a>
                </font>
            </div>

            <!-- 点赞信息 -->
            <input type="hidden" id="msg" name="msg" value="${msg!""}"/>


        </div>

        <br/>
        <br/>
        <br/>
        <br/>
        <br/>

        <!-- 评论 -->
        <div id="reply">
            <h3>评论</h3>


            <#list topic.replyList as reply>

            <div class="card bg-info text-white" style="margin-top: 50px">
                <div class="card-body">
                    <span style="font-size: large"><i class="layui-icon layui-icon-username"></i>   ${reply.nickName}:</span>
                    <br/>
                    ${(reply.createTime?string('yyyy-MM-dd HH:mm:ss'))!""}
                    <br/>
                    <br/>
                    ${reply.content}
                    <br/>
                    <br/>
                   <#-- <span style="padding-left: 700px">${(reply.createTime?string('yyyy-MM-dd HH:mm:ss'))!""}</span>-->
                    <#--<span style="padding-left: 770px">
                        <button class="layui-btn layui-btn-lg layui-btn-warm" onclick="replyComment(${reply.id})">回复</button>
                    </span>-->

                    <div class="layui-collapse">
                        <div class="layui-colla-item">
                            <h2 class="layui-colla-title">回复</h2>
                            <div class="layui-colla-content layui-show" style="color: white;font-size: medium">

                                <table class="layui-table" lay-skin="line">
                                    <colgroup>
                                        <col width="150">
                                        <col width="200">
                                        <col width="80">

                                        <col>
                                    </colgroup>

                                    <tbody>

                                    <#list reply.children as child>
                                    <tr>
                                        <td>${(child.nickName)!""} </td>
                                        <td>${(child.createTime?string('yyyy-MM-dd HH:mm:ss'))!""}</td>
                                        <td>回复:</td>

                                        <td> ${(child.content)!""}</td>
                                    </tr>

                                    </#list>

                                    </tbody>
                                </table>

                                <textarea name="replycomment" id="replycomment" placeholder="回复"  maxlength="100" style="width: 100%;height: 100px"></textarea>

                                <span style="padding-left: 750px">
                                    <button class="layui-btn layui-btn-lg layui-btn-warm" onclick="replyComment(${reply.id})">回复</button>
                                </span>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            </#list>

            <br/>
            <br/>
            <br/>
            <br/>

            <form class="layui-form " action="/topicComment" style="margin-right: 100px">

                <input type="hidden" name="id" id="id" value="${(topic.id)!""}"/>

                <div class="layui-form-item layui-form-text">
                    <div class="layui-input-block">
                        <textarea name="content" placeholder="评论" class="layui-textarea" lay-verify="required" maxlength="100"></textarea>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                        <button class="layui-btn layui-btn layui-bt" lay-submit lay-filter="formDemo">发表评论</button>
                    </div>
                </div>
            </form>

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

<script type="text/javascript">
    function  replyComment(data) {

        var replycomment = $("#replycomment").val();
        var topicId = $("#id").val();

        window.location.href="/replyComment?id="+data+"&content="+replycomment+"&topicId="+topicId;
    }
    
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
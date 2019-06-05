<!DOCTYPE html>

<html lang="en">

<head>

    <title>图书馆</title>

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
            color: red;
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



<!-- 图片 -->
<div class="portfolio" id="portfolio">
    <div class="container">
        <h3 style="font-family: YouYuan">图书列表</h3>

        <br/>
        <form class="layui-form " method="post" action="/searchBook" style="width: 50%;/*border:1px solid burlywood;*/ margin-left: 50px;" >
            <br/>
            <div class="layui-form-item">
                <label class="layui-form-label">书名</label>
                <div class="layui-input-block">
                    <input type="text" id="name" name="name"   autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">类型</label>
                <div class="layui-input-block">
                    <select name="type" >
                        <option value="">请选择</option>
                        <option value="计算机">计算机</option>
                        <option value="数学">数学</option>
                        <option value="物理">物理</option>
                        <option value="化学">化学</option>
                        <option value="语文">语文</option>
                        <option value="英语">英语</option>
                        <option value="文学">文学</option>
                        <option value="小说">小说</option>
                        <option value="政治">政治</option>
                        <option value="历史">历史</option>
                        <option value="地理">地理</option>
                        <option value="军事">军事</option>
                        <option value="法律">法律</option>
                        <option value="经济">经济</option>
                        <option value="生物">生物</option>
                        <option value="医学">医学</option>
                        <option value="其他">其他</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">描述</label>
                <div class="layui-input-block">
                    <textarea name="description"  class="layui-textarea" maxlength="30"></textarea>
                </div>
            </div>



            <div class="layui-form-item">
                <div class="layui-input-block">

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <button class="layui-btn layui-btn-radius layui-btn-fluid layui-btn-normal" type="submit" >搜索</button>
                </div>
            </div>
        </form>

        <br/>

        <div class="row portfolio_grid_w3lss">

             <#list books as book>

                 <#if book_index==6 || book_index==7 || book_index==8>
                        <div class="col-4 portfolio_grid_w3ls" style="margin-top:-20px">
                            <div  class="view second-effect" >
                                <a class="zb" rel=" " href="/bookDetail?id=${book.id}" title="${(book.name)!""}">
                                    <img src="http://${fileurl}/${book.coverPath}"  class="img-responsive" width="400px" height="400px">
                                    <div class="mask">
                                        <p>${(book.name)!""}</p>
                                    </div>
                                </a>
                            </div>
                        </div>
                <#else>
                    <div class="col-4 portfolio_grid_w3ls" style="margin-top: 10px; ">
                        <div  class="view second-effect">
                            <a class="zb" rel=" " href="/bookDetail?id=${book.id}" title="${(book.name)!""}">
                                <img src="http://${fileurl}/${book.coverPath}"  class="img-responsive">
                                <div class="mask">
                                    <p>${(book.name)!""}</p>
                                </div>
                            </a>
                        </div>
                    </div>

                 </#if>


             </#list>



        </div>
    </div>
</div>



<div class="copy-right" >
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

    });

</script>

</body>

</html>
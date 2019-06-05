<!DOCTYPE html>

<html lang="en">

<head>

    <title>首页</title>

    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/css/bootstrap.css" />
    <link rel="stylesheet" href="/css/style.css" />

</head>

<body>

<!-- banner -->
<div class="banner">
    <div class="container">
        <nav class="navbar navbar-default">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">

                <div class="logo" style="margin-left: -200px">
                    <h1><a class="navbar-brand" href="/" style="font-family: STCaiyun">华大学城</a></h1>
                </div>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class=" navbar-collapse nav-wil" >
                <nav class="link-effect-2" id="link-effect-2">
                    <ul class="nav navbar-nav" style="font-family: STHupo">
                        <li class="active" ><a href="/">首页</a></li>
                        <li></li>
                        <li><a href="/topicView" class="scroll">学吧</a></li>
                        <li></li>
                        <li><a href="/materialsView" class="scroll">资料库</a></li>
                        <li></li>
                        <li><a href="/bookView" class="scroll">图书馆</a></li>
                        <li></li>
                        <li><a href="/activityView" class="scroll">活动</a></li>
                        <li></li>
                        <li><a href="/homepage" class="scroll">个人主页</a></li>
                        <li></li>
                        <li><a href="/registry" class="scroll">注册</a></li>
                        <li></li>
                        <li><a href="/login" class="scroll">登陆</a></li>
                    </ul>
                </nav>
            </div>
            <!-- /.navbar-collapse -->

            <div class="navbar-header">
                <div class="logo" style=" position: absolute ; margin-left: -1150px; margin-top: -100px">
                    <h3 style="font-family: STHupo;color: white">

                    <#--${(user.name)!''}-->
                        <#if (nowuser.nickname)??>  <#--判断user和name有一个不为空就进if语句-->
                            你好,${nowuser.nickname}
                        </#if>
                    </h3>
                </div>
            </div>

        </nav>

        <div class="banner-info" style="padding-bottom: 5px">
            <h2>公告</h2>
            <p style="font-size: x-large">欢迎加入华大学城，
                和小伙伴们一起进步</p>
            <div class="more">
                <a href="#" class="hvr-shutter-in-vertical" data-toggle="modal" data-target="#myModal">Read More<span class="glyphicon glyphicon-arrow-right"></span></a>
            </div>
            <!--modal-video-->
            <div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4>&nbsp;&nbsp; 华大学城</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" >&times;</span></button>
                        </div>
                        <section>
                            <div class="modal-body">
                                <p>
                                    你是否还在为期末考试而发愁？你是否还在为找不到学习资料而苦恼？你是否因为找不到学习伙伴而没有动力？
                                    你是否不知道学习方向而迷茫？你想不想参加更多的学习活动来提升自己？你愿意沉下心看老师同学推荐的书吗？</p>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //banner -->
<!-- about -->
<div class="about" id="about" style="margin-top: -100px">
    <div class="container">
        <div class="about-grids">
            <div class="col-md-5 w3_about_grid_left">
                <h3>Welcome <span>To</span> <i>华大学城</i></h3>
            </div>
            <br/>
            <div class="col-md-7 about_grid_right_w3agile">
                <p>
                    对华侨大学老师同学开放的学习交流平台。
                    <span>
                    在这里，你可以和老师同学们交流学习;你可以发表自己的问题，也可以帮助别人解决问题;
                    你可以向老师同学借需要的书籍;你可以上传你的学习资料课件等，也下载需要的资料，可以达到全校共享学习资源;
                    你还可以和老师同学在一起参加学习活动 ...
                    </span>

                    <span>在这里一起学习一起进步</span></p>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<div class="about-bottom">
    <div class="container">
        <div class="about-grids-bottom">
            <div class="col-md-15 about-grids-bottom-left">
            </div>
            <div class="col-md-7 agileinfo_about_grids_bottom_right" style="margin-left: 200px">
                <img src="images/portfolio-8.jpg" alt=" " class="img-responsive" style="margin-left: 200px"/>
                <div class="agileinfo_about_grids_bottom_right-pos">
                    <h3>为什么做这样的一个网站</h3>
                    <p>在大学四年里，在老师和同学的帮助下学到了很多的知识，
                        但是有时候发现校园的学习氛围不够浓厚，
                        还有时候不知道该学习什么，没有学习方向和目标，
                        期末考试前比较慌，往往没办法做到充足的复习，
                        遇到不会的不知道该问谁，
                        学习资料、课件等有时候不是老师忘记上传，就是分散在好几个群不好找，
                        想组织或参加一些学习活动不知道在哪报名
                        <span>因此做这样的一个网站就是为了尝试解决上述的一些问题</span></p>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>

<div style="background-color: orange; margin-bottom: 50px">
<div id="features-sec" class="container set-pad"  >
    <div class="row text-center">
        <div class="col-lg-8 col-lg-offset-2 col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
            <br/>
            <h1 data-scroll-reveal="enter from the bottom after 0.2s"  class="header-line" style="font-family: YouYuan">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;功能列表
            </h1>
            <br>
            <br/>
        </div>

    </div>
    <!--/.HEADER LINE END-->


    <div class="row" >


        <div class="col-lg-3  col-md-3 col-sm-4" data-scroll-reveal="enter from the bottom after 0.4s">
            <div class="about-div">
                <h3 >学吧</h3>
                <hr />
                <p >
                    学习讨论区，可以自由的交流
                </p>
                <br/>
                <a href="/topicView" class="btn btn-info btn-set">前往体验</a>
            </div>
        </div>
        <div class="col-lg-3  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.5s">
            <div class="about-div">

                <h3 >资料库</h3>

                <hr />
                <p >
                    资料共享区，提供学习资料的上传和下载

                </p>
                <br/>
                <a href="/materialsView" class="btn btn-info btn-set"  >前往体验</a>
            </div>
        </div>
        <div class="col-lg-3  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.6s">
            <div class="about-div">

                <h3 >图书馆</h3>
                <hr />

                <p >
                    图书借阅区，提供图书借阅
                </p>
                <br/>
                <a href="/bookView" class="btn btn-info btn-set"  >前往体验</a>
            </div>
        </div>

        <div class="col-lg-3  col-md-4 col-sm-4" data-scroll-reveal="enter from the bottom after 0.6s">
            <div class="about-div">

                <h3 >活动</h3>
                <hr />

                <p >
                    学习活动区，学习活动的组织和参加
                </p>
                <br/>
                <a href="/activityView" class="btn btn-info btn-set"  >前往体验</a>
            </div>
        </div>


    </div>
    <br/>
    <br/>
</div>
</div>
<!-- FEATURES SECTION END-->

<!-- 图片 -->
<div class="portfolio" id="portfolio">
    <div class="container">
        <h3 style="font-family: YouYuan">学习直达</h3>
        <p class="aut">直接跳转至感兴趣的页面</p>
        <div class="row portfolio_grid_w3lss">
            <div class="col-lg-4 col-md-4 col-sm-4 portfolio_grid_w3ls">
                <div class="view second-effect">
                    <a class="zb" rel=" " href="#" title="学习">
                        <img src="images/a1.jpg" alt="" class="img-responsive">
                        <div class="mask">
                            <p>学习</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 portfolio_grid_w3ls">
                <div class="view second-effect">
                    <a class="zb" rel=" " href="#" title="学习">
                        <img src="images/c1.jpg" alt=""  class="img-responsive" />
                        <div class="mask">
                            <p>学习</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 portfolio_grid_w3ls">
                <div class="view second-effect">
                    <a class="zb" rel=" " href="#" title="学习">
                        <img src="images/c2.jpg" alt=""  class="img-responsive" />
                        <div class="mask">
                            <p>学习</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 portfolio_grid_w3ls">
                <div class="view second-effect">
                    <a class="zb" rel=" " href="#" title="学习">
                        <img src="images/a4.jpg" alt=""  class="img-responsive" />
                        <div class="mask">
                            <p>学习</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 portfolio_grid_w3ls">
                <div class="view second-effect">
                    <a class="zb" rel=" " href="#" title="学习">
                        <img src="images/a5.jpg" alt=""  class="img-responsive" />
                        <div class="mask">
                            <p>学习</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 portfolio_grid_w3ls">
                <div class="view second-effect">
                    <a class="zb" rel=" " href="#" title="学习">
                        <img src="images/a6.jpg" alt="" class="img-responsive" />
                        <div class="mask">
                            <p>学习</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 portfolio_grid_w3ls">
                <div class="view second-effect">
                    <a class="zb" rel=" " href="#" title="学习">
                        <img src="images/a7.jpg" alt=""  class="img-responsive" />
                        <div class="mask">
                            <p>学习</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 portfolio_grid_w3ls">
                <div class="view second-effect">
                    <a class="zb" rel=" " href="#" title="学习">
                        <img src="images/a8.jpg" alt=""  class="img-responsive" />
                        <div class="mask">
                            <p>学习</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 portfolio_grid_w3ls">
                <div class="view second-effect">
                    <a class="zb" rel=" " href="#" title="学习">
                        <img src="images/a9.jpg" alt=""  class="img-responsive" />
                        <div class="mask">
                            <p>学习</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //图片 -->

<!-- 联系 -->
<div class="portfolio-video" style="margin-bottom: 150px; margin-top: 100px">
    <div class="container" style="margin-left: 600px">
        <h3 style="font-family: YouYuan">联系 & 反馈</h3>
        <p> 如果你在使用过程中有任何问题或者想参与项目开发，或者想成为网站维护管理员，请联系我
            <br>
            <br>
            手机号:18850079747
            <br>
            邮箱:1042704561@qq.com
        </p>
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
<script type="text/javascript" src="/js/move-top.js"></script>
<script type="text/javascript" src="/js/easing.js"></script>
<#--<script type="text/javascript">
    jQuery(document).ready(function($) {
        $(".scroll").click(function(event){
            event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
        });
    });
</script>-->
<script type="text/javascript">
    $(document).ready(function() {
        /*
            var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
            };
        */

        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>

</body>

</html>
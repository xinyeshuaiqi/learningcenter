<!DOCTYPE html>

<html lang="en">

<head>

    <title>编辑个人信息</title>

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

    </style>

</head>

<body style="background-color:lightcyan">

<div style="width: 100% ; height: 432px; background:url(../images/bg.jpg) no-repeat 0px 0px; ">
    <div style="margin-left: 100px; padding-top: 50px;font-family:STHupo ;color: black;font-size: xx-large">
        华大学城
    </div>

    <div style="margin-left: 140px; padding-top: 20px;font-family:STHupo ;color: black;font-size: x-large">
        编辑个人信息
    </div>

    <div style="margin-left: 140px; padding-top: 20px;font-family:STHupo ;color: black;font-size: x-large">
        <tr style="font-size: medium">
            <td><a href="/homepage"><- 返回个人主页<a></td>
            &nbsp;&nbsp;
            <td><a href="/">首页<a></td>&nbsp;
            <td><a href="/topicView">学吧<a></td>&nbsp;
            <td><a href="/materialsView">资料库<a></td>&nbsp;
            <td><a href="/bookView">图书馆<a></td>&nbsp;
            <td><a href="/activityView">活动<a></td>
        </tr>
    </div>

</div>

<div style="margin-top: -30px;margin-left: 100px;" class="about-bottom">
    <div class="container" >
        <div  class="col-md-6 agileinfo_about_grids_bottom_right">
            <div class="agileinfo_about_grids_bottom_right-pos" style="margin-left: 600px;background-color: cornsilk">
                <h3 style="font-family: YouYuan;">编辑个人信息 &nbsp; <#-- <span style="color: red;font-size: x-large">${createActivity!""}</span>-->
                </h3>

                <br/>

                <form class="layui-form" action="/toEditInfo" id="activity_form" style="font-family: YouYuan" onsubmit="return checkValue()">

                    <input  type="hidden" name="id" value="${(nowuser.id)!''}"/>

                    <table>
                        <tr>
                            <td>班级:&nbsp;</td>
                            <td width="400px"><input type="text" class="form-control" id="classes" name="classes" value="${(nowuser.classes)!''}"></td>

                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>学号:&nbsp;</td>
                            <td width="400px">
                                <input type="text" class="form-control" id="number" name="number" value="${(nowuser.number)!''}"></td>
                            </td>
                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                        <td>姓名:&nbsp;</td>
                        <td width="400px">
                            <input type="text" class="form-control" id="name" name="name" value="${(nowuser.name)!''}"/>
                        </td>
                    </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>昵称:&nbsp;</td>
                            <td width="400px">
                                <input type="text" class="form-control" id="nickname" name="nickname" value="${(nowuser.nickname)!''}"/>
                            </td>
                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>手机:&nbsp;</td>
                            <td width="400px">
                                <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${(nowuser.phoneNumber)!''}"/>
                            </td>
                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>性别:&nbsp;&nbsp;</td>
                            <td width="400px">

                                <#if (nowuser.sex) == 0>
                                    <input type="radio" name="sex" value="0" title="男" checked>
                                    <input type="radio" name="sex" value="1" title="女" >
                                <#else >
                                    <input type="radio" name="sex" value="0" title="男">
                                    <input type="radio" name="sex" value="1" title="女" checked>
                                </#if>

                            </td>

                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>签名:&nbsp;</td>
                            <td width="400px">
                                <textarea class="form-control"  rows="4" id="signature" name="signature" maxlength="50" style="resize: none">${(nowuser.signature)!""}</textarea>
                            </td>

                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                    </table>

                    <br/>
                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <button type="submit" class="btn btn-outline-danger">保存</button>

                </form>

                </div>
            </div>
        </div>

    </div>
</div>


<div class="copy-right" style="margin-top: 600px">
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
    function checkValue() {
        var number = $("#number").val();
        var classes = $("#classes").val();
        var name = $("#name").val();
        var nickname = $("#nickname").val();
        var phoneNumber = $("#phoneNumber").val();

        //注意去空格
        if(number ==null || number.length==0 || number.trim() == "") {
            layer.alert("学号不能为空！");
            return false;
        }

        if(classes ==null || classes.length==0 || classes.trim() == "") {
            layer.alert("班级不能为空！");
            return false;
        }

        if(name ==null || name.length==0 || name.trim() == "") {
            layer.alert("姓名不能为空！");
            return false;
        }

        if(nickname ==null || nickname.length==0 || nickname.trim() == "") {
            layer.alert("昵称不能为空！");
            return false;
        }

        if(phoneNumber ==null || phoneNumber.length==0 || phoneNumber.trim() == "") {
            layer.alert("手机号不能为空！");
            return false;
        }

        return true;
    }

</script>

</body>

</html>
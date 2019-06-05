<!DOCTYPE html>

<html lang="en">

<head>

    <title>编辑活动</title>

    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="/css/bootstrap.css" />
    <link rel="stylesheet" href="/css/style.css" />

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
        编辑活动
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
                <h3 style="font-family: YouYuan;">编辑学习活动 &nbsp; <#-- <span style="color: red;font-size: x-large">${createActivity!""}</span>-->
                </h3>

                <br/>

                <form action="/toEditActivity" id="activity_form" style="font-family: YouYuan" onsubmit="return checkValue()">

                    <input type="hidden" name="id" value="${(activityToEdit.id)!""}"/>

                    <table>
                        <tr>
                            <td>主题:&nbsp;</td>
                            <td width="400px"><input type="text" class="form-control" id="topic" name="topic" value="${(activityToEdit.topic)!""}"></td>

                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>描述:&nbsp;</td>
                            <td width="400px">
                                <textarea class="form-control"  rows="4" id="description" name="description" maxlength="50" style="resize: none">${(activityToEdit.description)!""}</textarea>
                            </td>
                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>时间:&nbsp;</td>
                            <td width="400px">
                               <input type="datetime-local" placeholder="活动开始时间" class="form-control" id="startTimeStr" name="startTimeStr" value="${(activityToEdit.startTime?string('yyyy-MM-dd'T'HH:mm'))!""}""/>
                            </td>
                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>地点:&nbsp;</td>
                            <td width="400px"><input type="text" class="form-control" id="address" name="address" value="${(activityToEdit.address)!""}">
                            </td>

                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>用时:&nbsp;</td>
                            <td width="400px">
                                <#--<input type="text" placeholder="活动预计耗时(小时)  选填" class="form-control" id="cost" name="cost">-->
                                <select class="form-control" id="cost"  name="cost">
                                    <option value="1">1小时</option>
                                    <option value="1.5">1.5小时</option>
                                    <option value="2">2小时</option>
                                    <option value="2.5">2.5小时</option>
                                    <option value="3">3小时</option>
                                    <option value="3.5">3.5小时</option>
                                    <option value="4">4小时</option>
                                    <option value="4.5">4.5小时</option>
                                    <option value="5">5小时</option>
                                    <option value="100">5小时以上</option>
                                </select>
                            </td>

                        </tr>

                        <tr>
                            <td>&nbsp;</td>
                        </tr>

                        <tr>
                            <td>人数:&nbsp;</td>
                            <td width="400px">
                                    <#--<input type="text" placeholder="活动人数限制   选填" class="form-control" id="totalNumber" name="totalNumber">-->
                                <#--<label class="radio-inline"><input type="radio" name="totalNumber" value="1" checked>1-20人</label>&nbsp;
                                <label class="radio-inline"><input type="radio" name="totalNumber" value="2">20-50人</label>&nbsp;
                                <label class="radio-inline"><input type="radio" name="totalNumber" value="3">50人-100人</label>&nbsp;
                                <label class="radio-inline"><input type="radio" name="totalNumber" value="4">100人以上</label>-->

                                <select class="form-control" id="totalNumber"  name="totalNumber">
                                    <option value="1">1-20人</option>
                                    <option value="2">20-50人</option>
                                    <option value="3">50-100人</option>
                                    <option value="4">100人以上</option>
                                </select>

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


<div class="copy-right" style="margin-top: 680px">
    <div class="container">
        <p>Copyright ©2019 华大学城  All Rights Reserved<br/>
            班级：15软件工程1班  &nbsp;&nbsp;    姓名：汪明鑫  &nbsp;&nbsp; 学号：1525161009<br/></p>

    </div>
</div>

<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<script type="text/javascript" src="/js/layer/layer.js"></script>

<script type="text/javascript">
    function checkValue() {
        var topic = $("#topic").val();
        var description = $("#description").val();
        var startTimeStr = $("#startTimeStr").val();
        var address = $("#address").val();
        /* var cost = $("#cost").val();
         var totalNumber = $("#totalNumber").val();*/
        /*var totalNumber = $('input:radio:checked').val();*/

        if(topic ==null || topic.length==0 || topic.trim() == "") {
            layer.alert("主题不能为空！");
            return false;
        }

        if(description ==null || description.length==0 || description.trim() == "") {
            layer.alert("描述不能为空！");
            return false;
        }

        if(startTimeStr ==null || startTimeStr.length==0 || startTimeStr.trim() == "") {
            layer.alert("时间不能为空！");
            return false;
        }

        if(address ==null || address.length==0 || address.trim() == "") {
            layer.alert("地点不能为空！");
            return false;
        }

        /* if(cost ==null || cost.length==0 || cost.trim() == "") {
             layer.alert("预计耗时不能为空！");
             return false;
         }

         if(totalNumber ==null || totalNumber.length==0 || totalNumber.trim() == "") {
             layer.alert("人数不能为空！");
             return false;
         }
 */
        return true;
    }

</script>

</body>

</html>
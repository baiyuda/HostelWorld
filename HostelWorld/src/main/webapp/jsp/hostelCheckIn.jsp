<%--
  Created by IntelliJ IDEA.
  User: yyy
  Date: 2017/3/28
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../img/icon.png">
    <title>userReserve</title>


    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" >
    <link rel="stylesheet" type="text/css" href="../css/main.css">
    <link rel="stylesheet" type="text/css" href="../css/userInfo.css">

</head>
<body>

<!--导航栏-->
<nav class="navbar navbar-inverse navbar-fixed-top my-nav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <img class="my-logo" src="../img/h-logo.png">
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <%--<li><a href="/hostel/list">首页</a></li>--%>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="float-right"><a href="#">${hostelSeq}</a></li>
                <li class="float-right"><a href="/user/logout">退出登录</a></li>
            </ul>
        </div>
    </div>
</nav>



<div class="container main-part">
    <!--侧边栏-->
    <div class="col-sm-3 col-md-2 sidebar my-sidebar float-left">
        <ul class="nav nav-sidebar">
            <li><a href="/hostel/info/${hostelId}">客栈信息</a></li>
            <li><a href="/jsp/hostelReleasePlan.jsp">发布计划</a></li>
            <li><a href="/jsp/hostelCheckIn.jsp">入店登记</a></li>
            <li><a href="/jsp/hostelCheckOut.jsp">离店登记</a></li>
        </ul>
    </div>

    <div class="col-sm-9 col-md-10 main-content float-right ">
        <div class="sub-title">
            <div>
                <a class="check-active check-tag" href="#">会员登记</a>
                <h3 style="display: inline">&nbsp/&nbsp</h3>
                <a class="check-tag" href="/jsp/nonMemberCheckIn.jsp">非会员登记</a>
            </div>
            <hr>
            <div class="col-sm-12">
                <div class="reserve-title">
                    <div class="col-sm-1">预订人</div>
                    <div class="col-sm-2">入住日期</div>
                    <div class="col-sm-2">退房日期</div>
                    <div class="col-sm-2">类型</div>
                    <div class="col-sm-1">房间数量</div>
                    <div class="col-sm-2">地址</div>
                    <div class="col-sm-1">支付</div>
                    <div class="col-sm-1">入住登记</div>
                </div>
                <div class="reserve-list" id="check-reserve-list">
                    <div class="check-reserve-item">
                        <div class="col-sm-1 reserver-name">1</div>
                        <div class="col-sm-2 start">2017.10.20</div>
                        <div class="col-sm-2 end">2017.11.20</div>
                        <div class="col-sm-2 type">单人房</div>
                        <div class="col-sm-1 num">10</div>
                        <div class="col-sm-2 address">鼓楼，南京</div>
                        <div class="col-sm-1 payMoney">150</div>
                        <div class="col-sm-1">
                            <button class="btn btn-default my-btn checkIn" data-toggle="modal" >
                                入住登记</button>
                        </div>
                        <!--添加入住人模态框-->
                        <div class="modal fade checkModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title grey-color">入住登记</h4>
                                    </div>
                                    <div class="modal-body liver-list">
                                        <div class="liver-item" >
                                            <span class="modal-param">入住人姓名：</span>
                                            <input type="text" name="livername" class="liver">
                                            <button class="add-minus glyphicon glyphicon-minus-sign minusLiver" ></button>
                                        </div>
                                    </div>
                                    <div>
                                        <button class="glyphicon glyphicon-plus add-minus my-add-item" style="color:rgb(100,100,100);"></button>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default btn-cancel" data-dismiss="modal">取消</button>
                                        <button type="button" class="btn btn-primary btn-confirm button-check-confirm" data-dismiss="modal">确认</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>



        </div>
    </div>
</div>





<script src="../plugin/jquery/jquery-3.1.1.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/checkIn.js"></script>
<script type="text/javascript">
    $(document).ready(
            function(){
                CheckReserveList.init();
                $.get({
                    url:"/hostel/checkReserve/"+${hostelId},
                    success:function(newList){
                        CheckReserveList.updateData(newList);
                    },
                    error:function(){
                        console.log("get check reserves wrong!");
                    }
                })
            }
    )
</script>

</body>
</html>

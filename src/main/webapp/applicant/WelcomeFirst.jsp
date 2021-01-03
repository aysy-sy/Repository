<!DOCTYPE html>
<html lang="zh-CN">

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>三和商场--客户订单管理系统</title>
    <!-- Bootstrap -->
    <link href="../bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="../js/jquery-1.11.3.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]--><!---->
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-6">
            <img src="../images/titlelogo.png" height="50px">
        </div>
       <div class="col-lg-6 col-md-4 hidden-xs col-sm-6">
            <img src="../images/header.png">
        </div>
        <div class="col-lg-2 col-md-4" style="padding-top: 15px">
            <a href="login.jsp">登录</a>
            <a href="register.jsp">注册</a>
            <a href="shopcar.jsp">购物车</a>
        </div>
    </div>
</div>
<div class="container" style="margin-top: 10px">
    <nav class="navbar navbar-inverse" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">首页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">家纺</a></li>
                <li><a href="#">食品</a></li>
                <li><a href="#">生活用品</a></li>
                <li><a href="#">孕婴保健</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">所有分类 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">家纺</a></li>
                        <li><a href="#">食品</a></li>
                        <li><a href="#">生活用品</a></li>
                        <li class="divider"></li>
                        <li><a href="#">孕婴保健</a></li>
                        <li class="divider"></li>
                        <li><a href="#">其它</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>

        </div><!-- /.navbar-collapse -->
    </nav>
</div>
<div class="container">
    <div id="carousel-example-generic" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="../images/img5.jpg" alt="..." width="1200px">
                <!--<img src="../images/img8.jpg" alt="">-->
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="../images/img6.jpg" alt="..." width="1200px">
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item">
                <img src="../images/img7.jpg" alt="..." width="1200px">
                <div class="carousel-caption">
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>
</div>
<%

%>
<div class="container">
    <div class="row">
        <span id=" " style="font-size: 30px;padding-left:33px;">
            海淘精选   <!--<img src="title2.jpg">-->
        </span>
    </div>
    <div class="row">
        <div class="col-md-2 col-sm-2 hidden-xs hidden-sm" style="height: 400px;">
           <!-- <img src="big01.jpg" height="100%">-->
        </div>
        <div class="col-md-10 col-sm-10" style="padding-left: 10px;">
            <div class="row">
                <div class="col-md-6 hidden-xs hidden-sm" style="height:200px;width: 480px;">
                    <a href="#"><img src="../images/img9.jpg" height="100%" width="100%"></a>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="#"><img src="../images/10.jpg" width="160px"></a>
                    <a href="#"><p><font color="gray">自热火锅</font></p></a>
                    <p><font color="red">￥35</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="#"><img src="../images/8.jpg" width="160px"></a>
                    <a href="#"><p><font color="gray">自热火锅</font></p></a>
                    <p><font color="red">￥35</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="#"><img src="../images/9.jpg" width="160px"></a>
                    <a href="#"><p><font color="gray">自热火锅</font></p></a>
                    <p><font color="red">￥35</font></p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="#"><img src="../images/img10.jpeg" width="160px"></a>
                    <a href="#"><p><font color="gray">口红</font></p></a>
                    <p><font color="red">￥450</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="#"><img src="../images/img11.jpeg" width="160px"></a>
                    <a href="#"><p><font color="gray">电脑</font></p></a>
                    <p><font color="red">￥4000</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="#"><img src="../images/img12.jpeg" width="160px"></a>
                    <a href="#"><p><font color="gray">手表</font></p></a>
                    <p><font color="red">￥2000</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="#"><img src="../images/img13.jpeg" width="160px"></a>
                    <a href="#"><p><font color="gray">燕窝</font></p></a>
                    <p><font color="red">￥399</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="#"><img src="../images/img14.jpeg" width="160px"></a>
                    <a href="#"><p><font color="gray">机械键鼠</font></p></a>
                    <p><font color="red">￥200</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="#"><img src="../images/img15.jpeg" width="160px"></a>
                    <a href="#"><p><font color="gray">药</font></p></a>
                    <p><font color="red">￥100</font></p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--
<div class="container" style="margin-top:10px;">
    <div class="row">
        <div class="hidden-md hidden-sm hidden-xs" style="padding-left: 14px;">
            <img src="ad.jpg" style="width: 100%">
        </div>
    </div>
</div>-->

<div class="container">
    <div class="row">
        <span id="" style="font-size: 30px;padding-left:33px;">
            家纺家具  <!-- <img src="title2.jpg">-->
        </span>
    </div>
    <div class="row">
        <div class="col-md-2 col-sm-2 hidden-xs hidden-sm" style="height: 400px;">
           <!-- <img src="big01.jpg" height="100%">-->
        </div>
        <div class="col-md-10 col-sm-10" style="padding-left: 10px;">
            <div class="row">
                <div class="col-md-6 hidden-xs hidden-sm" style="height:200px;width: 480px;">
                    <a href="#"><img src="../images/img7.jpg" height="100%" width="100%"></a>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="#"><img src="../images/img16.jpeg" width="160px"></a>
                    <a href="#"><p><font color="gray">卫浴</font></p></a>
                    <p><font color="red">￥529</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="#"><img src="../images/img17.jpeg" width="160px"></a>
                    <a href="#"><p><font color="gray">摄像头</font></p></a>
                    <p><font color="red">￥300</font></p>
                </div>
                <div class="col-md-2 col-sm-4 col-xs-6" align="center">
                    <a href="#"><img src="../images/img18.jpeg" width="160px"></a>
                    <a href="#"><p><font color="gray">机械硬盘</font></p></a>
                    <p><font color="red">￥450</font></p>
                </div>
            </div>

        </div>
    </div>
</div>
<!--
<div class="container" style="margin-top:10px;">
    <div class="row">
        <div class="hidden-md hidden-sm hidden-xs" style="padding-left: 14px;">
            <img src="footer.jpg" style="width: 100%">
        </div>
    </div>
</div>-->

<div class="container" style="margin-top: 10px;">
    <div class="row">
        <ul class="list-inline"  align="center">
            <li><a href="#">关于我们</a></li>
            <li><a href="#">联系我们</a></li>
            <li><a href="#">招贤纳士</a></li>
            <li><a href="#">法律声明</a></li>
            <li><a href="#">有情链接</a></li>
            <li><a href="#">支付方式</a></li>
            <li><a href="#">配送方式</a></li>
            <li><a href="#">服务声明</a></li>
            <li><a href="#">广告声明</a></li>
        </ul>
        <div style="text-align: center;margin-top: 5px;margin-bottom: 20px;">
            CopyRight 0000-9999 三和商城 版权所有
        </div>
    </div>
</div>
</body>
</html>
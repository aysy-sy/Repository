<%--
  Created by IntelliJ IDEA.
  User: Mac
  Date: 2020/12/28
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@include file="app.jsp"%>--%>

<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>登录 - 三和商城</title>
    <link rel="stylesheet" type="text/css" href="../css/title.css">
    <link rel="stylesheet" type="text/css" href="../css/login-middle.css">
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            list-style: none;
            /*去掉列表前的点格式*/
            text-decoration: none;
            /*去掉列表的下划线*/
        }

        /*禁止页面左右移动*/
        html,
        body {
            max-width: 100%;
            overflow-x: hidden;
        }
    </style>
   </head>


<body class="bodyback">

<%--<a href="/cookieServlet">cookie</a>--%><%--
<%=request.getSession().isNew()%>--%>
<form action="/OrderManagementSystem/ApplicantLoginServlet" method="get">
    <!--从拦截器中获取被拦截前的请求地址
    -->
    <input type="hidden" name="requestPath" value="${requestScope.requestPath}">
<div class="header">
    <div class="headerback">

        <div class="home_page"><a href="product.jsp">首页</a></div>
        <div class="home_register"><a href="register.jsp">免费注册</a></div>
        <div class="home_login"><a href="login.jsp">登录</a></div>
    </div>
    <div class="header_buttom">登录——三和商城</div>
</div>
    <div class="middle">
        <div class="content">
            <%--<div class="page_name">登陆</div>--%>
            <div class="login_content">
                <div class="login_l">
                    <p class="font14">使用注册邮箱登录</p>
                    <div class="span1">
                        <label class="tn-form-label">邮箱：</label>
                        <input  class="tn-textbox" type="text" name="applicantAccount" style="width:200px; height:30px;">
                    </div>
                    <div class="span2">
                        <label class="tn-form-label">密码：</label>
                        <input class="tn-textbox"  type="password" name="applicantPwd" style="width:200px; height:30px;">
                    </div>
                    <%--<div class="choose">
                        <label>管&nbsp理&nbsp员&nbsp<input class="admin" type="radio" name="identity" value="管理员" style="width:25px; height:25px;"/></label>
                        <label>用&nbsp户&nbsp<input class="user" type="radio" name="identity" value="用户" style="width:25px; height:25px;"/></label>
                    </div>--%>
                    <div class="tn-form-row-button">
                        <div class="span3">
                            <input name="" type="submit" class="tn-button-text" value="登   录" style="width:300px; height:70px;">
                            <span class="it-register-text">
          <input checked="checked" class="tn-checkbox" value="true" type="checkbox">
          <label for="RememberPassword"> 记住密码</label>
          </span> </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="login_r">
                    <p align="center"> <b>还没有帐号？</b><a  href="register.jsp">10秒钟快速注册</a></p>

                   <%-- <div><img src="../images/login_pic.jpg"></div>--%>

                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>

    <div class="buttom">

    </div>

</form><%--
<iframe src="foot.html" width="100%" height="150"  scrolling="no" frameborder="0" ></iframe>--%>
</body>
</html>

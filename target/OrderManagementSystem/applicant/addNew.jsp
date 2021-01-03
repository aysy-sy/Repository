<%--
  Created by IntelliJ IDEA.
  User: Mac
  Date: 2020/12/30
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>产品增加</title>
    <link rel="stylesheet" href="../css/title.css" type="text/css">
    <link rel="stylesheet" href="../css/addNew.css" type="text/css">




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
<body>
<div class="header">
    <div class="headerback">
        <div class="home_page"><a href="product-Admin.jsp">首页</a></div>
        <p>三和商城</p>
        <%--
        <div class="home_register"><a href="register.jsp">注册</a></div>
        <div class="home_login"><a href="login.jsp">登录</a></div>--%>
    </div>
</div>
<form action="/OrderManagementSystem/AddProServlet" method="get" target="right">
<div class="middle">
    <div class="span1">
        <label class="tn-form-label">产品名字：</label>
        <input  class="tn-textbox" type="text" name="ProductName" style="width:200px; height:30px;">
    </div>
    <div class="span2">
        <label class="tn-form-label">产品进价：</label>
        <input class="tn-textbox"  type="text" name="ProductpPrice" style="width:200px; height:30px;">
    </div>
    <div class="span3">
        <label class="tn-form-label">产品售价：</label>
        <input class="tn-textbox"  type="text" name="ProductsPrice" style="width:200px; height:30px;">
    </div>
    <div class="span4">
        <label class="tn-form-label">产品数量：</label>
        <input class="tn-textbox"  type="text" name="ProductCount" style="width:200px; height:30px;">
    </div>
    <div class="span5">
        <label class="tn-form-label">产品类型：</label>
        <input class="tn-textbox"  type="text" name="ProductType" style="width:200px; height:30px;">
    </div>

    <div class="tn-form-row-button">
        <div class="span6">

            <input name="" type="submit" class="tn-button-text" value="添   加" style="width:200px; height:50px;">
            <a href="product.jsp">返回</a>
        </div>
    </div>
</div>
<div class="buttom"></div>
</form>
</body>
</html>

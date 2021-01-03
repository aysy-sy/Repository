<%--
  Created by IntelliJ IDEA.
  User: Mac
  Date: 2020/12/30
  Time: 0:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>产品信息管理-三和商城</title>
    <link rel="stylesheet" href="../css/title.css" type="text/css">
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
        <div class="home_register"><a href="register.html">注册</a></div>
        <div class="home_login"><a href="login.jsp">登录</a></div>--%>
    </div>
    <div class="header_buttom">
        三和商城</div>
</div>
<div class="middle">
    <a href="Personal-Admin.jsp">个人中心</a>
    <a href="type.jsp">分类管理界面</a>
    <a href="User.jsp">客户管理界面</a>

    <div>商品</div>
    <div class="title">
        <li>产品名</li>
        <li>价格</li>
        <li>类型</li>
        <li>数量</li>
        <li>销售量</li>
    </div>

</div>
<div class="buttom"></div>

</body>
</html>

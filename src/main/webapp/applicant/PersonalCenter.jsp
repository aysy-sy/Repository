<%@ page import="com.jsu.order.bean.Applicant" %><%--
  Created by IntelliJ IDEA.
  User: Mac
  Date: 2020/12/30
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心-三和商城</title>
    <link rel="stylesheet" href="../css/title.css" type="text/css">
    <link rel="stylesheet" href="../css/personalCenter.css" type="text/css">
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

    <%--<div class="headerback">
        <div class="home_page"><a href="product.jsp">首页</a></div>
        <p>三和商城</p>
        <div class="home_shopcar"><a href="shopcar.jsp">购物车</a></div>
        <div class="home_Favorites"><a href="Favorites.jsp">收藏夹</a></div>
    </div>--%>
</div>
<form action="/OrderManagementSystem/PersonalServlet" method="get">
<div class="middle">
    <%-- <div class="span1">
           <label class="tn-form-label">邮箱：</label>
            <input class="tn-textbox" type="text" name="applicantAccount" style="width:200px; height:30px;">
        </div>
        <div class="span2">
            <label class="tn-form-label">密码：</label>
            <input class="tn-textbox" type="password" name="applicantPwd" style="width:200px; height:30px;">
        </div>--%>
        <%
            String appAccount="";
            String psw="";
            Cookie[] cookies=request.getCookies();
            if(cookies!=null && cookies.length!=0){
                for(int i=0;i<cookies.length;i++){
                    Cookie cookie = cookies[i];
                    if(cookie.getName().equals("applicantAccount")){
                        appAccount = cookie.getValue();
                    }
                    if(cookie.getName().equals("psw")){
                        psw = cookie.getValue();
                    }
                }

            }
        %>
        <div class="span1">
            <label class="tn-form-label">
                账&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp号
            </label>
            <%--<%=user.getAccount()%>--%>
            <input type="text" class="tn-textbox" name="applicantAccount" id="account" readonly value="<%=appAccount%>" disabled="disabled" style="width:200px; height:30px;">
        </div>
        <div class="span2">
            <label class="tn-form-label">
                旧&nbsp密&nbsp码&nbsp
            </label>
            <input type="text" class="tn-textbox" name="applicantPwd" id="pwd" style="width:200px; height:30px;">
        </div>
        <div class="span3">
            <label class="tn-form-label">
                新&nbsp密&nbsp码&nbsp
            </label>
            <input type="text" class="tn-textbox" name="applicantPwd2" id="pwd2" style="width:200px; height:30px;">
        </div>
        <div class="span4">
            <label class="tn-form-label">
                用&nbsp户&nbsp名&nbsp
            </label>
            <input type="text" class="tn-textbox" name="applicantName" id="name" style="width:200px; height:30px;">
        </div>
        <div class="span5">
            <label class="tn-form-label">
                联系电话
            </label>
            <input type="text" class="tn-textbox" name="applicantPhone" placeholder="xxxxxxxxxxx " pattern="\d{11}" id="phone" style="width:200px; height:30px;">
        </div>
        <div class="span6">
            <label class="tn-form-label">
                住&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp址
            </label>
            <input type="text" class="tn-textbox" name="applicantAddress" id="address" style="width:200px; height:30px;">
        </div>
        <div class="span7">

            <input name="change" type="submit" class="tn-button-text" value="确认修改"  style="width:200px; height:70px;">
        </div>
    </div>
</form>
    <div class="buttom"></div>

</body>
</html>

<%--
  Created by IntelliJ IDEA.
  User: Mac
  Date: 2020/12/30
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人中心-三和商城</title>
    <%--<link rel="stylesheet" href="../css/title.css" type="text/css">--%>
    <link rel="stylesheet" href="../css/personalCenter.css" type="text/css">
    <script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript">
        //1.使用ajax方法进行请求服务器
        $(function () {
            $("#btnTJ").click(function () {
                //1..确认两次密码是否一致
                if ($("#pwd3").val() != $("#pwd2").val()) {
                    alert("两次输入的密码不一致！");
                    return;
                }else {
                    alert("密码输入一致");
                };
        });//2》。监听提交按钮的单击事件
        });//1》。页面加载函数
    </script>
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
    </div>
</div>
<form action="/OrderManagementSystem/PersonalServlet" method="get">
    <div class="middle">
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
               重新输入新密码
            </label>
            <input type="text" class="tn-textbox" name="applicantPwd2" id="pwd3" style="width:200px; height:30px;">
        </div>
        <input type="button" id="btnTJ" name="btnTJ" class="span5"  value="验证" />
        <div class="span7">
            <input name="change" type="submit" class="tn-button-text"  value="确认修改"  style="width:200px; height:70px;">
        </div>
    </div>
</form>
<div class="buttom"></div>

</body>
</html>

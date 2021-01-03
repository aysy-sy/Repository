<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册-商城</title>
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="../css/title.css">
    <link rel="stylesheet" type="text/css" href="../css/register-middle.css">
    <script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>

    <%--<script type="text/javascript">
        $(function () {

            $.post("/OrderManagementSystem/AjaxJacksonServlet",{"account":9},function (data) {

                alert("gtggg");
            },"json");
            alert("dfg");
        });
        // $("#email").blur(function () {
        //     alert("gggg");
        //     var account=$("#email");

        // });


    </script>--%>


        <script>
        var xhr;
        function checkItem() {
            xhr = new XMLHttpRequest();
            var itemName = document.getElementById("email").value;
            //使用POST发送请求
            xhr.open("POST", "/OrderManagementSystem/AjaxJacksonServlet?action=checkAccount&email=" + itemName);
            xhr.onreadystatechange = chceckItemOut;
            xhr.send();
        }
        //设置异步响应事件处理
        function chceckItemOut() {
            if (xhr.status == 200 && xhr.readyState == 4) {
                var res = xhr.responseText;
                console.log(res);
                if (res == "true") {
                    document.getElementById("message").innerHTML = "该账号已被注册";
                } else {
                    document.getElementById("message").innerHTML = "";
                }
            }
        }

    </script>

    <style>
        .tips{
            color:red;
        }
    </style>

    <script>

        function validate() {
            var email = document.getElementById("applicantAccount").value;
            var password = document.getElementById("password").value;

            //验证邮箱合法性
            var pattern = /^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/;
            if (email == '') {
                alert("email不能为空！");
                return false;
            } else if (!pattern.test(email)) {
                alert("email格式不正确！");
                return false;
            }
            //验证password
            if (password == '') {
                alert("password不能为空！");
                return false;
            } else if (password.length < 6 || password.length > 12) {
                alert("密码长度在6-12个字符之间");
                return false;
            }
            return true;
        }
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
<body class="bodyback">

<!--
<form action="/OrderManagementSystem/ApplicantRegisterServlet" method="get" onsubmit="return validate()">-->
<form action="/OrderManagementSystem/ApplicantRegisterServlet" method="get">
    <div class="header">
        <div class="headerback">

            <div class="home_page"><a href="product.jsp">首页</a></div>
            <div class="home_register"><a href="register.jsp">免费注册</a></div>
            <div class="home_login"><a href="login.jsp">登录</a></div>
        </div>
        <div class="header_buttom">注册——三和商城</div>
    </div>
    <div class="middle">
        <div class="span1">
            <label class="tn-form-label">账号：</label>
            <input id="email" class="tn-textbox" type="text" name="applicantAccount" value="" onblur="checkItem()" style="width:200px; height:30px;">
            <font id="message" style="color: red"></font>
        </div>
        <div class="span2">
            <label class="tn-form-label">密码：</label>
            <input id="password" class="tn-textbox" type="password" name="applicantPwd" value=""
                   style="width:200px; height:30px;">
        </div>
        <!--<div class="span3">
            <label class="tn-form-label">验证码：</label>
            <input id="VerificationCode" class="tn-textbox" type="VerificationCode" name="applicantCode"
                   style="width:200px; height:30px;">
        </div>-->
        <div class="choose">
            <label>管&nbsp;理&nbsp;员&nbsp;<input class="admin" type="radio" name="identity" value="管理员"
                                               style="width:25px; height:25px;"/></label>
            <label>用&nbsp;户&nbsp;<input class="user" type="radio" name="identity" value="用户"
                                        style="width:25px; height:25px;"/></label></div>
        <div class="span4">
            <input name="" type="submit" class="tn-button-text" value="立即注册" style="width:300px; height:70px;" onclick="validate()">
            <p class="it-register-text">
                <input name="" id="" class="tn-checkbox" value="true" checked="checked" type="checkbox">
                <label> 同意本站服务条款</label>
                <a href="../applicant/law.jsp">查看</a></p>
        </div>
    </div>
    <div class="buttom"></div>

</form>
</body>
</html>
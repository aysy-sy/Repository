<%@ page import="com.jsu.order.Dao.ThingDao" %>
<%@ page import="com.jsu.order.bean.ShopCar" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Mac
  Date: 2020/12/30
  Time: 0:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page isELIgnored="false"%>
<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>购物车页面</title>
    <script type="application/javascript">
        //减
        function minus(num){
            var prices=document.getElementsByName("price")[num].value;
            var count=parseInt(document.getElementsByName("amount")[num].value)-1;
            if(count<1){
                alert("不能再减了，再减就没有啦！");
            }
            else{
                document.getElementsByName("amount")[num].value=count;
                var totals=parseFloat(prices*count);
                document.getElementById("price"+num).innerHTML="¥" +totals.toFixed(2);//.toFixed(2)表示四舍五入，取2位小数点
                total();
            }
        }
        //增
        function plus(num){
            var prices=document.getElementsByName("price")[num].value;
            var count=parseInt(document.getElementsByName("amount")[num].value)+1;
            document.getElementsByName("amount")[num].value=count;
            var totals=parseFloat(prices*count);
            document.getElementById("price"+num).innerHTML="¥" +totals.toFixed(2);
            total();
        }
        //计算总额
        function total(){
            var prices=document.getElementsByName("price");
            var count=document.getElementsByName("amount");
            var sum=0;
            for(var i=0; i<prices.length;i++){
                sum+=prices[i].value*count[i].value;
            }
            document.getElementById("totalPrice").getElementsByTagName("span")[0].innerHTML="¥" +sum.toFixed(2);
          /*  var num=sum;
            document.getElementById("AllPrice").value = num; //赋值给数量的input框*/

        }
        //结算
        function accounts(){
            var obj=document.getElementById("cartList").nextElementSibling;//.nextElementSibling表示下一个同辈元素
            obj.style.display="block";
            var str="您本次提交订单成功：";
            str+="<br/>商品总计："+document.getElementById("totalPrice").innerHTML;
            obj.innerHTML=str;
        }
        //删除
        function del(num){
            var ocartList=document.getElementById("cartList");
            var delObj=document.getElementsByName("price")[num].parentNode.parentNode;
            ocartList.removeChild(delObj);
            total();
        }
    </script>
    <style type="text/css">
        .middle{
            margin-left: 40px;
        }
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
        .cartList{
           margin-left: 50px;
            border-spacing: 50px;

        }
        td{
            background-color: lightgray;
        }
    </style>
</head>
<body>
<%--读取cookie值后获取得到顾客的账号，根据账号查找顾客的购物车内容，显示--%>
<%
    ThingDao thingDao=new ThingDao();
    Cookie[] cookies = request.getCookies();
    String applicantAccount=null;
    if(cookies!=null) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("applicantAccount")) {
                applicantAccount = cookies[i].getValue();
            }
        }
    }
    List<ShopCar> goods1=thingDao.GetShopCar(applicantAccount);
    request.setAttribute("allthing",goods1);

%><%--
<form action="/OrderManagementServlet/BuyServlet" method="get">--%>
<div class="content">
    <div class="cartList" id="cartList">
        <table class="shopcartable">
            <tr>
                <td>商品图片</td>
                <td>商品名字</td>
                <td>商品类型</td>
                <td>单价</td>
                <td>数量</td>
                <td>总价</td>
                <td></td>
            </tr
            <c:set var="row_count" value="0"></c:set><%--row_count统计数量&ndash;--%>
            <c:forEach items="${allthing}" var="sg">
           <c:set var="row_count" value="${row_count+1}" /><%--&lt;%&ndash;进行运算，这个是自加1&ndash;%&gt;--%>
            <tr>
                <td><img src="../images/${sg.images}" width="80px" height="80px"></td>
                <td>${sg.proName}</td>
                <td>${sg.proType}</td>
                <td>¥<input type="text" name="price" value="${sg.proPrice}" style="width:50px; height:20px;" disabled></td>
                <td><input type="button" name="minus" value="-" onclick="minus(${row_count-1});">
                    <input type="text" name="amount" value="1">
                    <input type="button" name="plus" value="+" onclick="plus(${row_count-1});"></td>
                <td id="price${row_count-1}">¥${sg.proPrice}</td>

            </tr>
            </c:forEach>
        </table>
        <ol>
            <li id="totalPrice">商品总计：<span></span></li>
            <%--<li><span onclick="accounts();"><input type="submit" value="结   算"></span></li>--%>
        </ol>
    </div>
    <input type="hidden" name="AllPrice" id="AllPrice"
           readonly/>
    <input type="hidden" name="Allnum" id="Allnum" value="${row_count}"
           readonly/><%--购物车有几种产品--%>
    <div style="display:none;"></div><%--//输出总价--%>
</div><%--
</form>--%>
</body>


<%@ page import="com.jsu.order.bean.Product" %>
<%@ page import="com.jsu.order.Dao.ThingDao" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%><%--
  Created by IntelliJ IDEA.
  User: Mac
  Date: 2021/1/2
  Time: 23:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>销售量</title>
</head>
<style type="text/css">
    .middle li{
        float:left; list-style-type:none;
        height:190px; width:180px;
        display:block;
        border-right:1px solid #fff;
        border-bottom:1px solid #fff;
        padding:4px 0 2px;
    }
</style>
<body>
<%
    List<Product> products=new LinkedList<>();
    products = ThingDao.salemuch();//获取到售卖的销售量
    //根据销售量去查找 产品信息
        products=ThingDao.schProByOrdenum();
        request.setAttribute("productList", products);

%>
<div class="middle">
    <c:forEach items="${productList}" var="i">
        <li><table>
            <tr>
                <td><p class="pic">
                    <a href="../applicant/productDetail.jsp?id=${i.id }">
                        <img src="../images/${i.images}" width="100px" height="100px">
                    </a>
                </p></td>
            </tr>
            <tr><td><p class="wz">
                <strong><a href="../applicant/productDetail.jsp?id=${i.id }">${i.name }</a></strong>
            </p></td></tr>
            <tr><td><em>现价:<span>￥${i.getsalPrice()}</span></em></td></tr>
            <tr><td>销售量：${i.orderNum}</td></tr>
        </table></li>
    </c:forEach>
</div>
<%--
<table class="table" id="tbRecord" >
    <thead>
    <tr>

        <th>产品名称</th>
        <th>产品分类</th>
        <th>产品售价</th>
        <th>产品数量</th>
        <th>产品图片<th>
        <th>销售量</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${productList}" var="i" varStatus="vs">
        <tr class="text-c">

            <td>${i.name}</td>
            <td>${i.type}</td>
            <td>${i.salPrice}</td>
            <td>${i.num}</td>
            <td><img src="../images/${i.images}" alt="" width="50px" height="50px"></td>
            <td>${i.orderNum}</td>
        </tr>
    </c:forEach>
</tbody>
</table>--%>

</body>
</html>

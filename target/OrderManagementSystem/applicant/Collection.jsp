<%@ page import="com.jsu.order.Dao.ThingDao" %>
<%@ page import="com.jsu.order.bean.Collection" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Mac
  Date: 2021/1/1
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>收藏夹--顾客</title>
    <style type="text/css">
           .middle .table{
                border-spacing: 50px;
            }
         td{
            background-color: lightgray;
        }
    </style>
</head>
<body>
    <%--读取cookie值后获取得到顾客的账号，根据账号查找顾客的收藏夹，显示--%>
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
            List<Collection> goods1=thingDao.GetCollection(applicantAccount);
            request.setAttribute("allthing",goods1);

        %>

    <div class="header"></div>
    <div class="middle">
        <%--界面--%>
            <li>
            <table class="table">
                <tr>
                    <td>产品编号</td>
                    <td>产品图片</td>
                    <td>产品名字</td>
                    <td>产品类型</td>
                    <td>产品价格</td>
                </tr>
     <c:forEach items="${allthing}" var="sg">
                <tr><td>${sg.proId}</td>
                    <td><img src="../images/${sg.images}" alt="" width="100px" height="100px"> </td>
                    <td>${sg.proName}</td>
                    <td>${sg.proType}</td>
                    <td>${sg.proPrice}</td>
                </tr></c:forEach>
            </table></li>


    </div>
    <div class="buttom"></div>
</body>
</html>

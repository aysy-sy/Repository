
<%@ page import="com.jsu.order.bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jsu.order.Dao.ThingDao" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page isELIgnored="false" %>
<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%--
  Created by IntelliJ IDEA.
  User: Mac
  Date: 2021/1/1
  Time: 8:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品主界面</title>
    <style>
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

       /* .middle ul{
            width: 600px;
        }*/
        .middle li{
            float:left; list-style-type:none;
            height:190px; width:180px;
            display:block;
            border-right:1px solid #fff;
            border-bottom:1px solid #fff;
            padding:4px 0 2px;
        }

    </style>
</head>
<body>


    <div class="middle">
        <%
            ThingDao goodsDAO1=new ThingDao();
            //List<Product> goods1=goodsDAO1.getGoodsList()
            List<Product> goods1=goodsDAO1.schAllProduct();
            /*for(int i=0;i<goods1.size();i++){
               Product n=goods1.get(i);*/
            request.setAttribute("产品",goods1);
        %>
        <c:forEach items="${产品 }" var="sg">
            <li><table>
                <tr>
                    <td><p class="pic">
                        <a href="../applicant/productDetail.jsp?id=${sg.id }">
                            <img src="../images/${sg.images}" width="100px" height="100px">
                        </a>
                    </p></td>
                </tr>
                <tr><td><p class="wz">
                    <strong><a href="../applicant/productDetail.jsp?id=${sg.id }">${sg.name }</a></strong>
                </p></td></tr>
                <tr><td><em>现价:<span>￥${sg.getsalPrice()}</span></em></td></tr>
            </table></li>
        </c:forEach>

    </div>

</body>
</html>

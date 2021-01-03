<%@ page import="com.jsu.order.Dao.ProductDao" %>
<%@ page import="com.jsu.order.bean.Product" %>
<%@ page import="com.jsu.order.Dao.ThingDao" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: Mac
  Date: 2020/12/31
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>详细信息-三和商城</title>
    <link rel="stylesheet" href="../css/font-awesome.css" type="text/css">
    <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
    <script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="../js/jquery-3.4.1.min.js"></script>
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
        .details{
            font-size: 25px;
        }
        .sh_bnt2{
            height: 40px;
            width: 178px;
            background-color: #ffeded;
            border: 1px solid #FF0036;
            color: #FF0036;
        }
        .sh_bnt3{
            height: 40px;
            width: 178px;
            background-color: #ff0036;
            border: 1px solid #ff0036;
            color: #fff;
        }
        .fa-shopping-cart{
            color: #fff;
            position: absolute;
            margin-left: -60px;
            margin-top: 5px;
        }

    </style>

   <script type="text/javascript">

       function Addsum(a) {
    //获取输入框的值
           var num = document.getElementById("shoppingnum").value; //获取数量
           document.getElementById("shopNum").value = num; //赋值给数量的input框

       }
    </script>
</head>
<body>
<div class="header"></div>
<div class="middle"></div>
<div class="buttom"></div>
<form action=""></form>
    <div class="block clearfix">
        <div class="location ared">
            当前位置：<a href="../applicant/AllProduct.jsp">逛逛</a> ----产品详情
        </div>
        <div class="blank"></div>
        <div id="goodsInfo">
            <div class="imgInfo">
                <%
                    String x=request.getParameter("id");
                    int Id=Integer.parseInt(x);
                    ThingDao thingDao=new ThingDao();
                   /* ProductDao goodsDAO=new ProductDao();
                    Product product=goodsDAO.getSinglepro(Id);//产品所有信息*/
                    Product pros= thingDao.schAllProductById(Id);//产品信息
                    request.setAttribute("product",pros);
                %>
                <input type="hidden" name="id"
                       value="${product.id }"/>
               <%-- ${product.id}--%>
                <table class="details">
                    <tr>
                    <th rowspan="8"> <img src="../images/${product.images}"
                                          width="250px" height="250px" /></th>
                    <th>产品名字：</th>
                        <th>  ${product.name}&nbsp;&nbsp;${msg}</th>
                    </tr>
                    <tr>
                        <th>价格：</th>
                        <th> <strong class="jg">
                            ${product.salPrice}
                            元</strong>  </th>
                    </tr>
                    <tr><th>类型:</th>
                    <th> ${product.type }</th></tr>
                    <tr>
                        <th>库存：</th>
                        <th>${product.num }件</th></tr>
                    <tr><th>购买数量：</th><th><input type="text" name="shoppingnum" id="shoppingnum"
                                                 class="good_txt" onkeyup="Addsum(this)"  />
                       <%-- request.setAttribute("request", value);--%>
                    </th></tr>
                    <tr>
                        <th>
                            <form action="/OrderManagementSystem/collectionServlet" method="get">
                                <input type="hidden" name="id"
                                       value="${product.id }"/>
                                <input type="submit" name=""  class="sh_bnt2"  value="收   藏" />
                            </form>
                        </th>
                        <th>
                            <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                            <form action="/OrderManagementSystem/ShopCarServlet" method="get">
                                <input type="hidden" name="id"
                                       value="${product.id }"/>
                                <input type="hidden" name="shopNum" id="shopNum"
                                        readonly/>
                            <input type="submit" class="sh_bnt3"  value="加入购物车" />
                            </form>
                        </th>
                    </tr>
                </table>
                ${msg }
        </div>
        </div>
        <!--end-->
    </div>
</body>
</html>

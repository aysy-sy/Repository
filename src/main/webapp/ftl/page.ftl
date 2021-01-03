
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script src="../js/jquery-3.4.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <style type="text/css">

        .ph{
            margin-left: 100px;
        }
        a{
            text-decoration: none;
        }
        #top{
            width:100%;
            height:50px;
            background-color:floralwhite;

        }
        #top_tx{
            position:absolute;
            float:right;
            margin-top: 20px;
            margin-right: 30px;
        }
        #tb{

            margin-top: 20px;
            margin-left:5%;
            text-align: center;


        }
        #top_left{
            margin-left: 40%;
            float:left;
            margin-top: -10px;
        }
        th{
            width:150px;
            height: 45px;
        }

        .left-box{
            width:200px;
            height:30px;
            position: relative;
            margin: 0px;
            margin-left:10px;
            top:-15px;
            padding: 0px;
        }
        .right_box{
            width:400px;
            height:50px;

            position:relative;
            margin-left:650px;
            top:-35px;
            padding: 0px;

        }
        .foot_box{
            position: relative;
            width:100%;
            top:10px;
            left:-50px;
        }
    </style>
    <%

    %>
    <script type="text/javascript">
        function deletePro() {
            var checks = document.getElementsByClassName("check");
            for(var i=0 ;i<checks.length;i++){
                alert(checks[i].checked);
                if(checks[i].checked==true){
                    alert(checks[i]);
                    var parent =checks[i].parentElement.parentElement.parentElement;
                    var list =parent.children;
                    var pro=list[1];
                    var proNo=pro.textContent;
                    var url="/OrderManagementSystem/ProductDeleteServlet?proNo="+proNo;
                    document.getElementById("delete").setAttribute('href',url);
                }
            }
        }

        var totalRecords=15;
        var maxPageSize=3;
        /*     function first page(){

            } */
        var defaultCurrentPage=1;
        function  lastPage() {
            var last=document.getElementById("last");
            var currentPage=defaultCurrentPage-1;
            if(defaultCurrentPage>1){
                var url ="/OrderManagementSystem/ProductListServlet?currentPage="+currentPage;
                alert(url);
                last.setAttribute("href",url);
            }else{
                var url ="/OrderManagementSystem/ProductListServlet?currentPage="+defaultCurrentPage;
                alert(url);
                last.setAttribute("href",url);
            }
        }
        function nextPage(){
            var last=document.getElementById("next");
            var currentPage=defaultCurrentPage+1;
            var url ="/OrderManagementSystem/ProductListServlet?currentPage="+currentPage;
            alert(url);
            last.setAttribute("href",url);

        }


    </script>
</head>

<body>
<div id ="top" >
    <div id="top_left">
        <h2>产品信息如下:</h2>
    </div>
    <div id="top_tx">
        <form action="/OrderManagementSystem/productListServlet"  method="get">
            <!-- 用的是bootstrap插件 -->
            <div class="dropdown left-box" id="left-box">
                <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    用户名
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="product-Admin.jsp">返回</a></li>

                </ul>
            </div>
            <div class="right_box">
                <a style="color:green"  href="addNew.jsp">增加</a>
                <a id="delete" style="color:green" onclick="deletePro()" href="">删除</a>
                <input class="ph"  type="text" placeholder="搜索"  name="stuName">
                <input type="submit" value="搜索">
            </div>
        </form>
    </div>
</div>
<div class="foot_box">
    <table id="tb" border="1" cellspacing="0" cellpadding="0"  >
        <tr bgcolor="floralwhite">
            <th>选择</th>
            <th>产品名字</th>
            <th>产品类型</th>
            <th>产品价格</th>
            <th>产品库存</th>
            <th>当前状态</th>

        </tr>
        <!-- <#list students as stu> -->
        <tr  bgcolor="floralwhite">
            <td><label><input class="check"  type="checkbox"   name="check"></label></td>
            <td>${pro.proNo}</td>
            <td>${pro.name}</td>
            <td>${pro.type}</td>
            <td>${pro.price}</td>
            <td>${pro.num}</td>
            <td>${pro.state}</td>

        </tr>
        <tr   bgcolor="floralwhite">
            <td><label><input class="check"   type="checkbox"   name="check1"></label></td>
            <td>${pro.proNo}</td>
            <td>${pro.name}</td>
            <td>${pro.type}</td>
            <td>${pro.price}</td>
            <td>${pro.num}</td>
            <td>${pro.state}</td>
        </tr>

        <tr bgcolor="#73AFF1" >
            <td align="center" colspan="12">
                <a href="" onclick="firstPage()" id="first">[首页]</a>
                <a href="" onclick="lastPage()"  id="last">[上一页]</a>
                <a href="" onclick="nextPage()"  id="next">[下一页]</a>
                <a href=""  onclick="endPage()"   id="end">[尾页]</a>
            </td>
        </tr>

        <!-- </#list> -->
    </table>
</div>
</body>
</html>

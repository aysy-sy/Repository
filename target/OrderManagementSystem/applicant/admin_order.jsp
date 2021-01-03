<%@ page import="com.jsu.order.Dao.ThingDao" %>
<%@ page import="com.jsu.order.bean.Sales" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员-订单管理-订单记录</title>
<link rel="stylesheet" />
<link rel="stylesheet" href="../css/Site.css" />
<link rel="stylesheet" href="../css/zy.all.css" />
<link rel="stylesheet" href="../css/font-awesome.min.css" />
<link rel="stylesheet" href="../css/amazeui.min.css" />
<link rel="stylesheet" href="../css/admin.css" />
	<script src="../js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="../js/plugs/Jqueryplugs.js" type="text/javascript"></script>
	<script src="../js/_layout.js"></script>
	<script src="../js/plugs/jquery.SuperSlide.source.js"></script>

	<script>
		function delSale(itemId){
			if(confirm("确定要删除吗？")){
				window.location.href="/OrderManagementSystem/ProServlet?action=delSale&id="+itemId;
			}
		}
		function initEditSale(itemId){
			if(confirm("确定要编辑吗？")){
				window.location.href="/OrderManagementSystem/ProServlet?action=initEditSale&id="+itemId;
			}
		}
	</script>
</head>
<body>
<%
	int pageSize=5;
	String curp=request.getParameter("currPage");
	int currentPage=0;
	if(curp==null){
		currentPage=1;
	}else{
		currentPage=Integer.parseInt(curp);
	}
	ThingDao thingDao=new ThingDao();
	List<Sales> sales=thingDao.getSalesListByPage(currentPage,pageSize);
	int totalPage=0;
	List<Sales> us=thingDao.schProSalesRecord();
	totalPage=us.size()%pageSize==0?us.size()/pageSize:us.size()/pageSize+1;
	//6、上一页beforePage
	Integer beforePage=currentPage-1<=0?1:currentPage-1;
	//7、上一页afterPage
	Integer afterPage=currentPage+1>=totalPage?totalPage:currentPage+1;
	request.setAttribute("count",us.size());
	request.setAttribute("totalPage",totalPage);
	request.setAttribute("userList",sales);
	request.setAttribute("currPage",currentPage);
	request.setAttribute("beforePage",beforePage);
	request.setAttribute("afterPage",afterPage);
%>
	<div class="dvcontent">
		<div>
			<!--tab start-->
			<div class="tabs">
				<div class="hd">
					<ul>
						<li class="on"
							style="box-sizing: initial; -webkit-box-sizing: initial;">订单记录</li>
					</ul>
				</div>
				<div class="bd">
					<ul style="display: block; padding: 20px;">
						<li>
							<!--分页显示角色信息 start-->
							<div id="dv1">
								<table class="table" id="tbRecord">
									<thead>
										<tr>
										    <th>订单序号</th>
											<th>编号</th>
											<th>产品名称</th>
											<th>产品数量</th>
											<th>订单时间</th>
											<th>编辑</th>
											<th>删除</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach items="${userList}" var="o" varStatus="vs">
										<%--<c:forEach items="${outList}" var="o" varStatus="vs">--%>
											<tr class="text-c">
												<td> ${vs.count + (currPage-1)*pageSize} </td>
												<td> ${o.sid} </td>
												<td> ${o.sname} </td>
												<td> ${o.squantity } </td>
												<td> ${o.sdate} </td>
												<td class="edit">
													<button href="javascript:;" onclick="initEditSale('${o.sid}')">
													<i class="icon-edit bigger-120"></i>编辑
												</button></td>
												<td class="delete"><button  href="javascript:;" onclick="delSale('${o.sid}')">
													<i class="icon-trash bigger-120"></i>删除
												</button></td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr class="text-c">
											<td colspan="6">总页数： ${totalPage} 页
												&nbsp;&nbsp;&nbsp;&nbsp; 当前第 ${currPage} 页
												<a
														href="admin_order.jsp?currPage=${beforePage }">上一页</a>
												&nbsp;&nbsp;&nbsp;&nbsp; <a
														href="admin_order.jsp?currPage=${afterPage }">下一页</a>
												&nbsp;&nbsp;&nbsp;&nbsp;<%-- <a
												href="/OrderManagementSystem/ProServlet?action=schProSalesRecord&currPage=${currPage-1 }">上一页</a>
												&nbsp;&nbsp;&nbsp;&nbsp; <a
												href="/OrderManagementSystem/ProServlet?action=schProSalesRecord&currPage=${currPage-1 }">下一页</a>--%>
											</td>
										</tr>
									</tfoot>
								</table>
							</div> <!--分页显示角色信息 end-->
						</li>
					</ul>
					
				</div>
			</div>
			<!--tab end-->
		</div>


	</div>
</body>

</html>
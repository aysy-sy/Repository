<%@ page import="com.jsu.order.bean.Product" %>
<%@ page import="com.jsu.order.Dao.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jsu.order.bean.Sales" %>
<%@ page import="com.jsu.order.Dao.ThingDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员-产品管理-查看产品</title>
<link rel="stylesheet" />
<link rel="stylesheet" href="../css/Site.css" />
<link rel="stylesheet" href="../css/zy.all.css" />
<link rel="stylesheet" href="../css/font-awesome.min.css" />
<link rel="stylesheet" href="../css/amazeui.min.css" />
<link rel="stylesheet" href="../css/admin.css" />

<script>
function delPro(itemId){
	if(confirm("确定要删除吗？")){
		window.location.href="/OrderManagementSystem/ProServlet?action=delPro&id="+itemId;
	}
}
function initEditPro(itemId){
	if(confirm("确定要编辑吗？")){
	window.location.href="/OrderManagementSystem/ProServlet?action=initEditPro&id="+itemId;
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
	List<Product> sales=thingDao.getProListByPage(currentPage,pageSize);
	int totalPage=0;
	List<Product> us=thingDao.schAllProduct();
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


	<div class="dvcontent" >
		<div>
			<!--tab start-->
			<div class="tabs">
				<div class="hd">
					<ul>
						<li class="on"
							style="box-sizing: initial; -webkit-box-sizing: initial;">查看产品</li>
						<li class=""
							style="box-sizing: initial; -webkit-box-sizing: initial;">
							<a href="addNew.jsp">添加产品</a>
							</li>
						<%--<li class=""
							style="box-sizing: initial; -webkit-box-sizing: initial;">
							<a href="editPro.jsp">修改产品</a>
						</li>--%>
					</ul>
				</div>
				<div class="bd">
					<ul style="display: block; padding: 20px;">
						<li>
							<!--分页显示角色信息 start-->
							<div id="dv1">
								<table class="table" id="tbRecord" >
									<thead>
										<tr>
											<th>产品编号</th>
											<th>产品名称</th>
											<th>产品分类</th>
											<th>产品进价</th>
											<th>产品售价</th>
											<th>产品数量</th>
											<th>编辑</th>
											<th>删除</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${userList}" var="i" varStatus="vs">
											<tr class="text-c">
												<td>${i.id}</td>
												<td>${i.name}</td>
												<td>${i.type}</td>
												<td>${i.getpurPrice()}</td>
												<td>${i.getsalPrice()}</td>
												<td>${i.num}</td>
												<td class="edit"><button href="javascript:;" onclick="initEditPro('${i.id}')">
													<i class="icon-edit bigger-120"></i>编辑
												</button></td>
											<td class="delete"><button  href="javascript:;" onclick="delPro('${i.id}')">
													<i class="icon-trash bigger-120"></i>删除
												</button></td>
											</tr>
										</c:forEach>

									</tbody>
									<tfoot>
										<tr class="text-c">
											<td colspan="6">总页数： ${totalPage} 页
												&nbsp;&nbsp;&nbsp;&nbsp; 当前第 ${currPage} 页
												&nbsp;&nbsp;&nbsp;&nbsp; <a
												href="product.jsp?currPage=${beforePage}">上一页</a>
												&nbsp;&nbsp;&nbsp;&nbsp; <a
												href="product.jsp?currPage=${totalPage}">下一页</a>
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

















		<script src="../js/jquery-1.7.2.min.js" type="text/javascript"></script>
		<script src="../js/plugs/Jqueryplugs.js" type="text/javascript"></script>
		<script src="../js/_layout.js"></script>
		<script src="../js/plugs/jquery.SuperSlide.source.js"></script>
		<script>
			var num = 1;
			$(function() {
				$(".tabs").slide({
					trigger : "click"
				});
			});
			var btn_save = function() {
				var pid = $("#RawMaterialsTypePageId  option:selected").val();
				var name = $("#RawMaterialsTypeName").val();
				var desc = $("#RawMaterialsTypeDescription").val();
				var ramark = $("#Ramark").val();
				$.ajax({
					type : "post",
					url : "/RawMaterialsType/AddRawMaterialsType",
					data : {
						name : name,
						pid : pid,
						desc : desc,
						ramark : ramark
					},
					success : function(data) {
						if (data > 0) {
							$.jq_Alert({
								message : "添加成功",
								btnOktext : "确认",
								dialogModal : true,
								btnOkClick : function() {
									//$("#RawMaterialsTypeName").val("");
									//$("#RawMaterialsTypeDescription").val("");
									//$("#Ramark").val("");                           
									//page1();
									location.reload();
								}
							});
						}
					}
				});
				alert(t);
			}
			var btn_edit = function(id) {
				$.jq_Panel({
					url :"/RawMaterialsType/EditRawMaterialsType?id=" + id,
					title : "编辑分类",
					dialogModal : true,
					iframeWidth : 500,
					iframeHeight : 400
				});
			}
			var btn_delete = function(id) {
				$.jq_Confirm({
					message : "您确定要删除吗?",
					btnOkClick : function() {
					}
				});
			}
		</script>

	</div>
</body>

</html>
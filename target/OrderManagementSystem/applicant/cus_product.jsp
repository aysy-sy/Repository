<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--HTML 4.0.1 过渡型 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品信息---三和商城</title>
<link rel="stylesheet" />
<link rel="stylesheet" href="../css/Site.css" />
<link rel="stylesheet" href="../css/zy.all.css" />
<link rel="stylesheet" href="../css/font-awesome.min.css" />
<link rel="stylesheet" href="../css/amazeui.min.css" />
<link rel="stylesheet" href="../css/admin.css" />
	<script>

		function addSale(itemName,ordernum){

			if(confirm("确定要下单吗？")) {
				window.location.href = "ProServlet?action=addProSalesRecord&itemName=" + itemName+"&orderNum="+ordernum;
			}}
	</script>
</head>
<body>
	<div class="dvcontent" >
		<div>
			<!--tab start-->
			<div class="tabs">
				<div class="hd">
					<ul>
						<li class="on"
							style="box-sizing: initial; -webkit-box-sizing: initial;">产品列表</li>
					</ul>
				</div>
				<%--<form action="/OrderManagementSystem/ProServlet?action=addProSalesRecord" method="get">--%>
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
											<th>产品售价</th>
											<th>产品库存</th>
											<th>操作<th><input type="hidden" id="squantity" required value="1" name="squantity" >
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${prolist}" var="i" varStatus="vs">
											<tr class="text-c">	
												<td>${i.id}</td>
												<td>${i.name}</td>
												<td>${i.type}</td>
												<td>${i.salPrice}</td>
												<td>${i.num}</td>
												<td>
													<button href="javascript:;" onclick="addSale('${i.name}',1)">
														<i class="icon-edit bigger-120"></i>下单
													</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
									<tfoot>
										<tr class="text-c">
<%--											<td colspan="6">总页数： ${totalPage} 页--%>
											<td colspan="6">总页数： ${totalPage+1} 页
												&nbsp;&nbsp;&nbsp;&nbsp; 当前第 ${currPage} 页
												&nbsp;&nbsp;&nbsp;&nbsp; <a
												href="/OrderManagementSystem/ProServlet?action=schProduct1&currPage=${currPage-1 }">上一页</a>
												&nbsp;&nbsp;&nbsp;&nbsp; <a
												href="/OrderManagementSystem/ProServlet?action=schProduct1&currPage=${currPage+1 }">下一页</a>
											</td>
										</tr>
									</tfoot>
								</table>

							</div> <!--分页显示角色信息 end-->

						</li>
					</ul>
				</div>
				<%--</form>--%>
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
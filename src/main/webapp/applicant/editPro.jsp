<%@ page import="com.jsu.order.bean.Product" %>
<%@ page import="com.jsu.order.Dao.ProductDao" %>
<%@ page import="com.jsu.order.Dao.ThingDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员-修改产品信息</title>
<link rel="stylesheet" />
<link rel="stylesheet" href="../css/Site.css" />
<link rel="stylesheet" href="../css/zy.all.css" />
<link rel="stylesheet" href="../css/font-awesome.min.css" />
<link rel="stylesheet" href="../css/amazeui.min.css" />
<link rel="stylesheet" href="../css/admin.css" />
</head>
<body>
	<div class="dvcontent">
		<div>
			<!--tab start-->
			<div class="tabs">
				<div class="hd">
					<ul>
						<li class=""
							style="box-sizing: initial; -webkit-box-sizing: initial;">修改产品</li>
					</ul>
				</div>
				<%
					String id="";
					Cookie[] cookies=request.getCookies();
					int ProId=0;
					if(cookies!=null && cookies.length!=0){
						for(int i=0;i<cookies.length;i++){
							Cookie cookie = cookies[i];
							if(cookie.getName().equals("ProId")){
								id = cookie.getValue();
								ProId=Integer.parseInt(id);
							}
						}
					}
					Product product=new Product();
					ThingDao thingDao=new ThingDao();
					product =thingDao.getProById(ProId);
				%>

				<div class="bd">
					<ul class="theme-popbod dform" style="display: none;">
						<div class="am-cf admin-main" style="padding-top: 0px;">
							<!-- content start -->
							<div class="am-cf admin-main" style="padding-top: 0px;">
								<!-- content start -->
								<div class="admin-content">
									<div class="admin-content-body">
										<div class="am-g">
											<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8"></div>
											<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4"
												style="padding-top: 30px;">
												<form class="am-form am-form-horizontal"
													action="/OrderManagementSystem/ProServlet?action=editPro" method="post">
													<input type="hidden" name="action" value="editPro">

													<input type="hidden" name="id" value="<%=product.getId()%>">
													<div class="am-form-group">
														<label for="name" class="am-u-sm-3 am-form-label">
															产品名称</label>
														<div class="am-u-sm-9">
															<input type="text" id="name" required name="itemName"
																value="<%=product.getName()%>">
														</div>
													</div>
													<div class="am-form-group">
														<%--@declare id="user-email"--%><label for="user-email" class="am-u-sm-3 am-form-label">
															分类</label>
														<div class="am-u-sm-9">
															<select name="itemType" required
																value="<%=product.getType()%>">
																<option value="">请选择分类</option>
																<option value="自热火锅">自热火锅</option>
																<option value="生鲜">生鲜</option>
																<option value="蔬菜">蔬菜</option>
																<option value="膨化食品">膨化食品</option>
																<option value="家纺">家纺</option>
															</select>
															
														</div>
													</div>
													<div class="am-form-group">
														<label for="user-email" class="am-u-sm-3 am-form-label">
															进价</label>
														<div class="am-u-sm-9">
															<input type="text" id="pPrice" required value="<%=product.getpurPrice()%>"
																name="pPrice">
														</div>
													</div>
													<div class="am-form-group">
														<label for="user-email" class="am-u-sm-3 am-form-label">
															售价</label>
														<div class="am-u-sm-9">
															<input type="text" id="sPrice" required value="<%=product.getsalPrice()%>"
																name="sPrice">
														</div>
													</div>
													<div class="am-form-group">
														<label for="user-email" class="am-u-sm-3 am-form-label">
															库存</label>
														<div class="am-u-sm-9">
															<input type="text" id="number" required value="<%=product.getNum()%>"
																name="number">
														</div>
													</div>
													<%--<div class="am-form-group">
														<label for="user-email" class="am-u-sm-3 am-form-label">
															上传图片</label>
														<div class="am-u-sm-9">
															<input type="text" id="image" required value=""
																   name="number">
														</div>
													</div>--%>

													<!-- 
						<div class="am-form-group">
								<label for="user-intro" class="am-u-sm-3 am-form-label">
									备注</label>
								<div class="am-u-sm-9">
									<textarea class="" rows="5" id="user-intro" name="remark"
										placeholder="输入备注"></textarea>
									<small>250字以内...</small>
								</div>
							</div>
							 -->
													<div class="am-form-group">
														<div class="am-u-sm-9 am-u-sm-push-3">
															<input type="submit" class="am-btn am-btn-success"
																value="保存" />
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
								<!-- content end -->
							</div>
							<!--添加 end-->
						</div>
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
		</script>
	</div>
</body>
</html>
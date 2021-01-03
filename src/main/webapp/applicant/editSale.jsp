<%@ page import="com.jsu.order.bean.Product" %>
<%@ page import="com.jsu.order.Dao.ProductDao" %>
<%@ page import="com.jsu.order.Dao.ThingDao" %>
<%@ page import="com.jsu.order.bean.Sales" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>管理员-修改订单信息</title>
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
                        style="box-sizing: initial; -webkit-box-sizing: initial;">修改订单</li>
                </ul>
            </div>
            <%
                String id="";
                Cookie[] cookies=request.getCookies();
                int SaleId=0;
                if(cookies!=null && cookies.length!=0){
                    for(int i=0;i<cookies.length;i++){
                        Cookie cookie = cookies[i];
                        if(cookie.getName().equals("SaleId")){
                            id = cookie.getValue();
                            SaleId=Integer.parseInt(id);
                        }
                    }
                }
                Sales sales=new Sales();
                ThingDao thingDao=new ThingDao();
                sales=thingDao.getSaleById(SaleId);
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
                                                  action="/OrderManagementSystem/ProServlet?action=editSale" method="post">
                                                <input type="hidden" name="action" value="editSale">
                                                <input type="hidden" name="id" value="<%=sales.getSid()%>">
                                                <div class="am-form-group">
                                                    <label for="name" class="am-u-sm-3 am-form-label">
                                                        产品名称</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="name" required name="itemName"
                                                               value="<%=sales.getSname()%>">
                                                    </div>
                                                </div>

                                                <div class="am-form-group">
                                                    <label for="user-email" class="am-u-sm-3 am-form-label">
                                                    销售量</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="squantity" required value="<%=sales.getSquantity()%>"
                                                               name="squantity">
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="user-email" class="am-u-sm-3 am-form-label">
                                                        订单号</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="sid" required value="<%=sales.getSid()%>"
                                                               name="sid">
                                                    </div>
                                                </div>


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
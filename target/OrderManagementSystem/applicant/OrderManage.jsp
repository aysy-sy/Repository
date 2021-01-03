<%--
  Created by IntelliJ IDEA.
  User: Mac
  Date: 2020/12/30
  Time: 0:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" />
<link rel="stylesheet" href="../css/Site.css" />
<link rel="stylesheet" href="../css/zy.all.css" />
<link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css"/>
<link rel="stylesheet" href="../css/font-awesome.css" type="text/css"/>
<link rel="stylesheet" href="../css/amazeui.min.css" />
<link rel="stylesheet" href="../css/admin.css" />
<html>
<head>
    <title>订单管理中心-三和商城</title>
</head>
<body>
<div class="dvcontent">

    <div>
        <!--tab start-->
        <div class="tabs" style="margin: 30px;">
            <div class="hd">
                <ul>

                    <li class=""
                        style="box-sizing: initial; -webkit-box-sizing: initial;">购买产品</li>
                </ul>
            </div>
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
                                                  action="FlowerServlet" method="post">
                                                <input type="hidden" name="action"
                                                       value="addFlowerSalesRecord">
                                                <div class="am-form-group">
                                                    <label for="user-email" class="am-u-sm-3 am-form-label">
                                                        产品名称</label>
                                                    <div class="am-u-sm-9">
                                                        <select name="itemName" required>
                                                            <c:forEach items="${flowerList}" var="i">
                                                                <option <c:if test="${i}" >selected=selected</c:if>value="${i}">${i}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="am-form-group">
                                                    <label for="name" class="am-u-sm-3 am-form-label">
                                                        数量</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="name" required placeholder="数量"
                                                               name="otbnumber">
                                                    </div>
                                                </div>

                                                <div class="am-form-group">
                                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                                        <input type="submit" class="am-btn am-btn-success"
                                                               value="提交" />
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                </div>
                                <!-- content end -->
                            </div>
                            <!--添加 end-->
                            <!--end-->
                        </div>
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

        var btn_edit = function(id) {
            $.jq_Panel({
                url : "/RawMaterialsType/EditRawMaterialsType?id=" + id,
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
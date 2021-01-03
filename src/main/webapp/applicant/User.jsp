<%--
  Created by IntelliJ IDEA.
  User: Mac
  Date: 2020/12/30
  Time: 0:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户信息管理-三和商城</title>
    <link rel="stylesheet" href="../css/title.css">
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
    </style>
    <script>
        function delType(typeId){
            if(confirm("确定要删除吗？")){
                window.location.href="TypeServlet?action=delType&tid="+typeId;
            }
        }
        function initEditType(typeId){
            window.location.href="TypeServlet?action=initEditType&tid="+typeId;

        }
    </script>
</head>
<body>
<div class="header">
    <div class="headerback">
        <div class="home_page"><a href="product-Admin.jsp">首页</a></div>

        <p>三和商城</p>

    </div>
</div>
<div class="dvcontent">
    <div>
        <!--tab start-->
        <div class="tabs">
            <div class="hd">
                <ul style="">
                    <li style="box-sizing: initial; -webkit-box-sizing: initial;"
                        class="on">查看客户</li>
                    <li class=""
                        style="box-sizing: initial; -webkit-box-sizing: initial;">添加客户</li>
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
                                    <th>序号</th>
                                    <th>分类编号</th>
                                    <th>客户名称</th>
                                    <th>客户电话</th>
                                    <th>客户地址</th>
                                    <th>编辑</th>
                                    <th>删除</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach items="${userList}" var="t" varStatus="vs">
                                    <tr class="text-c">
                                        <td>${vs.count + (currPage-1)*pageSize}</td>
                                        <td>${t.tid}</td>
                                        <td>${t.tname}</td>
                                        <td>${t.description}</td>
                                        <td>${t.remarks}</td>
                                        <td class="edit"><button href="javascript:;"
                                                                 onclick="initEditType('${t.tid}')">
                                            <i class="icon-edit bigger-120"></i>编辑
                                        </button></td>
                                        <td class="delete"><button href="javascript:;"
                                                                   onclick="delType('${t.tid}')">
                                            <i class="icon-trash bigger-120"></i>删除
                                        </button></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr class="text-c">
                                    <td colspan="6">总页数：${totalPage}页
                                        &nbsp;&nbsp;&nbsp;&nbsp; 当前第${currPage}页
                                        &nbsp;&nbsp;&nbsp;&nbsp; <a
                                                href="TypeServlet?action=schType&currPage=${beforePage }">上一页</a>
                                        &nbsp;&nbsp;&nbsp;&nbsp; <a
                                                href="TypeServlet?action=schType&currPage=${afterPage }">下一页</a>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                        </div> <!--分页显示角色信息 end-->
                    </li>
                </ul>
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
                                                  action="TypeServlet" method="post">
                                                <input type="hidden" name="action" value="addType">

                                                <div class="am-form-group">
                                                    <label for="user-name" class="am-u-sm-3 am-form-label">
                                                        分类名称</label>
                                                    <div class="am-u-sm-9">
                                                        <input type="text" id="user-name" required
                                                               placeholder="分类名称" name="tname"> <small>10字以内...</small>
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="user-description"
                                                           class="am-u-sm-3 am-form-label"> 分类描述</label>
                                                    <div class="am-u-sm-9">
															<textarea class="" rows="5" id="user-intro"
                                                                      name="tdescription" placeholder="输入商品描述"></textarea>
                                                        <small>250字以内...</small>
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <label for="user-intro" class="am-u-sm-3 am-form-label">
                                                        备注</label>
                                                    <div class="am-u-sm-9">
															<textarea class="" rows="5" id="user-intro"
                                                                      name="tremark" placeholder="输入备注"></textarea>
                                                        <small>250字以内...</small>
                                                    </div>
                                                </div>
                                                <div class="am-form-group">
                                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                                        <input type="submit" class="am-btn am-btn-success"
                                                               value="添加分类" />
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- content end -->
                        </div>
                        <!-- end-->
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
                    $.ajax({
                        type : "post",
                        url : "/RawMaterialsType/DeleteRawMaterialsType",
                        data : {
                            id : id
                        },
                        success : function(data) {
                            if (data > 0) {
                                $.jq_Alert({
                                    message : "删除成功",
                                    btnOkClick : function() {
                                        page1();
                                    }
                                });
                            }
                        }
                    });
                }
            });
        }
    </script>
</div>
</body>
</html>
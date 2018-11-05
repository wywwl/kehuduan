<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap3/css/bootstrap.css">
    <link rel="stylesheet" href="../bootstrap/bootstrap3/css/bootstrap-theme.css">
    <link rel="stylesheet" href="../bootstrap/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="../bootstrap/bootstrap-treeview/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="../bootstrap/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css">
    <link rel="stylesheet" href="../bootstrap/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">

    <script src="../bootstrap/bootstrap3/jquery.min.js"></script>
    <script src="../bootstrap/bootstrap3/js/bootstrap.min.js"></script>
    <script src="../bootstrap/bootstrap-table/bootstrap-table.js"></script>
    <script type="text/javascript" src="../bootstrap/ztree/js/jquery.ztree.core.min.js"></script>
    <script type="text/javascript" src="../bootstrap/ztree/js/jquery.ztree.exedit.js"></script>
    <script type="text/javascript" src="../bootstrap/ztree/js/jquery.ztree.excheck.min.js"></script>
    <script src="../bootstrap/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
    <script src="../bootstrap/bootstrap-treeview/bootstrap-treeview.min.js"></script>
    <script src="../bootstrap/bootstrap-bootbox/bootbox.js"></script>
    <script src="../bootstrap/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script src="../bootstrap/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="table" id="RoleTable"></div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">

    $(function(){
        $('#RoleTable').bootstrapTable({
            url:'<%=request.getContextPath()%>/admin/getRole',
            // pagination:true, //是否展示分页
            // pageList:[5, 10, 20, 50],//分页组件
            // pageNumber:1,
            // pageSize:3,//默认每页条数
            //search:true,//是否显示搜索框
            //searchText:'试试',//初始化搜索文字
            showColumns:false,//是否显示 内容列下拉框
            showToggle:false,//是否显示 切换试图（table/card）按钮
            showPaginationSwitch:false,//是否显示 数据条数选择框
            showRefresh:false,//是否显示刷新按钮
            detailView:false,//设置为 true 可以显示详细页面模式。
            showFooter:false,//是否显示列脚
            clickToSelect: true, //是否启用点击选中行
            sidePagination:'server',//分页方式：client客户端分页，server服务端分页（*
            striped:true,
            columns:[
                {field:'rid',title:'ID',width:100},
                {field:'rname',title:'名称',width:100},
                {field:'cz',title:'操作',width:100,
                    formatter:function(value,row,index){
                        return '<a onclick="ProjectileDialog(\''+row.rid+'\')">绑定权限</a>';
                    }
                }
            ]
        });
    })

    function ProjectileDialog(rid) {
        var url = "<%=request.getContextPath()%>/admin/toRtree?rid="+rid;
        bootbox.dialog({
            title: '绑定权限',
            message:createAddConten(url),
            closeButton: true,
            buttons: {
                "success": {
                    "label": "<i class='icon-ok'></i> 保存",
                    "className": "btn-sm btn-success",
                    "callback": function () {
                        var rolesId = $('#rolesId').val();
                       /* var rtreeId = $('#myrTree').treeview('getChecked');
                        var ids = "";
                        for (var i = 0; i < rtreeId.length; i++) {
                            ids += ids == "" ? rtreeId[i].tid : ","+rtreeId[i].tid;
                        };*/
                        //获取zetree选中的节点
                        var treeObj=$.fn.zTree.getZTreeObj("powerTree"),
                            nodes = treeObj.getCheckedNodes(true);
                        //console.info(nodes);
                        var ids="";
                        for(var i=0;i<nodes.length;i++){
                            ids += ids == "" ? nodes[i].tid : "," + nodes[i].tid;
                        }
                        $.ajax({
                            url:'<%=request.getContextPath()%>/admin/addRtree',
                            type:'post',
                            data:{
                                rolesId:rolesId,
                                ids:ids
                            },
                            dataType:'json',
                            success:function(data){
                                $('#RoleTable').bootstrapTable('refresh');
                            }
                        });
                    }
                },
                "cancel": {
                    "label": "<i class='icon-info'></i> 取消",
                    "className": "btn-sm btn-danger",
                    "callback": function () {

                    }
                }
            }

        });
    }


    /*
    * 弹框
    * */
    var res;
    function createAddConten(url){
        $.ajax({
            url:url,
            async:false,
            success:function(data){
                res = data;
            }
        });
        return res;
    }


</script>
</html>

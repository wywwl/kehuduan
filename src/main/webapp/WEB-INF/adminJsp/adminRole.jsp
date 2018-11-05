<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap3/css/bootstrap.css">
    <link rel="stylesheet" href="../bootstrap/bootstrap3/css/bootstrap-theme.css">
    <link rel="stylesheet" href="../bootstrap/bootstrap-table/bootstrap-table.css">
    <link rel="stylesheet" href="../bootstrap/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css">

    <script src="../bootstrap/bootstrap3/jquery.min.js"></script>
    <script src="../bootstrap/bootstrap3/js/bootstrap.min.js"></script>
    <script src="../bootstrap/bootstrap-table/bootstrap-table.js"></script>
    <script src="../bootstrap/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
    <script src="../bootstrap/bootstrap-bootbox/bootbox.js"></script>
    <script src="../bootstrap/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
    <script src="../bootstrap/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
</head>
<body>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div id="toolbar">
                    <a class="btn btn-primary glyphicon glyphicon-plus" href="javascript:poenAddDialog();" role="button">新增</a>
                    <a class="btn btn-danger glyphicon glyphicon-trash" href="javascript:poenDelDialog();" role="button">批量删除</a>
                </div>
                <div class="table" id="myTable"></div>
            </div>
        </div>
    </div>







</body>
<script type="text/javascript">
    $(function(){
        initTable();
    })

    function initTable(){
        $('#myTable').bootstrapTable({
            toolbar:'#toolbar',
            url:'<%=request.getContextPath()%>/admin/getAdminAll',
            pagination:true, //是否展示分页
            pageList:[3, 6, 9, 20],//分页组件
            pageNumber:1,
            pageSize:3,//默认每页条数
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
            queryParams:function(){
                return {
                    page: this.pageNumber,
                    rows: this.pageSize,
                };
            },
            columns:[
                {checkbox:true},
                {field:'name',title:'名称',width:100},
                {field:'login',title:'账号',width:100},
                {field:'sex',title:'性别',width:50,formatter:function(value){
                        return value == 1 ? '男':'女';
                    }},
                {field:'age',title:'年龄',width:50},
                {field:'emial',title:'简介',width:260},
                {field:'times',title:'入职时间',width:100},
                {field:'roles',title:'拥有角色',width:260},
                {field:'cz',title:'操作',width:100,
                    formatter:function(value,row,index){
                        return '<a onclick="poenEditDialog(\''+row.aid+'\')">绑定角色</a>';
                    }
                }
            ]
        });
    }

    //新增
    function poenAddDialog() {
        var url = "<%=request.getContextPath()%>/admin/toaddAdmin";
        bootbox.dialog({
            title: '添加管理员',
            message:createAddContent(url),
            closeButton: true,
            buttons: {
                "success": {
                    "label": "<i class='icon-ok'></i> 保存",
                    "className": "btn-sm btn-success",
                    "callback": function () {
                        $.ajax({
                            url:'<%=request.getContextPath()%>/admin/addAdminForm',
                            type:'post',
                            data:{
                                name:$('#name').val(),
                                login:$('#login').val(),
                                upwd:$('#upwd').val(),
                                age:$('#age').val(),
                                times:$('#times').val(),
                                sex:$('input[name="sex"]').filter(':checked').val(),
                                emial:$('#emial').val(),
                            },
                            dataType:'json',
                            success:function(data){
                                $('#myTable').bootstrapTable('refresh');
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


    function poenDelDialog(){
        var adminId = $('#myTable').bootstrapTable('getSelections');
        var ids = "";
        for (var i = 0; i < adminId.length; i++) {
            ids += ids == "" ? adminId[i].aid : ","+adminId[i].aid;
        };
        $.ajax({
            url:'<%=request.getContextPath()%>/admin/deleteAdmin',
            type:'post',
            data:{
                ids:ids
            },
            dataType:'json',
            success:function(data){
                $('#myTable').bootstrapTable('refresh');
            }
        });
    }




    function poenEditDialog(aid) {
        var url = "<%=request.getContextPath()%>/admin/toaddAdminRole?aid="+aid;
        bootbox.dialog({
            title: '绑定角色',
            message:createAddContent(url),
            closeButton: true,
            buttons: {
                "success": {
                    "label": "<i class='icon-ok'></i> 保存",
                    "className": "btn-sm btn-success",
                    "callback": function () {
                        var adminId = $('#adminId').val();
                        var rows = $("#myRoleTable").bootstrapTable("getSelections");
                        var ids = "";
                        for (var i = 0; i < rows.length; i++) {
                            ids += ids == "" ? rows[i].rid : ","+rows[i].rid;
                        };
                        $.ajax({
                            url:'<%=request.getContextPath()%>/admin/addAdminRole',
                            type:'post',
                            data:{
                                adminId:adminId,
                                ids:ids
                            },
                            dataType:'json',
                            success:function(data){
                                $('#myTable').bootstrapTable('refresh');
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
    function createAddContent(url){
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

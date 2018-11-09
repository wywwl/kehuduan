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
                <div class="table" id="myLogTable"></div>
            </div>
        </div>
    </div>


</body>
<script type="text/javascript">

    $(function(){
        $('#myLogTable').bootstrapTable({
            toolbar:'#toolbar',
            url:'<%=request.getContextPath()%>/admin/getLog',
            pagination:true, //是否展示分页
            pageList:[10, 20, 30, 50],//分页组件
            pageNumber:1,
            pageSize:10,//默认每页条数
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
                {field:'id',title:'ID',width:100},
                {field:'className',title:'方法名',width:100},
                {field:'userId',title:'用户ID',width:50},
                {field:'createTime',title:'时间',width:50},
                {field:'ip',title:'操作人的ip',width:260},
                {field:'param',title:'入参地址',width:100},
            ]
        });
    })

</script>
</html>

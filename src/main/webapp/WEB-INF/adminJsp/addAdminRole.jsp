<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
</head>
<body>
    <input id="adminId" type="hidden" value="${aid}"/>
    <div class="table" id="myRoleTable"></div>

</body>
<script type="text/javascript">


    $(function(){
        var adminId = $('#adminId').val();
        $.ajax({
            url:'<%=request.getContextPath()%>/admin/getRoleId',
            type:'post',
            data:{
                adminId:adminId
            },
            dataType:'json',
            success:function(result){
               // console.info(result)
                var ids = "";
                for (var i = 0; i < result.length; i++) {
                    ids += ids == "" ? result[i].roleId : ","+result[i].roleId;
                }
                RoleDg(ids);
            }
        })
    })

    function RoleDg(ids){
        $('#myRoleTable').bootstrapTable({
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
            onLoadSuccess:function(data){
                //console.info(ids)
                if(ids != null || ids != undefined){
                    var roleIds = ids.split(",");
                    var rows = $("#myRoleTable").bootstrapTable("getData");
                    for(var i=0;i<rows.length;i++){
                        var rowId = rows[i].rid;
                        for(var j=0;j<roleIds.length;j++){
                            if(rowId == roleIds[j]){
                                $("#myRoleTable").bootstrapTable("check",i);
                            }
                        }
                    }
                }
            },
            columns:[
                {checkbox:true},
                {field:'rid',title:'ID',width:100},
                {field:'rname',title:'名称',width:100},
            ]
        });
    }





</script>
</html>

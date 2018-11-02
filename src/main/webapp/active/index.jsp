<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../bootstrop/bootstrap3/css/bootstrap.css">
	<link rel="stylesheet" href="../bootstrop/bootstrap3/css/bootstrap-theme.css">
	<link rel="stylesheet" href="../bootstrop/bootstrap-table/bootstrap-table.css">
	<link rel="stylesheet" href="../bootstrop/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css">

	<script src="../bootstrop/bootstrap3/jquery.min.js"></script>
	<script src="../bootstrop/bootstrap3/js/bootstrap.min.js"></script>
	<script src="../bootstrop/bootstrap-table/bootstrap-table.js"></script>
	<script src="../bootstrop/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
	<script src="../bootstrop/bootstrap-bootbox/bootbox.js"></script>
	<script src="../bootstrop/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
	<script src="../bootstrop/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
</head>
<body>
<div class="col-md-12">
	<div id="toolbar">
		<a class="btn btn-primary glyphicon glyphicon-plus" href="javascript:poenAddDialog();" role="button">新增</a>
		<a class="btn btn-info glyphicon glyphicon-pencil" href="javascript:poenEditDialog();" role="button">修改</a>
		<a class="btn btn-danger glyphicon glyphicon-trash" href="javascript:pirem();" role="button">批量删除</a>
	</div>
	<div class="table" id="cativeTable"></div>
</div>


</body>
<script type="text/javascript">
    $(function(){
        activeTable();
    })

    function activeTable(){
        $('#cativeTable').bootstrapTable({
            toolbar:'#toolbar',
            url:'/active/toqueryactive',
            pagination:true, //是否展示分页
            pageList:[5, 10, 20, 50],//分页组件
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
                    rows: this.pageSize
                };
            },
            columns:[
                {checkbox:true},
                {field:'hid',title:'活动ID',align:'center',width:150},
                {field:'name',title:'发表人',width:150},
                {field:'file',title:'广告图片',width:150},
                {field:'enterprise',title:'广告企业',width:150,},
                {field:'enterprisephone',title:'企业电话',width:150},
                {field:'enterpriseemail',title:'企业邮箱',width:150},
                {field:'starttime',title:'开始时间',width:150},
                {field:'endtime',title:'结束时间',width:150},
            ]
        });
    }
    <!--批量删除-->
    function pirem(){
        var selects = $('#cativeTable').bootstrapTable('getSelections'); //获取表选择的行
        var ids = "";
        for (var i = 0; i < selects.length; i++) {
            ids += ids == "" ? selects[i].hid :","+selects[i].hid;
        }
        $.ajax({
            url:'/active/remAactiveById',
            type:'post',
            data:{
                ids:ids
            },
            dataType:'json',
            success:function(){
                alere("成功")
                $('#cativeTable').bootstrapTable('refresh');
                location=location
            }

        })
    }



    function poenAddDialog(){
        var url = "/active/addactive";
        bootbox.dialog({
            title:'添加',
            message: createAddContent(url),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='icon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url:'<%=request.getContextPath()%>/student/addStu',
                            type:'post',
                            data:$("#myForm").serialize(),
                            dataType:'json',
                            success:function(data){
                                $('#cativeTable').bootstrapTable('refresh');
                            }
                        });
                    }
                },
                "cancel" : {
                    "label" : "<i class='icon-info'></i> 取消",
                    "className" : "btn-sm btn-danger",
                    "callback" : function() {
                    }
                }
            }

        });
    }

    function poenEditDialog(){
        var updateId  = $('#myTable').bootstrapTable('getSelections');
        var id = "";
        for (var i = 0; i < updateId.length; i++) {
            id += updateId[i].id;
        }
        var url = "<%=request.getContextPath()%>/student/toupdate";
        bootbox.dialog({
            title:'修改',
            message: createAddContent(url),
            closeButton: true,
            buttons : {
                "success" : {
                    "label" : "<i class='icon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        $.ajax({
                            url:'<%=request.getContextPath()%>/student/updateStu',
                            type:'post',
                            data:$("#myForm").serialize(),
                            dataType:'json',
                            success:function(data){
                                $('#myTable').bootstrapTable('refresh');
                            }
                        });
                    }
                },
                "cancel" : {
                    "label" : "<i class='icon-info'></i> 取消",
                    "className" : "btn-sm btn-danger",
                    "callback" : function() {

                    }
                }
            }

        });

        $.ajax({
            url:'<%=request.getContextPath()%>/student/getStuById',
            type:'post',
            data:{
                id:id
            },
            dataType:'json',
            success:function(result){
                //alert(result.deptId);
                $('#id').val(result.id);


                $('#text').val(result.text);
                $('#img').val(result.img);
                $('#enterprise').val(result.enterprise);
                $('#enterprisephone').val(result.enterprisephone);
                $('#enterpriseemail').val(result.enterpriseemail);
                $('#starttime').val(result.starttime);
                $('#endtime').val(result.endtime);
            }
        })

    }

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
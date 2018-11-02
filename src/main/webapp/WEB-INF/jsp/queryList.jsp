<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>

  <!-- 引入bootstrap的css -->
  <link  href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
  <!-- 引入bootstrap-treeview的css -->
  <link  href="<%=request.getContextPath()%>/js/treeview/bootstrap-treeview.min.css" rel="stylesheet" >
  <!-- 引入bootstrap-addTabs的css -->
  <link  href="<%=request.getContextPath()%>/js/addTabs/addTabs.css" rel="stylesheet" >
  <!-- 引入bootstrap-table的css -->
  <link  href="<%=request.getContextPath()%>/js/table/bootstrap-table.min.css" rel="stylesheet" >
  <!-- 引入fileinput的css -->
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/js/fileinput/css/fileinput.min.css" />




  <!-- 引入jquery -->
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
  <!-- 引入my97 -->
  <script type="text/javascript" src="<%=request.getContextPath() %>/js/my97/WdatePicker.js"></script>
  <!-- 引入bootstrap的js-->
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>
  <!-- 引入bootstrap的js-->
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/treeview/bootstrap-treeview.min.js"></script>
  <!-- 引入bootstrap的js-->
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/addTabs/addTabs.js"></script>
  <!-- 引入bootstrap-table的js-->
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/table/bootstrap-table.min.js"></script>
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/table/locale/bootstrap-table-zh-CN.min.js"></script>
  <!-- 引入bootbox.js -->
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/bootbox/bootbox.js"></script>
  <!-- 引入fileinput的js -->
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/fileinput/js/fileinput.min.js"></script>
  <!--  引入fileinput的js -->
  <script type="text/javascript" src="<%=request.getContextPath()%>/js/fileinput/js/locales/zh.js"></script>

  <script type="text/javascript" src="<%=request.getContextPath()%>/js/fileinput/themes/fa/theme.js"></script>


</head>
<body>
  <div class="col-md-12">
      <div id="toolbar">
        <a class="btn btn-primary glyphicon glyphicon-plus" href="javascript:poenAddDialog();" role="button">新增</a>
        <a class="btn btn-info glyphicon glyphicon-pencil" href="javascript:poenEditDialog();" role="button">修改</a>
        <a class="btn btn-danger glyphicon glyphicon-trash" href="javascript:pirem();" role="button">批量删除</a>
      </div>
      <div class="table" id="myTable"></div>
    </div>


</body>
<script type="text/javascript">
    $(function(){
        initTable();
    })

    function initTable(){
        $('#myTable').bootstrapTable({
            toolbar:'#toolbar',
            url:'<%=request.getContextPath()%>/student/queryList',
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
                {field:'id',title:'广告ID',align:'center',width:150},
                {field:'text',title:'广告内容',width:150},
                {field:'img',title:'广告图片',width:100,
                    formatter:function (value,row,index) {
                        return '<img src="'+row.img+'" width="80" height="80" >';
                    }
                },
                {field:'enterprise',title:'广告企业',width:150,},
                {field:'enterprisephone',title:'企业电话',width:150},
                {field:'enterpriseemail',title:'企业邮箱',width:150},
                {field:'starttime',title:'开始时间',width:150},
                {field:'endtime',title:'结束时间',width:150},
                /*{field:'cz',title:'操作',width:50,
                    formatter:function(value,row,index){
                        return '<a class="glyphicon glyphicon-remove" onclick="rem(\''+row.id+'\')"></a>';
                    }
                }*/
            ]
        });
    }
    <!--批量删除-->
    function pirem(){
        var selects = $('#myTable').bootstrapTable('getSelections'); //获取表选择的行
        var ids = "";
        for (var i = 0; i < selects.length; i++) {
            ids += ids == "" ? selects[i].id :","+selects[i].id;
        }
        $.ajax({
            url:'<%=request.getContextPath()%>/student/remUserById',
            type:'post',
            data:{
                ids:ids
            },
            dataType:'json',
            success:function(result){
                $('#myTable').bootstrapTable('refresh');
            }

        })
    }


    function poenAddDialog(){
        var url = "<%=request.getContextPath()%>/student/toAdd";
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
                $('#id').val(result.id);
                $('#text').val(result.text);
                $('#img').val(result.img);
                $('#enterprise').val(result.enterprice);
                $('#enterprisephone').val(result.enterprisephone);
                $('#enterpriseemail').val(result.enterpriseemail);
                $('#starttime').val(result.startTime);
                $('#endtime').val(result.endTime);
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
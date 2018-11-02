<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/1
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<link rel="stylesheet" href="../boot/bootstrap3/css/bootstrap.min.css">

<link rel="stylesheet" href="../boot/layui/css/layui.css">
<link rel="stylesheet" href="../layui/css/modules/layer/default/layer.css">
<link rel="stylesheet" href="../boot/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css">
<link rel="stylesheet" href="../boot/bootstrap3/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../boot/bootstrap3/css/bootstrap-table.css">
<link rel="stylesheet" href="../boot/bootstrap3/css/easyui.css">
<link rel="stylesheet" href="../boot/bootstrap3/css/toastr.css">
<script src="../boot/bootstrap3/js/jquery-3.2.0.min.js"></script>
<script src="../boot/bootstrap3/js/layui.all.js"></script>
<script src="../boot/bootstrap-table/bootstrap-table.js"></script>
<script src="../boot/bootstrap3/js/bootstrap.js"></script>
<script src="../boot/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script src="../boot/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="../boot/bootstrap-bootbox/bootbox.js"></script>
<script src="../boot/bootstrap3/messenger.js"></script>
<script src="../boot/bootstrap3/js/bootstrap.min.js"></script>
<script src="../boot/bootstrap3/js/jquery.easyui.min.js"></script>
<script src="../boot/bootstrap3/js/toastr.min.js"></script>

<div class="panel panel-default">
    <div class="panel-heading">高级搜索</div>
    <div class="panel-body">
        <form class="form-inline">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="exampleInputName2">评论内容</label>
                        <input type="text" class="form-control" id="rolename" placeholder="请输入">
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="form-group">
                        <label for="exampleInputEmail2">日期区间</label>
                        <input type="text" class="form-control date" name="goods.createTime" id="beginDate">
                        <input type="text" class="form-control date" name="goods.createTime" id="endDate">
                    </div>
   <button type="button" class="btn btn-default" onclick="sss()">搜索</button>
                </div>

            </div>
        </form>
    </div>
</div>

<div class="container-fluid">
    <button type="button" class="btn btn-primary" onclick="excel()">导出数据</button>
    <button type="button" class="btn btn-danger" onclick="dels()">批量删除</button>
    <button type="button" class="btn btn-info" onclick="open_edit_dia()">修改</button>
    <button type="button" class="btn btn-success" data-toggle="modal"   onclick="open_add_dia()" id="btn_add">给博客发送指定评论</button>

</div>


<div class="container-fluid">
    <div class="col-md-12">
        <div class="table" id="myTable"></div>
    </div>
</div>
<script>

    toastr.options.positionClass = 'toast-bottom-center';

    function dels(){

        var a = $('#myTable').bootstrapTable('getSelections');//获取选择行数据

        if(a.length>0){
            if(confirm("你是否要删除?")){
                var temp = "";
                for(var i = 0;i<a.length;i++){
                    temp += ","+a[i].id;
                }
                var ids = temp.substr(1);

                $.ajax({
                    url:'../comment/dels?ids='+ids,
                    success:function(){
                        $('#myTable').bootstrapTable("refresh",{});
                    }
                })

            }

        }else{
            alert("请选择有效数据!")
        }


    }

    function sss(){
        $('#myTable').bootstrapTable("refresh",{query:{}});
    }



    $('.date').datetimepicker({
        language: 'zh-CN',//显示中文
        format: 'yyyy-mm-dd hh:ii:ss',//显示格式
        minView: "month",//设置只显示到月份
        autoclose: true,//选中自动关闭
        todayBtn: true//显示今日按钮
    });


    $('#myTable').bootstrapTable({
        toolbar:'#toolbar',
        url:'../comment/queryAdminComment',//获取数据地址
        pagination:true, //是否展示分页
        sidePagination:'server',
        pageNum: 1,                       //每页的记录行数（*）
        pageSize: 3,
        pageList: [3, 6, 9,12],        //可供选择的每页的行数（*）
        //search:true,//是否显示搜索框
        //searchText:'试试',//初始化搜索文字


        showColumns: true,   //是否显示 内容列下拉框
        showToggle:false,//是否显示 切换试图（table/card）按钮
        showPaginationSwitch:false,//是否显示 数据条数选择框
        showRefresh:false,//是否显示刷新按钮
        detailView:false,//设置为 true 可以显示详细页面模式。
        showFooter:false,//是否显示列脚
        clickToSelect: true, //是否启用点击选中行
        sidePagination:'server',//分页方式：client客户端分页，server服务端分页（*
        sortName:'pCommentId',
        sortOrder:'desc',
        striped:true,
        //启动回车键做搜索功能
        searchOnEnterKey:true,
        queryParams:function(){
            var beginDate = $('#beginDate').val();
            var endDate = $('#endDate').val();
            var content = $("#rolename").val();

            return {
                page: this.pageNumber,
                rows: this.pageSize,
                beginDate:beginDate,
                endDate:endDate,
                content:content,
            };
        },
        columns:[
            {checkbox:true},
            {field:'id',title:'ID',align:'center',width:150},
            {field:'pCommentId',title:'评论类型',align:'center',width:150},

            {field:'content',title:'评论内容',align:'center',width:150,
                formatter:function (value, row, index, field) {
                    return '<div contenteditable="true">' + (value || "-") + '</div>';
                }

            },

            {field:'addtime',title:'创建日期',width:150

            },
            {field:'email',title:'发言者',width:150},
            {field:'likenumber',title:'喜欢次数',width:150},
            {field:'abc',title:'操作',formatter:function(v,r,i){
                    return '<i class="glyphicon glyphicon-ban-circle" onclick="del(\''+r.id+'\')"删除</i>'

                }},

            {field:'abcs',title:'操作',align:'center',
                formatter:function(value,row,index){

                    return '  <i class="btn btn-info"  data-dismiss="alert"  aria-hidden="true" onclick="updatepwd(\''+row.id+'\')">修改密码</i>  '

                }
            },
        ]
    });

    $('body').on('focus', '[contenteditable]', function() {
        var $this = $(this);
        $this.data('before', $this.html());
        return $this;
    }).on('blur keyup paste input', '[contenteditable]', function() {
        var $this = $(this);
        if ($this.data('before') !== $this.html()) {
            $this.data('before', $this.html());
            $this.trigger('change');
        }
        return $this;
    });
    function bind_edit_score_blur(field) {
        var $table = $("#myTable");
        //bootstrap table对象,包含了所有表格的内容,data中存储了加载过来的当前页数据
        var data = $table.data("bootstrap.table").data;
        var col = $table.find("thead tr th[data-field=" + field + "]").index();
        //因为每次加载table都会删除所以事件不会重复绑定
        $table.find("tbody tr").find('td:eq('+col+') div').on('change',function () {
            var value = $(this).text();
            var row = $(this).parents('tr').data('index');
            console.log(value);
            //修改表格对象的数据
            data[row][field]=value;
            $table.bootstrapTable('check', row);
        });
    }
   /* onPostBody: function () {
        //绑定评分修改事件,因为不知道table什么时候初始化完毕
        var check_table_finished=setInterval(function () {
            var bootstrapTable = $("#myTable").data("bootstrap.table");
            if(bootstrapTable) {
                clearInterval(check_table_finished);
                //绑定评分修改后的事件
                bind_edit_score_blur('score');
            }
        },500);
    }*/
    function updateScore() {
        var row = $('#myTable').bootstrapTable('getSelections');
        if(row.length == 0) {
            toastr.success("请先选中一条评论内容");
            return;
        }
        $.each(row,function (i, item) {
            var workid = item.workid;
            var score = item.score;
            $.ajax({
                url:'../comment/updateScore',
                type:"post",
                dataType:"json",
                data:{
                    workid:workid,
                    score:score
                },
                success:function(res){
                    if(res.status == 0) {
                        toastr.success(res.msg);
                    }else{
                        toastr.error(res.msg);
                    }
                    query();
                }
            });
        });


    }





    function del(id){
        if(confirm("你确定要删除这条数据吗?")){
            $.ajax({
                url:'../comment/del.do?id='+id,
                success:function(){
                    $('#myTable').bootstrapTable("refresh",{});
                }
            })
        }
    }


    /* 右下角提示脚本
    $._messengerDefaults = {
           extraClasses: 'messenger-fixed messenger-theme-future messenger-on-bottom messenger-on-right'
             }
    $("#btn_add").click(function () {
                $.globalMessenger().post({
                  message: "操作成功",//提示信息
                       type: 'info',//消息类型。error、info、success
                       hideAfter: 2,//多长时间消失
                       showCloseButton:true,//是否显示关闭按钮
                        hideOnNavigate: true //是否隐藏导航
                 });
          }); */

    function open_add_dia(){

        bootbox.dialog({
            title:'添加内容',
            message: createAddContent("../comment/toaddContent"),
            closeButton: true,
            buttons : {
                "保存" : {
                    "label" : "<i class='icon-ok'></i> 保存",
                    "className" : "btn-sm btn-success",
                    "callback" : function() {
                        data_sync();
                        var s=$("#addForm").serialize();
                        alert(s)
                        $.ajax({
                            url:'../comment/addContent',
                            type:'post',
                            data:s,
                            dataType:'json',
                            success:function(data){
                                toastr.warning ('发送评论成功!');
                                $('#myTable').bootstrapTable('refresh');

                            }
                        });
                    }
                },
                "取消" : {
                    "label" : "<i class='icon-info'></i> 取消",
                    "className" : "btn-sm btn-danger",
                    "callback" : function() {

                    }
                }
            }

        });



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
    //修改

    function open_edit_dia(){
        var a = $('#myTable').bootstrapTable('getSelections');
        var id = a[0].id;
        if(a.length>1){
            bootbox.confirm({
                size: "small",
                message: "选多了",
                callback: function(){ }
            })
        }else if(a.length==0){
            bootbox.confirm({
                size: "small",
                message: "必须选",
                callback: function(){ }
            })
        }else{
            bootbox.dialog({
                title:'修改角色',
                message: createAddContent("<%=request.getContextPath()%>/toedit.do"),
                closeButton: true,
                buttons : {
                    "保存" : {
                        "label" : "<i class='icon-ok'></i> 保存",
                        "className" : "btn-sm btn-success",
                        "callback" : function() {
                            $.ajax({
                                url:'<%=request.getContextPath()%>/tree/editFormRole.do',
                                type:'post',
                                data:$("#editForm").serialize(),
                                success:function(data){

                                    $('#myTable').bootstrapTable('refresh');

                                }
                            });
                        }
                    },
                    "取消" : {
                        "label" : "<i class='icon-info'></i> 取消",
                        "className" : "btn-sm btn-danger",
                        "callback" : function() {

                        }
                    }
                }
            });
            $.ajax({
                url:"<%=request.getContextPath()%>/tree/selecteditid.do?id="+id,
                success:function(result){
                    $("#rolenameId").val(result.name);
                    $("#createtimeId").val(result.createtime);
                    $("#eroleId").val(result.id);



                }
            })
        }
    }

    function updatepwd(){
        var a = $('#myTable').bootstrapTable('getSelections');
        var id = a[0].id;
        if(a.length>1){
            bootbox.confirm({
                size: "small",
                message: "选多了",
                callback: function(){ }
            })
        }else if(a.length==0){
            bootbox.confirm({
                size: "small",
                message: "必须选",
                callback: function(){ }
            })
        }else{
            bootbox.dialog({
                title:'修改角色',
                message: createAddContent("<%=request.getContextPath()%>/toupdatepwd.do"),
                closeButton: true,

                buttons : {
                    "保存" : {
                        "label" : "<i class='icon-ok'></i> 保存",
                        "className" : "btn-sm btn-success",
                        "callback" : function() {
                            $.ajax({
                                url:'<%=request.getContextPath()%>/tree/editFormRole.do',
                                type:'post',
                                data:$("#editpwd").serialize(),
                                success:function(data){

                                    $('#myTable').bootstrapTable('refresh');

                                }
                            });
                        }
                    },
                    "取消" : {
                        "label" : "<i class='icon-info'></i> 取消",
                        "className" : "btn-sm btn-danger",
                        "callback" : function() {

                        }
                    }
                }
            });
            $.ajax({
                url:"<%=request.getContextPath()%>/tree/selecteditid.do?id="+id,
                success:function(result){
                    $("#rolenameId").val(result.name);
                    $("#createtimeId").val(result.createtime);
                    $("#eroleId").val(result.id);



                }
            })
        }
    }



</script>




</body>
</html>

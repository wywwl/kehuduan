
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <%@ include file="../common/mystyle.jsp"%>
</head>
<body>
<!--  条件查询的 form  表单  -->
<!-- 表单 -->
<form id="pro_from" class="form-inline">
    <div class="form-group">
        <label for="bookName">代码标题</label> <input type="text" class="form-control" id="bookName" placeholder="代码标题">
    </div>
    <br>

    <br>
    <button type="button" class="btn btn-success" onclick="search()">搜索</button>
    <button type="button" class="btn btn-primary" onclick="reset()">重置</button>
</form>

<button type="button" class="btn btn-error" onclick="addMongo()">新增</button>
<table id="book_table"></table>


    <div id="video" style="width:400px;height:200px;">


    </div>


<script type="text/javascript">


    //展示数据列表
    $(function (){
        $("#book_table").bootstrapTable({
            url:"../CodeController/queryCode",
            method:"post",
            striped: true,  	// 斑马线效果     默认false
            //只允许选中一行
            singleSelect:true,
            //选中行是不选中复选框或者单选按钮
            clickToSelect:true,
            showToggle:true,   //是否显示详细视图和列表视图的切换按钮
            cardView: false,      //是否显示详细视图
            uniqueId: "bookId",  //每一行的唯一标识，一般为主键列
            showColumns: true,      //是否显示所有的列
            showRefresh: true,       //是否显示刷新按钮
            minimumCountColumns: 2,     //  最少留两列
            detailView: false,                  //是否显示父子表
            //发送到服务器的数据编码类型
            contentType:'application/x-www-form-urlencoded;charset=UTF-8',   //数据编码纯文本  offset=0&limit=5

            columns:[
                {field:'code_id',title:'ID'},
                {field:'userFile',title:'用户头像',width:100,},
                {field:'userName',title:'用户名称',width:100,},
                {field:'code_title',title:'代码标题',widht:50},
                {field:'code_content',title:'代码内容',widht:50},
                {field:'code_nb',title:'牛币',width:100,},
                {field:'code_Release_date',title:'发表时间',width:100,},
                {field:'keyword_name',title:'关键词',width:100,},
                {field:'code_Download',title:'下载数',width:100,},
                {field:'code_Browse',title:'浏览数',width:100,},
                {field:'comment',title:'评论数',width:100,},
                {field:'tName',title:'类型名称',width:100,},
                {field:'grade',title:'等级',width:100,},
                {field:'caozuo',title:'操作',widht:50,
                    formatter:function(value,row,index){

                        if (row.start==0 ){
                            var arr ="<input type='button' onclick='updateall(\""+row.code_id+"\")' class='btn btn-primary'  value='审核通过'>";
                            arr +="<input type='button' onclick='theshelves(\""+row.code_id+"\")' class='btn btn-primary'  value='审核失败'>";
                            return arr;
                        }
                        if (row.start==1 ){
                            var arr ="<input type='button' onclick='deleteCode(\""+row.code_id+"\")' class='btn btn-primary'  value='删除'>";
                            arr +="<input type='button' onclick='theshelves(\""+row.code_id+"\")' class='btn btn-primary'  value='审核已通过' disabled>";
                            return arr;
                        }


                    }
                }
            ],
            //传递参数（*）
            queryParams:function(params){
                var bb={
                    /*
                        分页  自定义的参数         默认传 limit（展示几条）    offset（从第几条开始    起始条数）
                    */
                    "pageSize":params.limit,
                    "start":params.offset,
                }
                return bb;
            },

            searchOnEnterKey:true,
            //分页方式   后台请求的分页方式
            sidePagination:'server',
            pagination: true,                   //是否显示分页（*）
            pageNum: 1,                       //每页的记录行数（*）
            pageSize: 2,                       //每页的记录行数（*）
            pageList: [2, 6, 9,12],        //可供选择的每页的行数（*）
        });

    })


    //删除方法
    function deleteCode(code_id){
        alert(code_id)
        $.ajax({
            url:"../CodeController/deleteCode",
            type:"post",
            data:{"code_id":code_id},
            success:function(){
                bootbox.alert("删除成功");
                $("#book_table").bootstrapTable('refresh');

            }
        })
    }



    //修改状态为审核通过
    function updateall(code_id){
        alert(code_id)
        $.ajax({
            url:"../CodeController/updateall",
            type:"post",
            data:{"code_id":code_id},
            success:function(){

                $("#book_table").bootstrapTable('refresh');

            }
        })
    }


    //修改状态为审核未通过
    function theshelves(code_id){
        alert(code_id)
        $.ajax({
            url:"../CodeController/theshelves",
            type:"post",
            data:{"code_id":code_id},
            success:function(){

                $("#book_table").bootstrapTable('refresh');

            }
        })
    }
    //条件查询
    function search(){
        $("#book_table").bootstrapTable('refresh',
            {query: {

                    "bookName":$("#bookName").val(),
                    "minTimel":$("#minTime").val(),
                    "maxTimel":$("#maxTime").val(),
                }}
        );
    }



</script>
</body>
</html>

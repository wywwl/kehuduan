
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
        <label for="bookName">博客标题</label> <input type="text" class="form-control" id="bookName" placeholder="代码标题">
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
            url:"../CodeController/queryBlog",
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
                {field:'blog_id',title:'编号'},
                {field:'blog_title',title:'博客标题',widht:50},
                {field:'blog_content',title:'博客内容',widht:50},
                {field:'blog_Publication_time',title:'发表时间',width:100,},
                {field:'userName',title:'发表人名称',width:100,},
                {field:'userFile',title:'发表人头像',width:100,
                    formatter:function(v, row, i) {
                        return "<img src='<%=request.getContextPath() %>/js/img/"+row.userFile+"' height='80px'; width='120'>"
                    }
                },
                {field:'blog_Browse_number',title:'浏览次数',width:100,
                    formatter: function(value, row) {
                        return '浏览'+  row.blog_Browse_number
                    }
                },
                {field:'blog_comments',title:'评论条数',width:100,
                    formatter: function(value, row) {
                        return '评论'+  row.blog_comments
                    }
                },
                {field:'grade',title:'用户等级',width:100,},
                {field:'caozuo',title:'操作',widht:50,
                    formatter:function(value,row,index){
                        var arr ="<input type='button' onclick='deleteCode(\""+row.blog_id+"\")' class='btn btn-primary'  value='删除'>";
                        arr +="<input type='button' onclick='updateCode(\""+row.blog_id+"\")' class='btn btn-primary'  value='修改'>";
                        return arr;
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
    function deleteCode(blog_id){
        alert(blog_id)
        $.ajax({
            url:"../CodeController/deleteBlog",
            type:"post",
            data:{"blog_id":blog_id},
            success:function(){
                bootbox.alert("删除成功");
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

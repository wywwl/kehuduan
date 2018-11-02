<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/2
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="addForm" method="post">

   博客id:  类型：<input id="list_typeid" name="bid" />

    评论内容:<textarea id="add_Content" name="content"></textarea><br>


</form>

<script type="text/javascript">

    $('#list_typeid').combobox({
        url:'../comment/getBlogData',
        valueField:'blog_id',
        textField:'blog_title'
    });


    //初始化layui相关组件
    layui.use(['form', 'upload', 'layedit', 'laydate'], function(){
        var form = layui.form;
        var upload = layui.upload;
        var edit = layui.layedit;
        var laydate = layui.laydate;

        //初始化编辑器
        usereditor = edit.build("add_Content");

        data_sync = function() {
            edit.sync(usereditor);
        }


    });

</script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ShoeMain</title>
    <link rel="stylesheet" href="../bootstrap/bootstrap3/css/bootstrap.css">
    <link rel="stylesheet" href="../bootstrap/bootstrap3/css/bootstrap-theme.css">
    <link rel="stylesheet" href="../bootstrap/bootstrap-treeview/bootstrap-treeview.min.css">
    <link rel="stylesheet" href="../bootstrap/bootStrap-addTabs/bootstrap.addtabs.css">

    <script src="../bootstrap/bootstrap3/jquery.min.js"></script>
    <script src="../bootstrap/bootstrap3/js/bootstrap.min.js"></script>
    <script src="../bootstrap/bootstrap-treeview/bootstrap-treeview.min.js"></script>
    <script src="../bootstrap/bootStrap-addTabs/bootstrap.addtabs.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-inverse navbar-static-top" style="text-align: center">
        <div class="container-fluid" style="display: inline-block;float: none;">
            <div class="navbar-havbar">
                <a class="navbar-brand" >后台管理系统</a>
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                <div id="myTree"></div>
            </div>
            <div class="col-md-10">
                <div id="myTabs">
                    <!-- 新选项卡 -->
                    <ul class="nav nav-tabs" id="tablist">
                        <li role="presentation" class="active">
                            <a href="#home" role="tab" data-toggle="tab">欢迎</a>
                        </li>
                    </ul>

                    <!-- 选项卡下内容 -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">

    $(function(){
        initTree();
    })


    function initTree(){
        $.ajax({
            url:'<%=request.getContextPath()%>/admin/getTree',
            type:'post',
            data:{},
            dataType:'json',
            success:function(result){
                $('#myTree').treeview({
                    data:result,
                    levels: 1,//设置继承树默认展开的级别设置继承树默认展开的级别
                    onNodeSelected:function(e, node){
                       // alert($('#myTabs').tab('exists',node.text))
                        //console.info($('#myTabs').tab())
                        $.addtabs({iframeHeight: 650});
                        $.addtabs.add({
                            id:node.id,
                            title:node.text,
                            url:node.href
                        });
                    }
                })
            }

        })
    }
</script>
</html>

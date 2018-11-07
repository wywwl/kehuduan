<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>

	<%--<%@ include file="/common/mystyle.jsp" %>--%>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootbox/bootbox.js"></script>
	<link  href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<form class="form-horizontal" role="form">
	<div class="form-group">
		<label for="uname" class="col-sm-2 control-label">代码标题</label>
		<div class="col-sm-9">
			<input type="text" id="uname" name="uname" class="form-control well" placeholder="请输入用户名"/>
		</div>
	</div>

    <div class="form-group">
        <label for="inputfile">文件输入</label>
        <input type="file" id="inputfifle">
        <p class="help-block">这是块级帮助文本的实例</p>
    </div>

	<div class="form-group">
		<label for="upwd" class="col-sm-2 control-label">密码</label>
		<div class="col-sm-9">
			<input type="password" id="upwd" name="upwd" class="form-control well" placeholder="请输入密码"/>
		</div>
	</div>
</form>

<script type="text/javascript">

    //查询动态下拉框
    $(function(){
        $.ajax({
            url:'<%=request.getContextPath()%>/BookController/queryType.do',
            type:'post',
            success:function(data){
                var html='<option value="">'+"请选择"+'</option>'
                for(var i=0;i<data.length;i++){
                    html+='<option value="'+data[i].typeId+'">'+data[i].typeName+'</option>'
                }
                $("[name1='bookType1']").html(html)
            }
        })
    })

</script>
</body>
</html>
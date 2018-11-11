<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0024)http://www.zuidaima.com/ -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <title>Insert title here</title>
</head>
<body>
<script src="/js/jquery.min.js"></script>
<script>
    $(function(){
        location.href="login.jsp";
        $.ajax({
            url:'/pay/addusernb',
            type:'post',
            dataType:'json',
            data:{"nbcount":'${jiaqian}',"id":'${session.indexuser.login}'},
            success:function(){
            }
        })
    })
</script>
</body>
</html>
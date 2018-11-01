<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/EasyUI/themes/default/easyui.css" type="text/css"/>

    <!-- 引入EasyUI的图标样式文件-->
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/EasyUI/themes/icon.css" type="text/css"/>
    <link rel="stylesheet"  href="<%=request.getContextPath()%>/js/uploadify/uploadify.css" type="text/css"/>
</head>
<body>
<div id="showLogin"></div>

<!-- 引入JQuery -->
<script type="text/javascript"
        src="<%=request.getContextPath()%>/EasyUI/jquery.min.js"></script>

<!-- 引入EasyUI -->
<script type="text/javascript"
        src="<%=request.getContextPath()%>/EasyUI/jquery.easyui.min.js"></script>

<!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
<script type="text/javascript"
        src="<%=request.getContextPath()%>/EasyUI/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript"
        src="<%=request.getContextPath()%>/EasyUI/util-js.js"></script>
<script src="<%=request.getContextPath()%>/js/uploadify/jquery.uploadify.min.js"></script>

<script type="text/javascript">
    $(function(){
        loadLogin();
    })
    function loadLogin(){
        $('#showLogin').dialog({
            title:'用户登录',
            width: 360,
            height: 300,
            closed: false,
            cache: false,
            href: '/user/todailoging',
            modal: true
        });
    }
</script>
</body>
</html>
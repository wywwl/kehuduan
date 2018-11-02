<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="javaScript:search(1)">首页</a>
	<a href="javaScript:search(${page.cpage-1})">上一页</a>
	${page.cpage}/${page.totalPage}  
	<a href="javaScript:search(${page.cpage+1})">下一页</a>
	<a href="javaScript:search(${page.totalPage})">尾页</a>

</body>
</html>
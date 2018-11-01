<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="../css/normalize.css" />
    <link rel="stylesheet" type="text/css" href="../css/demo.css" />
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="../css/component.css" />
    <!--[if IE]>
    <script src="../js/html5.js"></script>
    <![endif]-->
</head>
<body>
    <form id="aaa">
        <br/><br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户名：<input  type="text" name="name" id="name"><br/><br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  密码：<input type="password" name="upwd" id="upwd"><br/><br/>
        &nbsp;&nbsp;&nbsp; 验证码：<input name="loginCode" id="loginCode" type="text"  >
        <img  id="volidImg" onclick="flushImg()" src="/user/getVerifyxx" height="30" width="100" >
        <br/><br/>
        <center><input value="登录" onclick="login()"type="button" ></center>

    </form>


<script type="text/javascript"
        src="../EasyUI/jquery.min.js"></script>
<script type="text/javascript">
    //刷新图片
    function flushImg(){
        $("#volidImg").prop("src","/user/getVerifyxx?"+Math.random());
    }
    function login(){
        $.ajax({
            type:"post",
            data:$("#aaa").serialize(),
            url:"/user/loginingttwo",
            success:function(msg){
//	 			-1: 验证码错误 0：用户名不存在  1：密码错误 2：登录成功
                switch(msg){
                    case "-1":{
                        alert("验证码错误")
                        break;
                    }
                    case "0":{
                        alert("用户名有问题，没蒙对")
                        break;
                    }
                    case "1":{
                        alert("密码错误，盗号不成熟")
                        break;
                    }
                    case "2":{
                        alert("成功")
                        location.href="/user/tolayouts"
                        break;
                    }
                }
            }

        })
    }
</script>
<%--

<div class="container demo-1">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <div class="logo_box">
                <h3>欢迎你</h3>
                <form id="form">
                    <div class="input_outer">
                        <span class="t_user"></span>
                        <input name="name" class="text" style="color: #FFFFFF !important" type="text"  placeholder="请输入账户">
                    </div>
                    <div class="input_outer">
                        <span class="t_user"></span>
                        <input name="upwd" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"type="password" placeholder="请输入密码">
                    </div>
                    <div class="input_outer">
                        <input name="loginCode" class="text" style="color: #FFFFFF !important" type="text"  placeholder="请输入验证码">
                        <img  id="volidImg" onclick="flushImg()" src="/user/getVerify" height="30" width="100" >
                    </div>

                    <div class="mb2">
                        <input value="登录" class="text" onclick="login()"  style="color: #FFFFFF !important" type="button" >
                    </div>
                </form>
            </div>
        </div>
    </div>
</div><!-- /container -->
<script src="../js/TweenLite.min.js"></script>
<script src="../js/EasePack.min.js"></script>
<script src="../js/rAF.js"></script>
<script src="../js/demo-1.js"></script>
<div style="text-align:center;">
</div>
<!-- 引入JQuery -->
--%>

</body>
</html>
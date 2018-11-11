<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/10
  Time: 9:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_common.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_home_space.css" />
<script src="${path}/boot/bootstrap3/js/jquery-3.2.0.min.js"></script>
<body id="nv_forum" class="pg_index">
<%@ include file="/WEB-INF/inc/top.jsp"%>

<div id="wp" class="wp">
    <div id="pt" class="bm cl">
        <div class="z">
            <a href="${path}/" class="nvhm" title="首页">首页</a>
            <em>›</em>
            <a href="${path}/user/index.do">设置</a>
            <em>›</em>密码安全
        </div>
    </div>
    <div id="ct" class="ct2_a wp cl">
        <p><strong>确认你的电子邮箱</strong></p>
        <p><input type="text" class="input" name="email" id="email"  disabled="true"　readOnly="true">
            <span id="chkmsg"></span></p>
        <input type="text" class="input" name="email" id="code">
        <input type="button" class="input" name="email" id="getCode" value="获取邮箱验证码">
        <span id="codes" ></span></p>
        <p><input type="button" class="btn" id="sub_btn" value="提 交"></p>



        <div class="appl">
            <div class="tbn">
                <h2 class="mt bbda">设置</h2>
                <ul>
                    <li><a href="${path}/index">个人资料</a></li>
                    <li class="a"><a href="${path}/topwd">密码安全</a></li>
                    <li><a href="${path}/showUserJiFen">积分</a></li>
                    <li><a href="${path}/toSendemail">邮箱验证修改密码</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>



<%@ include file="/WEB-INF/inc/foot.jsp"%>
</body>





<script >

    $(function(){
        $.ajax({
            type: "POST",
            url: "../common/getUserEmail",
            async: true,
            success: function(data){
                   $("#email").val(data);
            }
        });


    })

        $("#sub_btn").click(function(){
            var isemail=$("#code").val();
            var email = $("#email").val();
            var preg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*!/; //匹配Email
            if(email=='' || !preg.test(email)){
                $("#chkmsg").html("请填写正确的邮箱！");
            }else{
                $("#sub_btn").attr("disabled","disabled").val('提交中..').css("cursor","default");

                $.ajax({
                    type: "POST",
                    url: "../common/isemail",
                    data:{email:isemail},
                    async: true,
                    success: function(data){
                        if(data="success"){

                        }else if(data="noInfo"){

                            $("#chkmsg").html("该邮箱尚未注册！");
                            $("#sub_btn").removeAttr("disabled").val('提 交').css("cursor","pointer");
                        }else if (data="error") {
                          $("#codes").html("错误");
                        }

                    }
                });



             

            }
        });



    $("#getCode").click(function(){

        var email = $("#email").val();
        var preg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/; //匹配Email
        if(email=='' || !preg.test(email)){
            $("#chkmsg").html("请填写正确的邮箱！");
        }else{
            $("#sub_btn").attr("disabled","disabled").val('提交中..').css("cursor","default");
            $.ajax({
                type: "POST",
                url: "../common/verifyEmail",
                data:{email:email},
                async: true,
                success: function(data){
                    if(data="success"){

                    }else if(data="noInfo"){

                        $("#chkmsg").html("该邮箱尚未注册！");
                        $("#sub_btn").removeAttr("disabled").val('提 交').css("cursor","pointer");
                    }else if (data="error") {
                        $("#codes").html("错误");
                    }

                }
            });





        }

    })

</script>
</body>
</html>

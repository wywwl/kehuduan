<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>修改密码-${applicationScope.bbsinfo.name}</title>
    <meta name="keywords" content="修改密码" />
    <meta name="description" content="修改密码" />
    <link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_common.css" />
    <link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_home_space.css" />
    <script src="${path}/boot/bootstrap3/js/jquery-3.2.0.min.js"></script>
    <script type="text/javascript">
        function updatepwd(){
            var oldpassword=$("#oldpassword").val();
            var newpassword=$("#newpassword").val();
            var newpassword2=$("#newpassword2").val();
            if(oldpassword==""){
                $("#chk_oldpassword").html("请输入原始密码");
                return;
            }else{
                $("#chk_oldpassword").html("");
            }
            if(newpassword.length<6){
                $("#chk_newpassword").html("新密码长度不能小于6位");
                return;
            }else{
                $("#chk_newpassword").html("");
            }
            if(newpassword!=newpassword2){
                $("#chk_newpassword2").html("两次密码不一致");
                return;
            }else{
                $("#chk_newpassword2").html("");
            }

            var param={};
            param.pwd=oldpassword;
            param.newpwd=newpassword2;
            $.ajax({
                type: "POST",
                url: "../comment/pwd",
                data: param,
                async: false,
                dataType: "json",
                success: function(data){
                    if(data==1){
                        alert("密码修改成功");
                        $("#chk_newpassword2").html("");
                        $("#chk_newpassword").html("");
                        $("#chk_oldpassword").html("");
                        $("#oldpassword").val("");
                        $("#newpassword").val("");
                        $("#newpassword2").val("");
                    }else if(data==0){
                        $("#chk_oldpassword").html("原密码错误");
                    }else if(data=3){
                        alert("请登录");
                    }
                }
            });
        }


        function  toSendemail(){

            window.location.href='../toSendemail';
        }
    </script>
</head>
<body id="nv_forum" class="pg_index">
<%@ include file="/WEB-INF/inc/top.jsp"%>

<div id="wp" class="wp">
    <div id="pt" class="bm cl">
        <div class="z">
            <a href="${path}/" class="nvhm" title="首页">首页</a>
            <em>›</em>
            <a href="${path}/index.do">设置</a>
            <em>›</em>密码安全
        </div>
    </div>
    <div id="ct" class="ct2_a wp cl">
        <div class="mn">
            <div class="bm bw0">
                <h1 class="mt">密码安全 </h1>
                <p class="bbda pbm mbm"> 您必须填写原密码才能修改下面的资料</p>
                <form action="" method="post" >
                    <input type="hidden" value="0224ce8b" name="formhash" />
                    <table summary="个人资料" cellspacing="0" cellpadding="0" class="tfm">
                        <tbody>

                        <tr>
                            <th>新密码</th>
                            <td> <input type="password" name="newpassword" id="newpassword" class="px" /> <p class="d" id="chk_newpassword"></p> </td>
                        </tr>
                        <tr>
                            <th>确认新密码</th>
                            <td> <input type="password" name="newpassword2" id="newpassword2" class="px" /> <p class="d" id="chk_newpassword2"> </p> </td>
                        </tr>
                        </tbody>
                    </table>
                    <table cellspacing="0" cellpadding="0" class="tfm">
                        <tbody>
                        <tr>
                            <th>&nbsp;</th>
                            <td><button type="button" name="pwdsubmit" value="true" class="pn pnc" onclick="updatepwd();"><strong>保存</strong></button></td>
                            <td><button type="button"   value="true" class="pn pnc" onclick="toSendemail();"><strong>忘了密码?找回密码</strong></button></td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
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
</html>
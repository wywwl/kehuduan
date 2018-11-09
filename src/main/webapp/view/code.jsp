<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="最代码 www.zuidaima.com 最全面,最专业的源代码分享网站,近万名用户分享超过数万份高质量的java/jquery/bootstrap/html/css源代码" />
    <title>金科教育——1804A</title>
    <meta name="keywords" content="代码,代码分享,代码例子,源码,java代码，javascript代码,最代码,程序" />
    <link href="http://www.zuidaima.com/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="http://static.zuidaima.cn/static/v201806/js/syntaxhighlighter2/shCore-min.css" type="text/css" rel="stylesheet"/>
    <link href="http://static.zuidaima.cn/static/v201806/css/bootstrap.min.css" rel="stylesheet" />
    <link href="http://static.zuidaima.cn/static/v201806/css/font-awesome.min.css" rel="stylesheet" >
    <link href="http://static.zuidaima.com/static/v201806/css/zuidaima.css" rel="stylesheet" />
    <script src="http://static.zuidaima.cn/static/v201806/js/ckeditor/ckeditor.js">



    </script><script src="http://static.zuidaima.cn/static/v201806/js/jquery.1.10.2.min.js">

</script>
    <script src="http://static.zuidaima.com/static/v201806/js/zuidaima.js">

    </script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
</head>
<body>
<div class="header"><div class="navbar navbar-expand-md navbar-dark navbar-fixed-top fixed-top">
    <div class="container">
        <a href="/" title="最代码网站">
            <img src="http://static.zuidaima.com/resource/img/logo.png" alt="最代码网站">
        </a>
        <div class="collapse navbar-collapse nav_wrap">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a id="nav_index" class="nav-link" href="/">首页</a>
                </li>
                <li class="nav-item">
                    <a id="nav_share" class="nav-link" href="/share.htm">代码</a>
                </li>
                <li class="nav-item">
                    <a id="nav_question" class="nav-link" href="/question.htm">问答</a>
                </li>
                <li class="nav-item">
                    <a id="nav_blog" class="nav-link" href="../CodeController/qyeryblog">博客</a>
                </li>
                <li class="nav-item">
                    <a id="nav_activity" class="nav-link" href="/activity.htm">活动</a>
                </li>
                <li id="nav_buy" class="nav-item">
                    <a class="nav-link" href='javascript:void(0)' style="color:#FFFF00" rel="nofollow" title="购买牛币">购买</a>
                </li>
                <li class="nav-item"><div id="search_box">
                    <input type="text" id="search" placeholder="搜索您要的代码" value="搜索您要的代码"/>
                    <i class="icon-search fa fa-search">

                    </i>
                </div>
                </li>
            </ul>
        </div>
        <div class="collapse navbar-collapse nav_wrap justify-content-end">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="/user/login.htm" class="nav-link">登录</a>
                </li>
                <li class="nav-item">
                    <a href="/user/create.htm" class="nav-link">注册</a>
                </li>
            </ul>
        </div>
    </div>
</div>
</div>


<div class="header"></div>
<div class="main container margin_top10 width_998">
    <div class="row">
        <div class="col-9 left_bar">
            <div class="data_list">
                <div class="data_list_title2">
                    <div class="row">
                        <div class="col-8">
                            <img src="../img/list_ico.png" >最近代码列表
                        </div>
                        <div class="col-4">
                            <ul class="nav nav-tabs">
                                <li class="nav-item"><a class="nav-link active" href="">时间</a></li>
                                <li class="nav-item"><a class="nav-link" href="">下载</a></li>
                                <li class="nav-item"><a class="nav-link" href="">评论</a></li>
                                <li class="nav-item"><a class="nav-link" href="">牛币</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="datas">

                    <div class="data row">
                        <c:forEach items="${list}"  var="list">
                            <div class="col-1">
                                <a class="name" href="https://jinke1804a.oss-cn-beijing.aliyuncs.com/1804/1541159937262.jpg">
                                    <img content_id="4132167457753088_1" alt="css3实现3d图片旋转（多图）" class="profile rounded-circle" src="${list.userFile}"/></a>
                            </div>
                            <div class="col-11">
                                <div class="data_title">
                                    <span><a class="name" href="http://www.zuidaima.com/user/4099762891950080.htm">${list.userName}</a>&nbsp;<span title="5级,距离下次升级还差6贡献值" class="lv_sub">Lv${list.grade}</span></span>

                                    <span class="time pull-right">
                                        <fmt:formatDate value="${list.code_Release_date}"  pattern="yyyy年MM月dd日"  />
                                    </span>
                                </div>
                                <div class="margin_top5">
                                    <span title="最代码官方认证分享代码" class="validated">证</span>
                                    <a target="_top" href="../CodeController/qyerycodejsp?code_id=${list.code_id}" class="title">${list.code_title}</a>
                                </div>
                                <div class="content margin_top5" id="project_content_4099965877734400">
                                        ${list.code_content}
                                    <div class="clear">
                                        <a href="https://jinke1804a.oss-cn-beijing.aliyuncs.com/1804/1541159937262.jpg" target="_top"><img alt="css3实现3d图片旋转（多图）" data-rawwidth="809" data-rawheight="799" src="" class="lazy img-rounded" data-original="https://jinke1804a.oss-cn-beijing.aliyuncs.com/1804/1541159937262.jpg" style="height: 118px;"></a>&nbsp;&nbsp;
                                        <a href="https://jinke1804a.oss-cn-beijing.aliyuncs.com/1804/1541159937262.jpg" target="_top"><img alt="css3实现3d图片旋转（多图）" data-rawwidth="825" data-rawheight="489" src="" class="lazy img-rounded" data-original="https://jinke1804a.oss-cn-beijing.aliyuncs.com/1804/1541159937262.jpg" style="height: 71px;"></a>&nbsp;&nbsp;
                                    </div>
                                </div>
                                <div class="clear margin_top5 data_ops">
                                    <span class="code">浏览${list.code_Browse}</span>
                                    <span class="code">评论${list.comment}</span>
                                    <span class="code">下载${list.code_Download}</span>
                                    <span class="niubi">牛币${list.code_nb}</span>

                                    <span>
                                          <c:set value="${fn:split(list.keyword_name, ',') }" var="names" />
                                           <c:forEach items="${names}" var="labelsName">
                                             <a class="post_tag" href="http://www.zuidaima.com/share/kcss3-p1-s1.htm">
                                                     ${labelsName}
                                             </a>
                                           </c:forEach>
                                    </span>
                                    <span class="pull-right"><a class="post_topic" href="/manage/selectUserShare?ids=$" >${list.tName}</a></span>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>

            </div>
        </div>
        <div class="col-3 right_bar" id="jzuid">


        </div>
    </div>
</div>

<div id="floatPanel">
    <div class="ctrolPanel">
        <a class="arrow" href="#">顶部</a>
        <a rel="nofollow" class="contact" href="http://www.zuidaima.com/user/message.htm?uuid=1550463811307520" target="_top">客服</a>
        <a class="qrcode" href="#">微信二维码</a>
        <a class="arrow" href="#">底部</a>
    </div>
    <div style="" class="popPanel">
        <div class="popPanel-inner">
            <div class="qrcodePanel">
                <img src="/common/weixin.jpg" alt=">扫描二维码关注最代码为好友">扫描二维码关注最代码为好友
            </div>
            <div class="arrowPanel">
                <div class="arrow01"></div>
                <div class="arrow02"></div>
            </div>
        </div>
    </div>
</div>
<div id="ajax-modal" class="modal fade" style="display: none;"></div>
<div class="footer margin_top10">
    <div class="container">
        <div>
            <a href="http://www.zuidaima.com/help.htm" rel="nofollow">帮助</a>|
            <a href="http://www.zuidaima.com/contact.htm" rel="nofollow">联系我</a>|
            <a href="http://www.zuidaima.com/partner.htm">友情链接</a>|
            <a href="http://www.zuidaima.com/sitemap.xml" target="_top">网站地图</a>|
            <a href="http://www.zuidaima.com/share/rss.htm" target="_top">RSS订阅分享源代码</a>|
            <a href="http://www.zuidaima.com/question/rss.htm" target="_top">RSS订阅问答</a>|
            <a href="http://www.zuidaima.com/share.htm">最新分享源代码</a>|
            <a href="http://www.zuidaima.com/question.htm">最新问答</a>|
            <!--            <a rel="nofollow" target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=727c073145e93bd3ca3f3cf26fb0da62b6c92376bf4dafbb03accc738c1d017e"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="最代码官方群1" title="最代码官方群1"></a>-->
            <a rel="nofollow" target="_top" href="http://shang.qq.com/wpa/qunwpa?idkey=d3ef6d04eaad4a3ca96a76511b63e64914965b7d88fb05c3be81ce9d670b20e4">
                <img src="../img/timg.jpg" height="40px" width="40px" alt="最代码官方群9" title="最代码官方群9" border="0">
            </a>
            <a rel="nofollow" target="_top" href="http://shang.qq.com/wpa/qunwpa?idkey=97f0cf2b725ec7f018bcbe3c9f4fcb807ea7efc93d4de77d91f55046d7741d9b">
                <img src="../img/timg.jpg" height="40px" width="40px" alt="最代码官方群10" title="最代码官方群10" border="0">
            </a>
            <span class="pull-right">京ICP备12032064号</span>
        </div>
    </div>
</div>


</body>


<script type="text/javascript">

    /*一级二级管理*/
    $(function() {
        selectShare();
    })
    function selectShare(){
        $.ajax({
            url: "../CodeController/selectManage",
            dataType: "json",
            success: function (result) {
                var arr = ""
                for (var i = 0; i < result.length; i++) {
                    var array = result[i].managesList;
                    arr += "<ul class=\"data_list nav-list\" ><li><div class='data_list_title3 list-group'>";
                    arr += "<a href=''>" + result[i].tname + "</a>"
                    arr += "<ul class='navbar-nav' style='padding: 0px;'>";
                    arr += "</div>"
                    for (var y = 0; y < array.length; y++) {
                        arr += "<li class='col-12 nav-item'>";
                        arr += " <a href='/type/selectUserShare?ids="+array[y].id+"'>" + array[y].tname + "</a> ";
                        arr += "</li>"
                    }
                    arr += "</ul>"
                    arr += "</li> </ul>"
                }
                $("#jzuid").html(arr)
            }
        });
    }


</script>
</html>
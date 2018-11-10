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
    <title>分享代码-金科软件</title>
    <meta name="keywords" content="代码,代码分享,代码例子,源码,java代码，javascript代码,最代码,程序" />
    <link href="http://www.zuidaima.com/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="http://static.zuidaima.cn/static/v201806/js/syntaxhighlighter2/shCore-min.css"  type="text/css" rel="stylesheet"/>
    <link href="http://static.zuidaima.cn/static/v201806/css/bootstrap.min.css" rel="stylesheet" />
    <link href="http://static.zuidaima.cn/static/v201806/css/font-awesome.min.css"  rel="stylesheet" >
    <link href="http://static.zuidaima.com/static/v201806/css/zuidaima.css" rel="stylesheet" />
    <script src="http://static.zuidaima.cn/static/v201806/js/ckeditor/ckeditor.js"></script>
    <script src="http://static.zuidaima.cn/static/v201806/js/jquery.1.10.2.min.js"></script>
    <script src="http://static.zuidaima.com/static/v201806/js/zuidaima.js"></script>



    <script src="http://static.zuidaima.cn/static/v201806/js/bootstrap.min.js"></script>
    <script src="http://static.zuidaima.cn/static/v201806/js/mustache.js"></script>
    <script src="http://static.zuidaima.cn/static/v201806/js/syntaxhighlighter2/shBrushs-min.js"></script>
    <script src="http://static.zuidaima.cn/static/v201806/js/jquery.lazyload.js"></script>
    <script src="http://static.zuidaima.cn/static/v201806/js/jquery.gifplayer.js"></script>
    <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
</head>
<body>
<div class="header">
    <div class="navbar navbar-expand-md navbar-dark navbar-fixed-top fixed-top">
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
                    <a id="nav_share" class="nav-link" href="../CodeController/qyerycode">代码</a>
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
                <li class="nav-item dropdown my_box">
                    <a href="javascript:void(0)" class="nav-link" data-toggle="dropdown" style="color:#FFFF00">发表</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="/share/create.htm"><i class="fa fa-code"></i>分享代码</a>
                        <a class="dropdown-item" href="/question/create.htm"><i class="fa fa-question"></i>提出问题</a>
                        <a class="dropdown-item" href="/blog/create.htm"><i class="fa fa-cogs"></i>编写博客</a>
                    </div>
                </li>
                <li class="nav-item dropdown remind_box">
                    <a class="nav-link" href="javascript:void(0)"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fa fa-bell"></i>
                        <span class="remind_count" id="remind_count" style="display:none">0</span>
                    </a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="/user/message.htm">
                            <i class="fa fa-envelope"></i>我的私信
                            <span class="remind_count" id="remind_count_0" style="display:none">0</span></a>
                        <a class="dropdown-item" href="/user/receive_comment.htm"><i class="fa fa-commenting"></i>收到评论<span class="remind_count" id="remind_count_1" style="display:none">0</span></a>
                        <a class="dropdown-item" href="/user/mention.htm"><i class="fa fa-user-circle"></i>提到我的<span class="remind_count" id="remind_count_2" style="display:none">0</span></a>
                        <a class="dropdown-item" href="/user/receive_like_post.htm"><i class="fa fa-heart"></i>心情被赞<span class="remind_count" id="remind_count_3" style="display:none">0</span></a>
                        <a class="dropdown-item" href="/user/receive_dislike_post.htm"><i class="fa fa-heart"></i>心情被踩<span class="remind_count" id="remind_count_4" style="display:none">0</span></a>
                        <a class="dropdown-item" href="/user/fans.htm"><i class="fa fa-user-circle"></i>新的粉丝<span class="remind_count" id="remind_count_5" style="display:none">0</span></a>
                        <a class="dropdown-item" href="/user/notification.htm"><i class="fa fa-flag"></i>系统通知<span class="remind_count" id="remind_count_6" style="display:none">0</span></a>
                    </div>
                </li>
                <li class="nav-item dropdown my_box">
                    <a href="javascript:void(0)" class="nav-link" data-toggle="dropdown"><img class="user_header_32X32" src="http://static.zuidaima.com//resource/img/default_avatar.png"/></a>
                    <div class="dropdown-menu">
                        <b class="dropdown-item font-weight-bold">共有1牛币</b>
                        <a class="dropdown-item" href="/user/4141933609060352.htm"><i class="fa fa-home"></i>个人主页</a>
                        <a class="dropdown-item" href="/user/withdraw.htm">
                            <i class="fa fa-home"></i>我的后台</a>
                        <a class="dropdown-item" href="/user/update.htm">
                            <i class="fa fa-cog"></i>设置资料</a>
                        <a class="dropdown-item" href="/user/logout.htm">
                            <i class="fa fa-power-off"></i>退出系统</a>
                    </div>
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
                            <img src="../img/list_ico.png" >最近博客列表
                        </div>

                    </div>
                </div>
                <div class="datas">

                    <div class="data row">
                        <c:forEach items="${list}"  var="list">
                            <div class="col-1">
                                <a class="name" href="https://jinke1804a.oss-cn-beijing.aliyuncs.com/1804/1541159937262.jpg">
                                    <img content_id="4132167457753088_1" alt="" class="profile rounded-circle" src="${list.userFile}"/></a>
                            </div>
                            <div class="col-11">
                                <div class="data_title">
                                    <span><a class="name" href="http://www.zuidaima.com/user/4099762891950080.htm">${list.userName}</a>
                                        &nbsp;<span title="5级,距离下次升级还差6贡献值" class="lv_sub">Lv${list.grade}</span>
                                    </span>

                                    <span class="time pull-right">
                                        <fmt:formatDate value="${list.blog_Publication_time}"  pattern="yyyy年MM月dd日"  />
                                    </span>


                                </div>
                                <div class="margin_top5">
                                    <span title="最代码官方认证分享代码" class="validated">证</span>
                                    <a target="_top" href="../CodeController/qyeryblogjsp?blog_id=${list.blog_id}" class="title">${list.blog_title}</a>
                                </div>
                                <div class="content margin_top5" id="project_content_4099965877734400">
                                        ${list.blog_content}

                                </div>
                                <div class="clear margin_top5 data_ops">
                                    <span class="code">浏览${list.blog_Browse_number}</span>
                                    <span class="code">评论${list.blog_comments}</span>


                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>
                <ul class="pagination justify-content-center margin_top10">
                    <li class="page-item active">
                        <a class="page-link"  href="javascript:void(0)">1</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link"  href="/blog/p2.htm">2</a>
                    </li>

                    <span>...</span>
                    <li class="page-item">
                        <a href="/blog/p37.htm" class="page-link">37</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link" href="/blog/p2.htm">下一页</a>
                    </li>
                </ul>


            </div>
        </div>
        <div class="col-3 right_bar">
            <div class="data_list">
                <div class="data_list_title">
                    <img src="http://static.zuidaima.com/resource/img/heart_ico.png" alt="最代码最近心情列表"/>最近心情</div>
                <div class="datas">
                    <div class="data clear">
                        <c:forEach items="${commentList}" var="commentList">
                        <div class="data_title">
                            <span>
                                <a class="name" href="/user/3612915580078080.htm"></a>
                                &nbsp;
                                <span title="2级,距离下次升级还差0贡献值" class="lv_sub">LV2</span>
                            </span>
                            <span class="time pull-right">${commentList.addtime}</span>
                        </div>
                        <div class="content">${commentList.content}<div class="comments_count">
                            <a title="${commentList.commentCount}个评论" target="_blank" href="/mood/1588308/comment.htm" rel="nofollow">
                                <i class="fa fa-comment">

                                </i>
                            </a>&nbsp;&nbsp;
                            <a class="like_count like" title="${commentList.likenumber}个赞"  content_id="1588308" type="1101" href="javascript:void(0)" rel="nofollow">
                                <i class="fa fa-thumbs-up">

                                </i>
                                <span id="like_count_1588308">

                              </span>
                            </a>&nbsp;&nbsp;
                            <a class="dislike_count dislike" title="${commentList.praiseCount}个踩"  content_id="1588308" type="1201" href="javascript:void(0)" rel="nofollow">
                                <i class="fa fa-thumbs-down">

                                </i>
                                <span id="dislike_count_1588308">

                                </span>
                            </a>
                        </div>
                            </c:forEach>
                        </div>
                     </div>

                   </div>
            </div>

            <div class="data_list margin_top10">

                <div class="data_list_title">
                    <img src="../img/xin.jpg" height="15px" width="15px" alt="最代码最近下载分享源代码列表" />最多贡献
                </div>

                <div class="datas">
                    <c:forEach items="${userBeanlist}" var="li">
                    <div class="data">
                        <div>
                            <span>
                                <a class="name" href="http://www.zuidaima.com/user/1550463811307520.htm">
                                  <img content_id="4132167457753088_1" alt="" class="profile rounded-circle" src="${li.file}"/>
                                </a>
                                <a class="name" href="../CodeController/queryuser?id=${li.id}">${li.name}</a>&nbsp;
                                <span title="137级,距离下次升级还差0贡献值" class="lv_sub">Lv${li.grade}</span>
                            </span>

                        </div>
                        <div>
                            <span class="code">
                                <a href="../CodeController/querygrade" target="_top" rel="nofollow" title="贡献值19318,距离下次升级还差0贡献值">
                                   ${li.gradeFile}
                                </a>
                            </span>

                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <div class="data_list margin_top10">
                <div class="data_list_title">
                    <img src="../img/xin.jpg" height="15px" width="15px" alt="最代码最近浏览分享源代码列表" />最牛用户
                </div>
                <div class="datas">
                    <c:forEach items="${userBeanlist}" var="li">
                        <div class="data">
                            <div>
                            <span>
                                <a class="name" href="http://www.zuidaima.com/user/1550463811307520.htm">
                                  <img content_id="4132167457753088_1" alt="" class="profile rounded-circle" src="${li.file}"/>
                                </a>
                                <a class="name" href="../CodeController/queryuser?id=${li.id}">${li.name}</a>&nbsp;
                                <span title="137级,距离下次升级还差0贡献值" class="lv_sub">Lv${li.grade}</span>
                            </span>

                            </div>
                            <div>
                            <span class="code">
                                <a href="../CodeController/querygrade" target="_top" rel="nofollow" title="贡献值19318,距离下次升级还差0贡献值">
                                   ${li.gradeFile}
                                </a>
                            </span>

                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
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
</html>

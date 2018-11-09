
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


<div class="main container margin_top10 width_998">
    <div class="row">
        <c:forEach items="${list}" var="list">
        <div class="col-9 left_bar">
            <div class="code_detail">
                <a href="http://www.zuidaima.com/">首页</a>
                <b>&gt;</b>
                <a href="http://www.zuidaima.com/share.htm">博客</a>
                <b>&gt;</b>
                <a href="http://www.zuidaima.com/share/4136740921494528.htm">${list.blog_title}</a>
            </div>
            <div class="data_list">
                <div class="data_list_title">
                    <span class="pull-right">
                        <a class="download_code" href="javascript:void(0)">下载</a>&nbsp;
                        <a class="reward_code" href="javascript:void(0)" content_id="14380">打赏</a>
                    </span>
                    <br clear="all" />
                </div>
                <div class="datas margin_top10">
                    <div class="data row">
                        <div class="col-1">
                            <a class="name" href="http://www.zuidaima.com/user/3783358206609408.htm">
                                <img content_id="3783358206609408_" alt="lyy123asd的gravatar头像" class="profile rounded-circle" src="${list.userFile}" /></a>
                        </div>
                        <div class="col-11">
                            <div class="data_title">
                                <span><a class="name" href="http://www.zuidaima.com/user/3783358206609408.htm">${list.userName}</a></span>
                                <span class="time pull-right">${list.blog_Publication_time}</span>
                            </div>
                            <div class="margin_top5 title_normal">
                                <span title="最代码官方认证分享代码" class="validated">证</span>
                                <h1>${list.blog_title}</h1>
                            </div>
                            <div class="content_detail margin_top5" id="content_detail_1" style="display: block;">
                                    ${list.blog_content}
                            </div>
                            <div>
                                <h5>猜你喜欢</h5>
                                <ul>
                                    <li><a target="_top" href="http://www.zuidaima.com/share/3469012308118528.htm" title="java swing实现进销存销售管理系统,可用作java毕业设计系统">java swing实现进销存销售管理系统,可用作java毕业设计系统</a></li>
                                    <li><a target="_top" href="http://www.zuidaima.com/share/2119613987867648.htm" title="java Swing开发简单备忘录源代码下载">java Swing开发简单备忘录源代码下载</a></li>
                                    <li><a target="_top" href="http://www.zuidaima.com/share/1955351639854080.htm" title="java swing开发实现的记事本源代码实例下载">java swing开发实现的记事本源代码实例下载</a></li>
                                    <li><a target="_top" href="http://www.zuidaima.com/share/4034841925258240.htm" title="Java swing拼图小游戏源代码">Java swing拼图小游戏源代码</a></li>
                                    <li><a target="_top" href="http://www.zuidaima.com/share/4008121520000000.htm" title="基于java swing的聊天室GUI demo实例">基于java swing的聊天室GUI demo实例</a></li>
                                    <li><a target="_top" href="http://www.zuidaima.com/share/2710872246471680.htm" title="java swing开发实现简单计算器">java swing开发实现简单计算器</a></li>
                                    <li><a target="_top" href="http://www.zuidaima.com/share/3992109073337344.htm" title="java swing实现的计算器实例">java swing实现的计算器实例</a></li>
                                    <li><a target="_top" href="http://www.zuidaima.com/share/3198136731323392.htm" title="java swing开发进销存管理系统">java swing开发进销存管理系统</a></li>
                                    <li><a target="_top" href="http://www.zuidaima.com/share/3157454051200000.htm" title="java swing开发的学生信息管理系统,适合java swing初学者">java swing开发的学生信息管理系统,适合java swing初学者</a></li>
                                    <li><a target="_top" href="http://www.zuidaima.com/share/2705604249668608.htm" title="java swing开发项目管理系统1.0,用于java swing学习">java swing开发项目管理系统1.0,用于java swing学习</a></li>
                                    <li><a target="_top" href="http://www.zuidaima.com/share/2344842245245952.htm" title="java Swing界面优化Jpanel教程">java Swing界面优化Jpanel教程</a></li>
                                    <li><a target="_top" href="http://www.zuidaima.com/share/4013622414773248.htm" title="java swing实现拖动控件简单实例">java swing实现拖动控件简单实例</a></li>
                                </ul>
                            </div>
                            <br />
                            <center>
                                <a style="font-size: 20px; padding: 15px;" class="btn btn-danger reward" href="javascript:void(0)" content_id="14380">打赏</a>
                                <br />
                                <br />
                                <div id="reward_event_list" style="text-align: center;">
                                    已有1人打赏
                                    <br />
                                    <br />
                                    <a target="_top" href="http://www.zuidaima.com/user/1550463811307520.htm">
                                        <img class="user_header_60X60 rounded-circle" src="../img/jinke.jpg"  alt="最代码官方的gravatar头像" title="打赏了5牛币" /></a>
                                </div>
                            </center>
                            <br clear="all" />
                            <div class="margin_top5 data_ops">
                                <span comment_id="0" class="comments_list" content_id="14380" type="1">

                                    <a href="javascript:void(0)">${list.blog_comments}个评论</a>
                                </span>

                            </div>
                        </div>
                    </div>
                </div>

                </c:forEach>
            </div>
            <br>
            <br>
            <img src="http://tpc.googlesyndication.com/daca_images/simgad/11250355926562476033" border="0" width="728" alt="" class="img_ad">
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
                                <a class="name" href="/user/3612915580078080.htm">brights123</a>
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

                <center>
                    <img src="http://tpc.googlesyndication.com/daca_images/simgad/6216905209967188291" border="0" width="160" height="565" alt="" class="img_ad">
                </center>
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

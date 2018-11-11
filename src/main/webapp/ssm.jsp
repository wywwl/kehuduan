<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <title>金科教育</title>
    <link href="http://www.zuidaima.com/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="http://static.zuidaima.cn/static/v201806/js/syntaxhighlighter2/shCore-min.css" type="text/css" rel="stylesheet" />
    <link href="http://static.zuidaima.cn/static/v201806/css/bootstrap.min.css" rel="stylesheet" />
    <link href="http://static.zuidaima.cn/static/v201806/css/font-awesome.min.css" rel="stylesheet" />
    <link href="http://static.zuidaima.com/static/v201806/css/zuidaima.css" rel="stylesheet" />
    <script src="http://pagead2.googlesyndication.com/pagead/js/r20181031/r20180604/osd.js"></script>
    <script src="http://pagead2.googlesyndication.com/pub-config/r20160913/ca-pub-2303958443489176.js"></script>
    <script src="//hm.baidu.com/hm.js?500f123d596f6dae47e36a9a36fed240"></script>
    <script src="http://static.zuidaima.cn/static/v201806/js/ckeditor/ckeditor.js"></script>
    <style>.cke{visibility:hidden;}</style>
    <script src="http://static.zuidaima.cn/static/v201806/js/jquery.1.10.2.min.js"></script>
    <script src="http://static.zuidaima.com/static/v201806/js/zuidaima.js"></script>
    <link rel="preload" href="https://adservice.google.com/adsid/integrator.js?domain=www.zuidaima.com" as="script" />
    <script type="text/javascript" src="https://adservice.google.com/adsid/integrator.js?domain=www.zuidaima.com"></script>
    <link rel="preload" href="http://pagead2.googlesyndication.com/pagead/js/r20181031/r20180604/show_ads_impl.js" as="script" />
</head>
<body style="" onload="Loadpage()">
<div class="header">
    <div class="navbar navbar-expand-md navbar-dark navbar-fixed-top fixed-top">
        <div class="container">
            <a href="javascript:void(0)" title="最代码网站"><img src="<%=request.getContextPath()%>/image/ss.png" width="30" height="30" alt="金科教育网站" /></a>
            <div class="collapse navbar-collapse nav_wrap">
                <ul class="navbar-nav">
                    <li class="nav-item"><a id="nav_index" class="nav-link" href="javascript:toMain()">首页</a></li>
                    <li class="nav-item"><a id="nav_share" class="nav-link" href="/share.htm">代码</a></li>
                    <li class="nav-item"><a id="nav_question" class="nav-link youarehere" href="/question.htm">问答</a></li>
                    <li class="nav-item"><a id="nav_blog" class="nav-link" href="/blog.htm">博客</a></li>
                    <li class="nav-item"><a id="nav_activity" class="nav-link" href="/activity.htm">活动</a></li>
                    <li class="nav-item"><a id="nav_event" class="nav-link" href="/event.htm">动态</a></li>
                    <li id="nav_buy" class="nav-item"><a class="nav-link" href="javascript:void(0)" style="color:#FFFF00" rel="nofollow" title="购买牛币">购买</a></li>
                    <li class="nav-item">
                        <div id="search_box">
                            <input type="text" id="search" placeholder="搜索您要的代码" />
                            <a href="javascript:sercher()" class="icon-search fa fa-search"></a></div></li>
                </ul>
            </div>
            <div class="collapse navbar-collapse nav_wrap justify-content-end">
                <ul class="navbar-nav">
                    <li class="nav-item dropdown my_box"><a href="javascript:void(0)" class="nav-link" data-toggle="dropdown" style="color:#FFFF00">发表</a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/share/create.htm"><i class="fa fa-code"></i>分享代码</a>
                            <a class="dropdown-item" href="/question/create.htm"><i class="fa fa-question"></i>提出问题</a>
                            <a class="dropdown-item" href="/blog/create.htm"><i class="fa fa-cogs"></i>编写博客</a>
                        </div></li>
                    <li class="nav-item dropdown remind_box"><a class="nav-link" href="javascript:void(0)" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bell"></i><span class="remind_count" id="remind_count" style="display:none">0</span></a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="/user/message.htm"><i class="fa fa-envelope"></i>我的私信<span class="remind_count" id="remind_count_0" style="display:none">0</span></a>
                            <a class="dropdown-item" href="/user/receive_comment.htm"><i class="fa fa-commenting"></i>收到评论<span class="remind_count" id="remind_count_1" style="display:none">0</span></a>
                            <a class="dropdown-item" href="/user/mention.htm"><i class="fa fa-user-circle"></i>提到我的<span class="remind_count" id="remind_count_2" style="display:none">0</span></a>
                            <a class="dropdown-item" href="/user/receive_like_post.htm"><i class="fa fa-heart"></i>心情被赞<span class="remind_count" id="remind_count_3" style="display:none">0</span></a>
                            <a class="dropdown-item" href="/user/receive_dislike_post.htm"><i class="fa fa-heart"></i>心情被踩<span class="remind_count" id="remind_count_4" style="display:none">0</span></a>
                            <a class="dropdown-item" href="/user/fans.htm"><i class="fa fa-user-circle"></i>新的粉丝<span class="remind_count" id="remind_count_5" style="display:none">0</span></a>
                            <a class="dropdown-item" href="/user/notification.htm"><i class="fa fa-flag"></i>系统通知<span class="remind_count" id="remind_count_6" style="display:none">0</span></a>
                        </div></li>
                    <c:if test="${userInfo==null}">

                    </c:if>
                      <li class="nav-item dropdown my_box"><a href="javascript:void(0)" class="nav-link" data-toggle="dropdown"><img class="user_header_32X32" src="http://static.zuidaima.com//resource/img/default_avatar.png" /></a>
                        <div class="dropdown-menu">
                            <b class="dropdown-item font-weight-bold">共有0牛币</b>
                            <a class="dropdown-item" href="/user/4131429919803392.htm"><i class="fa fa-home"></i>个人主页</a>
                            <a class="dropdown-item" href="/user/withdraw.htm"><i class="fa fa-home"></i>我的后台</a>
                            <a class="dropdown-item" href="/user/update.htm"><i class="fa fa-cog"></i>设置资料</a>
                            <a class="dropdown-item" href="javascript:Signout()"><i class="fa fa-power-off"></i>退出系统</a>
                        </div></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="text-center">
    <!-- 718 -->
    <ins class="adsbygoogle my_adslot" style="display: inline-block; width: 728px; height: 90px;" data-ad-client="ca-pub-2303958443489176" data-ad-slot="2718318847" data-adsbygoogle-status="done">
        <ins id="aswift_0_expand" style="display:inline-table;border:none;height:90px;margin:0;padding:0;position:relative;visibility:visible;width:728px;background-color:transparent;">
            <ins id="aswift_0_anchor" style="display:block;border:none;height:90px;margin:0;padding:0;position:relative;visibility:visible;width:728px;background-color:transparent;">
                <iframe width="728" height="90" frameborder="0" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" onload="var i=this.id,s=window.google_iframe_oncopy,H=s&amp;&amp;s.handlers,h=H&amp;&amp;H[i],w=this.contentWindow,d;try{d=w.document}catch(e){}if(h&amp;&amp;d&amp;&amp;(!d.body||!d.body.firstChild)){if(h.call){setTimeout(h,0)}else if(h.match){try{h=s.upd(h,i)}catch(e){}w.location.replace(h)}}" id="aswift_0" name="aswift_0" style="left:0;position:absolute;top:0;width:728px;height:90px;"></iframe>
            </ins>
        </ins>
    </ins>
    <script>(adsbygoogle = window.adsbygoogle || []).push({});</script>
</div>
<div class="main container margin_top10 width_998">

    <div class="row">
        <div class="col-9 left_bar">
            <c:forEach items="${problem}" var="problem">
                <div class="data row">
                    <div class="col-1">
                        <a class="name" href="/user/2682953842198528.htm"><img src="<%=request.getContextPath()%>/image/ss.png" width="30" height="30" alt="金科教育网站" /></a>
                    </div>
                    <div class="col-11">
                        <div class="hovercard_2682953842198528_0 hovercard">
                            <div class="hovercontent">
                                <div class="right_bar">
                                    <div class="user">
                                        <div class="row margin_top10">
                                            <div class="col-6">
                                                <img width="90px" height="90px" alt="zdd123456的gravatar头像" src="http://static.zuidaima.com//resource/img/default_avatar.png" />
                                            </div>
                                            <div class="col-6">
                                                <p>ID:${problem.id}</p>
                                                <p>牛币:${problem.nbcount}</p>
                                                <p><a href="/faq.htm#rank_rule" target="_blank" rel="nofollow" title="贡献值98,距离下次升级还差0贡献值"><img src="http://static.zuidaima.com/resource/img/lv_moon.png" alt="月亮" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_moon.png" alt="月亮" class="lv" /></a></p>
                                            </div>
                                        </div>
                                        <div class="margin_top10">
                                                ${problem.content}
                                        </div>
                                        <div class="margin_top10">
                                                ${problem.newDate}
                                        </div>
                                        <div class="row margin_top10 show-grid">
                                            <a content_id="2682953842198528" href="javascript:void(0)" class="offset-1 col-4 follow" id="follow_2682953842198528">关注</a>
                                            <a content_id="2682953842198528" href="/user/message.htm?uuid=2682953842198528" class="offset-2 col-4 message" id="message">私信</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="data_title">
                            <span><a class="name" href="/user/2682953842198528.htm">${problem.id}</a>&nbsp;<span title="8级,距离下次升级还差0贡献值" class="lv_sub"></span>${problem.grade}L</span>
                            <span class="time pull-right">${problem.createtime.substring(0,11)}</span>
                        </div>
                        <div class="margin_top5">
                            <span title="最代码官方等待解决提问" class="waiting">等</span>
                            <a target="_blank" href="/question/4128073361902592.htm" class="title">${problem.problem}</a>
                        </div>
                        <div class="content margin_top5" id="project_content_4128073361902592">
                                ${problem.content}
                        </div>
                        <div class="clear margin_top5 data_ops">
                            <span class="code">浏览${problem.browse}</span>
                            <span class="code">评论${problem.id}</span>
                            <span class="niubi">牛币${problem.nbcount}</span>
                            <span class="niubi">回答${problem.grade}</span>
                            <span><a class="post_tag" href="/question/k项目部署-p1-s1.htm">${problem.tname}</a><a class="post_tag" href="/question/k生产环境-p1-s1.htm"></a></span>
                            <span class="pull-right"><a class="post_topic" href="/question_topic/kWeb服务器-p1-s1.htm">${problem.tname}</a></span>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="col-3 right_bar">
            <div class="data_list">
                <div class="data_list_title">
                    <img src="http://static.zuidaima.com/resource/img/heart_ico.png" alt="最代码最近心情列表" />最近心情
                    <span class="more"><a href="/mood.htm" rel="nofollow">更多</a></span>
                </div>
                <div class="datas">
                    <div class="data clear">
                        <div class="data_title">
                            <span><a class="name" href="/user/3558931814909952.htm">Tibbers</a>&nbsp;<span title="2级,距离下次升级还差9贡献值" class="lv_sub">LV2</span></span>
                            <span class="time pull-right">1分钟前</span>
                        </div>
                        <div class="content">
                            我决定今天买东西，双十一不买
                            <div class="comments_count">
                                <a title="0个评论" target="_blank" href="/mood/1589195/comment.htm" rel="nofollow"><i class="fa fa-comment"></i></a>&nbsp;&nbsp;
                                <a class="like_count like" title="0个赞" content_id="1589195" type="1101" href="javascript:void(0)" rel="nofollow"><i class="fa fa-thumbs-up"></i><span id="like_count_1589195"></span></a>&nbsp;&nbsp;
                                <a class="dislike_count dislike" title="0个踩" content_id="1589195" type="1201" href="javascript:void(0)" rel="nofollow"><i class="fa fa-thumbs-down"></i><span id="dislike_count_1589195"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="data clear">
                        <div class="data_title">
                            <span><a class="name" href="/user/3935508314228736.htm">caozhongjue1</a>&nbsp;<span title="10级,距离下次升级还差15贡献值" class="lv_sub">LV10</span></span>
                            <span class="time pull-right">3分钟前</span>
                        </div>
                        <div class="content">
                            迷茫迷茫，心情复杂
                            <div class="comments_count">
                                <a title="0个评论" target="_blank" href="/mood/1589192/comment.htm" rel="nofollow"><i class="fa fa-comment"></i></a>&nbsp;&nbsp;
                                <a class="like_count like" title="0个赞" content_id="1589192" type="1101" href="javascript:void(0)" rel="nofollow"><i class="fa fa-thumbs-up"></i><span id="like_count_1589192"></span></a>&nbsp;&nbsp;
                                <a class="dislike_count dislike" title="0个踩" content_id="1589192" type="1201" href="javascript:void(0)" rel="nofollow"><i class="fa fa-thumbs-down"></i><span id="dislike_count_1589192"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="data clear">
                        <div class="data_title">
                            <span><a class="name" href="/user/3648747744282624.htm">YX5337934887</a>&nbsp;<span title="5级,距离下次升级还差3贡献值" class="lv_sub">LV5</span></span>
                            <span class="time pull-right">3分钟前</span>
                        </div>
                        <div class="content">
                            干点什么好
                            <div class="comments_count">
                                <a title="0个评论" target="_blank" href="/mood/1589189/comment.htm" rel="nofollow"><i class="fa fa-comment"></i></a>&nbsp;&nbsp;
                                <a class="like_count like" title="0个赞" content_id="1589189" type="1101" href="javascript:void(0)" rel="nofollow"><i class="fa fa-thumbs-up"></i><span id="like_count_1589189"></span></a>&nbsp;&nbsp;
                                <a class="dislike_count dislike" title="0个踩" content_id="1589189" type="1201" href="javascript:void(0)" rel="nofollow"><i class="fa fa-thumbs-down"></i><span id="dislike_count_1589189"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="data clear">
                        <div class="data_title">
                            <span><a class="name" href="/user/4132777890383872.htm">gshbjisjna</a>&nbsp;<span title="1级,距离下次升级还差7贡献值" class="lv_sub">LV1</span></span>
                            <span class="time pull-right">5分钟前</span>
                        </div>
                        <div class="content">
                            转冷了啊
                            <div class="comments_count">
                                <a title="0个评论" target="_blank" href="/mood/1589188/comment.htm" rel="nofollow"><i class="fa fa-comment"></i></a>&nbsp;&nbsp;
                                <a class="like_count like" title="0个赞" content_id="1589188" type="1101" href="javascript:void(0)" rel="nofollow"><i class="fa fa-thumbs-up"></i><span id="like_count_1589188"></span></a>&nbsp;&nbsp;
                                <a class="dislike_count dislike" title="0个踩" content_id="1589188" type="1201" href="javascript:void(0)" rel="nofollow"><i class="fa fa-thumbs-down"></i><span id="dislike_count_1589188"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="data clear">
                        <div class="data_title">
                            <span><a class="name" href="/user/4132777890383872.htm">gshbjisjna</a>&nbsp;<span title="1级,距离下次升级还差7贡献值" class="lv_sub">LV1</span></span>
                            <span class="time pull-right">5分钟前</span>
                        </div>
                        <div class="content">
                            大三真累
                            <div class="comments_count">
                                <a title="0个评论" target="_blank" href="/mood/1589187/comment.htm" rel="nofollow"><i class="fa fa-comment"></i></a>&nbsp;&nbsp;
                                <a class="like_count like" title="0个赞" content_id="1589187" type="1101" href="javascript:void(0)" rel="nofollow"><i class="fa fa-thumbs-up"></i><span id="like_count_1589187"></span></a>&nbsp;&nbsp;
                                <a class="dislike_count dislike" title="0个踩" content_id="1589187" type="1201" href="javascript:void(0)" rel="nofollow"><i class="fa fa-thumbs-down"></i><span id="dislike_count_1589187"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="data clear">
                        <div class="data_title">
                            <span><a class="name" href="/user/3832148521945088.htm">wwl2473578281</a>&nbsp;<span title="3级,距离下次升级还差1贡献值" class="lv_sub">LV3</span></span>
                            <span class="time pull-right">7分钟前</span>
                        </div>
                        <div class="content">
                            下雨还加班
                            <div class="comments_count">
                                <a title="0个评论" target="_blank" href="/mood/1589181/comment.htm" rel="nofollow"><i class="fa fa-comment"></i></a>&nbsp;&nbsp;
                                <a class="like_count like" title="0个赞" content_id="1589181" type="1101" href="javascript:void(0)" rel="nofollow"><i class="fa fa-thumbs-up"></i><span id="like_count_1589181"></span></a>&nbsp;&nbsp;
                                <a class="dislike_count dislike" title="0个踩" content_id="1589181" type="1201" href="javascript:void(0)" rel="nofollow"><i class="fa fa-thumbs-down"></i><span id="dislike_count_1589181"></span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="data_list margin_top10">
                <div class="data_list_title">
                    <img src="http://static.zuidaima.com/resource/img/cattle_ico.png" alt="最代码牛币排行用户列表" />最牛用户
                    <span class="more"><a href="/user/rank_niubi.htm" rel="nofollow">更多</a></span>
                </div>
                <div class="datas margin_top10">
                    <div class="datas">
                        <div class="data row">
                            <div class="col-3">
                                <a href="/user/1550463811307520.htm"><img src="http://static.zuidaima.com//uploads/1/201703/20170312181519534.png" alt="最代码官方的gravatar头像" class="rounded-circle user_header_48X48" /></a>
                            </div>
                            <div class="col-9">
                                <div>
                                    <span><a class="name" href="/user/1550463811307520.htm">最代码官方</a>&nbsp;<span title="138级,距离下次升级还差273贡献值" class="lv_sub">LV138</span></span>
                                </div>
                                <div>
                                    <span class="code"><a href="/faq.htm#rank_rule" target="_blank" rel="nofollow" title="贡献值19323,距离下次升级还差273贡献值"><img src="http://static.zuidaima.com/resource/img/lv_crown.png" alt="皇冠" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_crown.png" alt="皇冠" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_moon.png" alt="月亮" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_moon.png" alt="月亮" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_star.png" alt="星星" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_star.png" alt="星星" class="lv" /></a></span>
                                </div>
                            </div>
                        </div>
                        <div class="data row">
                            <div class="col-3">
                                <a href="/user/3461383252740096.htm"><img src="http://static.zuidaima.com//resource/img/default_avatar.png" alt="chen888的gravatar头像" class="rounded-circle user_header_48X48" /></a>
                            </div>
                            <div class="col-9">
                                <div>
                                    <span><a class="name" href="/user/3461383252740096.htm">chen888</a>&nbsp;<span title="18级,距离下次升级还差25贡献值" class="lv_sub">LV18</span></span>
                                </div>
                                <div>
                                    <span class="code"><a href="/faq.htm#rank_rule" target="_blank" rel="nofollow" title="贡献值371,距离下次升级还差25贡献值"><img src="http://static.zuidaima.com/resource/img/lv_sun.png" alt="太阳" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_star.png" alt="星星" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_star.png" alt="星星" class="lv" /></a></span>
                                </div>
                            </div>
                        </div>
                        <div class="data row">
                            <div class="col-3">
                                <a href="/user/1550463811307674.htm"><img src="http://static.zuidaima.com//uploads/666/201408/20140811162823912.jpg" alt="骑着猪猪去逛街的gravatar头像" class="rounded-circle user_header_48X48" /></a>
                            </div>
                            <div class="col-9">
                                <div>
                                    <span><a class="name" href="/user/1550463811307674.htm">骑着猪猪去逛街</a>&nbsp;<span title="32级,距离下次升级还差62贡献值" class="lv_sub">LV32</span></span>
                                </div>
                                <div>
                                    <span class="code"><a href="/faq.htm#rank_rule" target="_blank" rel="nofollow" title="贡献值1090,距离下次升级还差62贡献值"><img src="http://static.zuidaima.com/resource/img/lv_sun.png" alt="太阳" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_sun.png" alt="太阳" class="lv" /></a></span>
                                </div>
                            </div>
                        </div>
                        <div class="data row">
                            <div class="col-3">
                                <a href="/user/1550463813109760.htm"><img src="http://static.zuidaima.com//uploads/11829/201709/20170925201749154.jpg" alt="最代码伊成的gravatar头像" class="rounded-circle user_header_48X48" /></a>
                            </div>
                            <div class="col-9">
                                <div>
                                    <span><a class="name" href="/user/1550463813109760.htm">最代码伊成</a>&nbsp;<span title="31级,距离下次升级还差45贡献值" class="lv_sub">LV31</span></span>
                                </div>
                                <div>
                                    <span class="code"><a href="/faq.htm#rank_rule" target="_blank" rel="nofollow" title="贡献值1040,距离下次升级还差45贡献值"><img src="http://static.zuidaima.com/resource/img/lv_sun.png" alt="太阳" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_moon.png" alt="月亮" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_moon.png" alt="月亮" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_moon.png" alt="月亮" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_star.png" alt="星星" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_star.png" alt="星星" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_star.png" alt="星星" class="lv" /></a></span>
                                </div>
                            </div>
                        </div>
                        <div class="data row">
                            <div class="col-3">
                                <a href="/user/2176279510861824.htm"><img src="http://static.zuidaima.com//uploads/45896/201706/20170628170953719.png" alt="wangautis的gravatar头像" class="rounded-circle user_header_48X48" /></a>
                            </div>
                            <div class="col-9">
                                <div>
                                    <span><a class="name" href="/user/2176279510861824.htm">wangautis</a>&nbsp;<span title="25级,距离下次升级还差27贡献值" class="lv_sub">LV25</span></span>
                                </div>
                                <div>
                                    <span class="code"><a href="/faq.htm#rank_rule" target="_blank" rel="nofollow" title="贡献值698,距离下次升级还差27贡献值"><img src="http://static.zuidaima.com/resource/img/lv_sun.png" alt="太阳" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_moon.png" alt="月亮" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_moon.png" alt="月亮" class="lv" /><img src="http://static.zuidaima.com/resource/img/lv_star.png" alt="星星" class="lv" /></a></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<ul class="pagination justify-content-center margin_top10">
    <li class="page-item active"><a class="page-link" href="javascript:jump(this)">1</a></li>
    <li class="page-item"><a class="page-link" value="23" href="javascript:jump(this)">2</a></li>
    <li class="page-item"><a class="page-link" href="javascript:jump(this)">3</a></li>
    <li class="page-item"><a class="page-link" href="javascript:jump(this)">4</a></li>
    <li class="page-item"><a class="page-link" href="javascript:jump(this)">5</a></li>
    <li class="page-item"><a class="page-link" href="javascript:jump(this)">6</a></li>
    <li class="page-item"><a class="page-link" href="javascript:jump(this)">7</a></li>
    <li class="page-item"><a class="page-link" href="javascript:jump(this)">8</a></li>
    <li class="page-item"><a class="page-link" href="javascript:jump(this)">9</a></li>
    <li class="page-item"><a class="page-link" href="javascript:jump(this)">10</a></li>
    <li class="page-item"><a class="page-link" href="javascript:jump(this)">11</a></li>
    <span>...</span>
    <li class="page-item"><a href="javascript:jump()" class="page-link">91</a></li>
    <li class="page-item"><a class="page-link" href="javascript:jump(this)">下一页</a></li>
</ul>
<script>var nav="#nav_question";</script>
</div>
<div id="floatPanel">
    <div class="ctrolPanel">
        <a class="arrow" href="#"><span>顶部</span></a>
        <a rel="nofollow" class="contact" href="/user/message.htm?uuid=1550463811307520" target="_blank"><span>客服</span></a>
        <a class="qrcode" href="#"><span>微信二维码</span></a>
        <a class="arrow" href="#"><span>底部</span></a>
    </div>
    <div class="popPanel" style="">
        <div class="popPanel-inner">
            <div class="qrcodePanel">
                <img src="http://static.zuidaima.com/resource/img/weixin.jpg" alt="&gt;扫描二维码关注最代码为好友" />
                <span>扫描二维码关注最代码为好友</span>
            </div>
            <div class="arrowPanel">
                <div class="arrow01"></div>
                <div class="arrow02"></div>
            </div>
        </div>
    </div>
</div>
<div id="ajax-modal" class="modal fade" style="display: none;"></div>
<script src="http://static.zuidaima.cn/static/v201806/js/bootstrap.min.js"></script>
<script src="http://static.zuidaima.cn/static/v201806/js/mustache.js"></script>
<script src="http://static.zuidaima.cn/static/v201806/js/syntaxhighlighter2/shBrushs-min.js"></script>
<script src="http://static.zuidaima.cn/static/v201806/js/jquery.lazyload.js"></script>
<script src="http://static.zuidaima.cn/static/v201806/js/jquery.gifplayer.js"></script>
<script async="" src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<script>var uri=window.location.pathname+window.location.search;    var redirect_url="";    if(uri.indexOf("redirect_url")==-1){        redirect_url="?redirect_url="+encodeURIComponent(uri);    }else{        redirect_url=window.location.search;    }    function login(){        window.location='/user/login.htm'+redirect_url;    }    function create(){        window.location='/user/create.htm'+redirect_url;    }    function logout(){        window.location='/user/logout.htm'+redirect_url;    }    $(function() {        $("img.lazy").lazyload();        SyntaxHighlighter.all();        Zuidaima.initizal();        $('.gifs').gifplayer();            setInterval("remind(4131429919803392,309794)",30000);    });</script>
<div class="footer margin_top10">
    <div class="container">
        <div>
            <a href="/help.htm" rel="nofollow">帮助</a>
            <span>|</span>
            <a href="/contact.htm" rel="nofollow">联系我</a>
            <span>|</span>
            <a href="/partner.htm">友情链接</a>
            <span>|</span>
            <a href="/sitemap.xml" target="_blank">网站地图</a>
            <span>|</span>
            <a href="/share/rss.htm" target="_blank">RSS订阅分享源代码</a>
            <span>|</span>
            <a href="/question/rss.htm" target="_blank">RSS订阅问答</a>
            <span>|</span>
            <a href="/share.htm">最新分享源代码</a>
            <span>|</span>
            <a href="/question.htm">最新问答</a>
            <span>|</span>
            <!--            <a rel="nofollow" target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=727c073145e93bd3ca3f3cf26fb0da62b6c92376bf4dafbb03accc738c1d017e"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="最代码官方群1" title="最代码官方群1"></a>-->
            <a rel="nofollow" target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=d3ef6d04eaad4a3ca96a76511b63e64914965b7d88fb05c3be81ce9d670b20e4"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="最代码官方群9" title="最代码官方群9" /></a>
            <a rel="nofollow" target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=97f0cf2b725ec7f018bcbe3c9f4fcb807ea7efc93d4de77d91f55046d7741d9b"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="最代码官方群10" title="最代码官方群10" /></a>
            <span class="pull-right">京ICP备12032064号</span>
        </div>
    </div>
</div>
<script>var _hmt = _hmt || [];    (function() {        var hm = document.createElement("script");        hm.src = "//hm.baidu.com/hm.js?500f123d596f6dae47e36a9a36fed240";        var s = document.getElementsByTagName("script")[0];        s.parentNode.insertBefore(hm, s);    })();</script>
<iframe id="google_osd_static_frame_6632108024480" name="google_osd_static_frame" style="display: none; width: 0px; height: 0px;"></iframe>
</body>
<script type="text/javascript">
    //搜索
    function sercher(){
        var tname = $("#search").val();
        $.ajax({
            url:'../problem/queryLicke',
            data:{tname:search},
            type:'post',
            dataType:'json',
            success:function(data){
                Loadpage();
            }
        })
    }
    //数据加载搜索
    function Loadpage(m) {

    }
    //退出登录:
    function Signout() {
        $.ajax({
            url:'../problem/user',
            type:'post',
            success:function (data) {
            }
        })
    }
    //去首页
    function toMain() {
      location.href="<%=request.getContextPath()%>/problem/toMain"
    }

    //分页
    function jump(obj) {
        var pageSize = obj.href;
        alert(pageSize)
    }
</script>
</html>
<%--
  Created by IntelliJ IDEA.
  User: 范靖康
  Date: 2018/11/8
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="最代码 www.zuidaima.com 最全面,最专业的源代码分享网站,近万名用户分享超过数万份高质量的java/jquery/bootstrap/html/css源代码" />
    <title>发表博客-最代码</title>
    <meta name="keywords" content="代码,代码分享,代码例子,源码,java代码，javascript代码,最代码,程序" />
    <link href="http://www.zuidaima.com/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="http://static.zuidaima.cn/static/v201806/js/syntaxhighlighter2/shCore-min.css"  type="text/css" rel="stylesheet"/>
    <link href="http://static.zuidaima.cn/static/v201806/css/bootstrap.min.css" rel="stylesheet" />
    <link href="http://static.zuidaima.cn/static/v201806/css/font-awesome.min.css"  rel="stylesheet" >
    <link href="http://static.zuidaima.com/static/v201806/css/zuidaima.css" rel="stylesheet" />
    <script src="http://static.zuidaima.cn/static/v201806/js/ckeditor/ckeditor.js"></script>
    <script src="http://static.zuidaima.cn/static/v201806/js/jquery.1.10.2.min.js"></script>
    <script src="http://static.zuidaima.com/static/v201806/js/zuidaima.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
</head>
<body>
<div class="header">
    <div class="navbar navbar-expand-md navbar-dark navbar-fixed-top fixed-top">
        <div class="container">
            <a href="/" title="最代码网站"><img src="http://static.zuidaima.com/resource/img/logo.png" alt="最代码网站"></a>
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
                        <a id="nav_blog" class="nav-link" href="/blog.htm">博客</a>
                    </li>
                    <li class="nav-item">
                        <a id="nav_activity" class="nav-link" href="/activity.htm">活动</a>
                    </li>
                    <li class="nav-item">
                        <a id="nav_event" class="nav-link" href="/event.htm">动态</a>
                    </li>
                    <li id="nav_buy" class="nav-item"><a class="nav-link" href='javascript:void(0)' style="color:#FFFF00" rel="nofollow" title="购买牛币">购买</a></li>
                    <li class="nav-item">
                        <div id="search_box">
                            <input type="text" id="search" placeholder="搜索您要的代码" value="搜索您要的代码"/>
                            <i class="icon-search fa fa-search"></i>
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
                            <a class="dropdown-item" href="/user/message.htm"><i class="fa fa-envelope"></i>我的私信<span class="remind_count" id="remind_count_0" style="display:none">0</span></a>
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
                            <a class="dropdown-item" href="/user/withdraw.htm"><i class="fa fa-home"></i>我的后台</a>
                            <a class="dropdown-item" href="/user/update.htm"><i class="fa fa-cog"></i>设置资料</a>
                            <a class="dropdown-item" href="/user/logout.htm"><i class="fa fa-power-off"></i>退出系统</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>


<div class="main container margin_top10 width_998">
    <div class="row project">
        <div class="col-9 left_bar">
            <div class="data_list">
                <div class="data_list_title">发表博客</div>
                <div class="margin_top10">
                    <span class="error"></span>
                </div>
                <div class="margin_top10">
                    <form id="blog" class="project" action="../CodeController/addblog" enctype="multipart/form-data" method="post">
                        <div class="input_item_title">
                            <span class="must_input">*</span>
                            预扣牛币数1(胡乱提交不返回，审核通过返回，防止垃圾博客)
                        </div>
                        <input id="niubi" name="niubi" class="col-12" type="text" value="-1" disabled="disabled"/>
                        <div class="input_item_title">
                            <span class="must_input">*</span>标题</div>
                        <input id="blog_title" name="blog_title" class="col-12" type="text"  />
                        <div class="input_item_title margin_top10">
                            <span class="must_input">*</span>描述</div>
                        <textarea name="blog_content" id="editor" rows="20" class="col-12">

                        </textarea>

                        <br clear="all"/><script>
                        CKEDITOR.replace('editor',{
                            customConfig : 'config.js',
                            extraPlugins: 'colorbutton,font,smiley,flash,syntaxhighlight',
                            toolbar: [
                                [ 'Link', 'Unlink'],
                                ['Bold', 'Italic','Strike','RemoveFormat'],
                                ['NumberedList', 'BulletedList','Blockquote'],
                                ['FontSize', 'TextColor', 'BGColor'],
                                ['Image','Flash', 'Smiley'],
                                ['Table'],
                                ['Syntaxhighlight'],
                                ['Source'],
                                ['Maximize']
                            ]
                        });
                    </script>
                        <div class="post_project">
                         <input type="submit" value="发表">
                         <%-- <a href="javascript:addblog()" id="create_submit">发表</a>--%>
                        </div>
                        <br clear="all"/>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-3 right_bar">
            <div class="data_list">
                <div class="data_list_title">
                    <img src="http://static.zuidaima.com/resource/img/heart_ico.png"/>推荐心情
                </div>
                <div class="margin_top10">
                    成功源于积累，请做好每天的积累
                </div>
            </div>
            <div class="data_list margin_top10">
                <div class="data_list_title">
                    <img src="http://static.zuidaima.com/resource/img/heart_ico.png"/>博客说明
                </div>
                <div class="margin_top10">
                    <ul>
                        <li class="alert alert-info">关于技术，工作的博客文章都可以提交</li>
                        <li class="alert alert-info">转载的博客不通过</li>
                        <li class="alert alert-info">非技术博客不通过</li>
                        <li class="alert alert-info">博客内容200字以内的不通过</li>
                        <li class="alert alert-info">博客内容请严格保证格式美观，比如代码，图片，文字</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>



<script >

   function  addblog() {

       /!* var s=;*!/
       var s=$('#editor').val();
        alert(s)
        $.ajax({
            url:"/CodeController/addblog",
            type:"post",
            data:$('#blog').serialize(),
            success:function(){

            }
        });
    }
</script>
</body>
</html>


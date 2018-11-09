<%--
  Created by IntelliJ IDEA.
  User: 范靖康
  Date: 2018/11/8
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<div class="text-center">
    <!-- 718 -->
    <ins class="adsbygoogle my_adslot"
         style="display:inline-block"
         data-ad-client="ca-pub-2303958443489176"
         data-ad-slot="2718318847"></ins>
   <%-- <script>
        (adsbygoogle = window.adsbygoogle || []).push({});
    </script>--%>
</div>
<div class="main container margin_top10 width_998">
    <div class="row project">
        <div class="col-9 left_bar">
            <div class="data_list">
                <div class="data_list_title">分享代码</div>
                <div class="margin_top10">
                    <span class="error"></span>
                </div>
                <div class="margin_top10">
                    <form id="share" class="project" method="post" enctype="multipart/form-data">
                        <div class="input_item_title"><span class="must_input">*</span>预扣牛币数1(胡乱分享不返回，审核通过返回，防止垃圾分享)</div>
                        <input id="niubi" name="niubi" class="col-12" type="text" value="-1" disabled="disabled"/>
                        <div class="input_item_title"><span class="must_input">*</span>标题</div>
                        <input id="code_title" name="code_title" class="col-12" type="text" value="" />
                        <div class="input_item_title margin_top10">
                            <span class="must_input">*</span>描述</div>
                        <textarea name="code_content" id="editor" rows="20" class="col-12">

						</textarea>
                        <script>
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
                        <div class="input_item_title margin_top10">
                            <span class="must_input">*</span>
                            话题(请选择下面的话题，只能选一个)
                        </div>
                        <input id="topics" name="topics" value="" class="topics col-12" readonly="readonly"/>
                        <div>
                            <div class="margin_top5 margin_bottom10">编程语言基础</div>
                            <div class="datas row">
                                <a class="topic col-3">设计模式</a>
                                <a class="topic col-3">加密混淆</a>
                                <a class="topic col-3">网络编程</a>
                                <a class="topic col-3">语法算法</a>
                            </div>
                            <div class="datas row">
                            </div>
                            <div class="margin_top5 margin_bottom10">Web开发</div>
                            <div class="datas row">
                                <a class="topic col-3">web网站开发</a>
                                <a class="topic col-3">前端技术</a>
                            </div>
                            <div class="margin_top5 margin_bottom10">数据库开发</div>
                            <div class="datas row">
                                <a class="topic col-3">Nosql数据库</a>
                                <a class="topic col-3">关系型数据库</a>
                            </div>
                            <div class="margin_top5 margin_bottom10">客户端开发</div>
                            <div class="datas row">
                                <a class="topic col-3">手机客户端开发</a>
                                <a class="topic col-3">桌面客户端开发</a>
                            </div>
                            <div class="margin_top5 margin_bottom10">脚本工具</div>
                            <div class="datas row">
                                <a class="topic col-3">日期时间操作</a>
                                <a class="topic col-3">字节字符串操作</a>
                                <a class="topic col-3">文本解析和文件处理</a>
                            </div>
                            <div class="margin_top5 margin_bottom10">游戏开发</div>
                            <div class="datas row">
                                <a class="topic col-3">服务端游戏开发</a>
                                <a class="topic col-3">客户端游戏</a>
                                <a class="topic col-3">网络游戏</a>
                                <a class="topic col-3">网页游戏</a>
                            </div>
                            <div class="datas row">
                            </div>
                            <div class="margin_top5 margin_bottom10">服务器软硬件</div>
                            <div class="datas row">
                                <a class="topic col-3">操作系统</a>
                                <a class="topic col-3">Web服务器</a>
                            </div>
                            <div class="margin_top5 margin_bottom10">开源组件类库</div>
                            <div class="datas row">
                                <a class="topic col-3">CRM系统</a>
                                <a class="topic col-3">持久层框架</a>
                                <a class="topic col-3">邮件开发</a>
                                <a class="topic col-3">图片处理</a>
                            </div>
                            <div class="datas row">
                                <a class="topic col-3">音视频处理</a>
                                <a class="topic col-3">cms系统</a>
                                <a class="topic col-3">博客系统</a>
                                <a class="topic col-3">项目管理</a>
                            </div>
                            <div class="datas row">
                                <a class="topic col-3">单元测试</a>
                                <a class="topic col-3">模板引擎</a>
                                <a class="topic col-3">报表制作</a>
                                <a class="topic col-3">工作流引擎</a>
                            </div>
                            <div class="datas row">
                                <a class="topic col-3">日志工具</a>
                                <a class="topic col-3">搜索爬虫</a>
                                <a class="topic col-3">缓存系统</a>
                                <a class="topic col-3">消息系统</a>
                            </div>
                            <div class="datas row">
                                <a class="topic col-3">任务调度</a>
                            </div>
                        </div>
                        <div class="upload margin_top10 input_item_title">
                            代码(只支持java,zip文件,非必须)
                        </div>
                        <div class="upload margin_top10 input_item_title select_file col">
                            <input id="file" name="file" type="file" type="text" value="" size="20" />
                            <a href="javascript:void(0)">选择源码</a>
                        </div>
                        <br clear="all"/>
                        <div class="margin_top10">
                            <span class="select_file_name"></span>
                        </div>
                        <br clear="all"/>
                        <div class="post_project">
                            <a href="javascript:void(0)" id="create_submit">发表</a>
                        </div>
                        <br clear="all"/>
                    </form>
                </div>
            </div>
        </div>
        <div class="col-3 right_bar">
            <div class="data_list">
                <div class="data_list_title">
                    <img src="http://static.zuidaima.com/resource/img/heart_ico.png" alt="牛币规则和分享说明"/>牛币规则和分享说明
                </div>
                <div class="margin_top10">
                    <ul>
                        <li class="alert alert-info">*统一由官方设置牛币,设置后不可更改</li>
                        <li class="alert alert-info">代码上传后不可要求删除,有版权纠纷的例外</li>
                        <li class="alert alert-info">代码审核通过后不可编辑，如有需要请加QQ1784400527,并注明最代码代码编辑</li>
                        <li class="alert alert-info">如何上传图片</li>
                        <li>
                            <a target="_blank" href="http://static.zuidaima.com//resource/img/how_to_upload_image.gif" title="如何上传图片"><img src="http://static.zuidaima.com//resource/img/how_to_upload_image.gif" alt="如何上传图片" ></a>
                        </li>
                        <li class="alert alert-info">*必须有项目截图，否则不予通过,有则+1牛币</li>
                        <li class="alert alert-info">*尽量提供运行截图，否则不予通过,有则+1到3牛币</li>
                        <li class="alert alert-info">*如果是原创则+2到5牛币</li>
                        <li class="alert alert-info">*如果是转载则+1牛币</li>
                        <li class="alert alert-info">*如果是高质量则+1到10牛币</li>
                        <li class="alert alert-info">*丰富的描述则+1到10牛币(用到的技术框架，使用心得，注意事项等)</li>
                        <li class="alert alert-error">*jar包和sql文件如果需要必须提供，否则不予通过</li>
                        <li>代码只支持单个的java文件，多个文件的zip压缩包</li>
                        <li>代码上传时去掉执行文件目录的多余文件，如java project中的bin目录下的文件，java web project中的classes下的文件</li>
                        <li>代码文件大小必须小于20M以内</li>
                        <li>代码尽量以maven工程来组织,如果不会用maven工程，则在代码描述中描述jar包也可以，提供jar包百度网盘下载地址也可以</li>
                        <li>maven依赖包查找地址<a target="_blank" href="http://mvnrepository.com/">http://mvnrepository.com/</a></li>
                        <li>jar包查找地址<a target="_blank" href="http://www.findjar.com">http://www.findjar.com</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script>
        //绑定beforeunload事件
        $(window).bind('beforeunload',function(){
            return '您输入的内容尚未保存，确定离开此页面吗？';
        });
    </script>
</div>
<div id="floatPanel">
    <div class="ctrolPanel">
        <a class="arrow" href="#"><span>顶部</span></a>
        <a rel="nofollow" class="contact" href="/user/message.htm?uuid=1550463811307520" target="_blank"><span>客服</span></a>
        <a class="qrcode" href="#"><span>微信二维码</span></a>
        <a class="arrow" href="#"><span>底部</span></a>
    </div>
    <div class="popPanel">
        <div class="popPanel-inner">
            <div class="qrcodePanel"><img src="http://static.zuidaima.com/resource/img/weixin.jpg" alt=">扫描二维码关注最代码为好友"/><span>扫描二维码关注最代码为好友</span></div>
            <div class="arrowPanel">
                <div class="arrow01"></div>
                <div class="arrow02"></div>
            </div>
        </div>
    </div>
</div>
<div id="ajax-modal" class="modal fade" style="display: none;"></div>

<script>
    var uri=window.location.pathname+window.location.search;
    var redirect_url="";
    if(uri.indexOf("redirect_url")==-1){
        redirect_url="?redirect_url="+encodeURIComponent(uri);
    }else{
        redirect_url=window.location.search;
    }
    function login(){
        window.location='/user/login.htm'+redirect_url;
    }
    function create(){
        window.location='/user/create.htm'+redirect_url;
    }
    function logout(){
        window.location='/user/logout.htm'+redirect_url;
    }

    $(function() {
        $("img.lazy").lazyload();
        SyntaxHighlighter.all();
        Zuidaima.initizal();
        $('.gifs').gifplayer();
        setInterval("remind(4141933609060352,311443)",30000);
    });
</script>
<div class="footer margin_top10">
    <div class="container">
        <div>
            <a href="/help.htm" rel="nofollow">帮助</a><span>|</span><a href="/contact.htm" rel="nofollow">联系我</a><span>|</span><a href="/partner.htm">友情链接</a><span>|</span><a href="/sitemap.xml" target="_blank">网站地图</a><span>|</span><a href="/share/rss.htm" target="_blank">RSS订阅分享源代码</a><span>|</span><a href="/question/rss.htm" target="_blank">RSS订阅问答</a><span>|</span><a href="/share.htm">最新分享源代码</a><span>|</span><a href="/question.htm">最新问答</a><span>|</span>
            <!--
            <a rel="nofollow" target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=727c073145e93bd3ca3f3cf26fb0da62b6c92376bf4dafbb03accc738c1d017e"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="最代码官方群1" title="最代码官方群1"></a>
            -->
            <a rel="nofollow" target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=d3ef6d04eaad4a3ca96a76511b63e64914965b7d88fb05c3be81ce9d670b20e4"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="最代码官方群9" title="最代码官方群9"></a>
            <a rel="nofollow" target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=97f0cf2b725ec7f018bcbe3c9f4fcb807ea7efc93d4de77d91f55046d7741d9b"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="最代码官方群10" title="最代码官方群10"></a>
            <span class="pull-right">京ICP备12032064号</span>
        </div>
    </div>
</div>
<%--<script>
  var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?500f123d596f6dae47e36a9a36fed240";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>--%>
</body>
</html>


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
                <a href="http://www.zuidaima.com/share.htm">代码</a>
                <b>&gt;</b>
                <a href="http://www.zuidaima.com/share/4136740921494528.htm">${list.code_title}</a>
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
                                <img content_id="3783358206609408_" alt="" class="profile rounded-circle" src="${list.userFile}" /></a>
                        </div>
                        <div class="col-11">
                            <div class="data_title">
                                <span><a class="name" href="http://www.zuidaima.com/user/3783358206609408.htm">${list.userName}</a></span>
                                <span class="time pull-right">${list.code_Release_date}</span>
                            </div>
                            <div class="margin_top5 title_normal">
                                <span title="最代码官方认证分享代码" class="validated">证</span>
                                <h1>${list.code_title}</h1>
                            </div>
                            <div class="content_detail margin_top5" id="content_detail_1" style="display: block;">
                                 ${list.code_content}
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

                                    <a href="javascript:void(0)">${list.comment}个评论</a>
                                </span>
                                <span class="niubi">
                                    <a>${list.code_nb}个牛币</a>
                                </span>
                                <span class="niubi">

                                        <c:set value="${fn:split(list.keyword_name, ',') }" var="names" />
                                           <c:forEach items="${names}" var="labelsName">
                                             <a class="post_tag" href="http://www.zuidaima.com/share/kcss3-p1-s1.htm">
                                                     ${labelsName}
                                             </a>
                                           </c:forEach>

                                    </span>
                                <span class="pull-right">
                                    <a class="post_topic" href="http://www.zuidaima.com/share_topic/k%E8%AE%BE%E8%AE%A1%E6%A8%A1%E5%BC%8F-p1-s1.htm">${list.tName}</a></span>
                            </div>
                            <div id="comments_list_14380" style="display: none;" class="comments col-12">
                                <div id="comments_content_14380"></div>
                                <div class="margin_top5 data_ops clear">
                                    <div class="alert" style="text-align: center;">
                                        请下载代码后再发表评论
                                    </div>
                                </div>
                                <br clear="all" />
                            </div>
                            <div class="data_list margin_top10">
                                <div class="datas margin_top10">
                                    <div class="file margin_top10">
                                        <span class="file_info">文件名:进销存项目.zip,文件大小:1738.848K</span>
                                        <span class="file_ops">
                                            <a class="download" href="javascript:void(0)" content_id="13683" niubi="3">下载</a>
                                        </span>
                                        <div class="file_tree">
                                            <ul class="jqueryFileTree">
                                                <li class="directory">/
                                                    <ul class="jqueryFileTree">
                                                        <ul class="jqueryFileTree">
                                                            <li class="directory">/进销存项目
                                                                <ul class="jqueryFileTree">
                                                                    <li class="unknown">/进销存项目/java超市进销存管理系统论文.doc</li>
                                                                    <li class="unknown">/进销存项目/njue.sql</li>
                                                                    <ul class="jqueryFileTree">
                                                                        <li class="directory">/进销存项目/project
                                                                            <ul class="jqueryFileTree">
                                                                                <li class="unknown">/进销存项目/project/.classpath</li>
                                                                                <li class="unknown">/进销存项目/project/.fatjar</li>
                                                                                <ul class="jqueryFileTree">
                                                                                    <li class="directory">/进销存项目/project/.myeclipse
                                                                                        <ul class="jqueryFileTree">
                                                                                            <ul class="jqueryFileTree">
                                                                                                <li class="directory">/进销存项目/project/.myeclipse/profiler
                                                                                                    <ul class="jqueryFileTree">
                                                                                                        <li class="xml">/进销存项目/project/.myeclipse/profiler/DocsConnectionPropsHelper.xml</li>
                                                                                                        <li class="xml">/进销存项目/project/.myeclipse/profiler/MIS.xml</li>
                                                                                                    </ul></li>
                                                                                            </ul>
                                                                                        </ul></li>
                                                                                </ul>
                                                                                <ul class="jqueryFileTree">
                                                                                    <li class="directory">/进销存项目/project/src
                                                                                        <ul class="jqueryFileTree">
                                                                                            <ul class="jqueryFileTree">
                                                                                                <li class="directory">/进销存项目/project/src/com
                                                                                                    <ul class="jqueryFileTree">
                                                                                                        <ul class="jqueryFileTree">
                                                                                                            <li class="directory">/进销存项目/project/src/com/njue
                                                                                                                <ul class="jqueryFileTree">
                                                                                                                    <ul class="jqueryFileTree">
                                                                                                                        <li class="directory">/进销存项目/project/src/com/njue/mis
                                                                                                                            <ul class="jqueryFileTree">
                                                                                                                                <ul class="jqueryFileTree">
                                                                                                                                    <li class="directory">/进销存项目/project/src/com/njue/mis/common
                                                                                                                                        <ul class="jqueryFileTree">
                                                                                                                                            <li class="java"><h4><a href="http://www.zuidaima.com/code/file/4136740921492480.htm?dir=/%E8%BF%9B%E9%94%80%E5%AD%98%E9%A1%B9%E7%9B%AE/project/src/com/njue/mis/common/CommonFactory.java">/进销存项目/project/src/com/njue/mis/common/CommonFactory.java</a></h4></li>
                                                                                                                                            <li class="java"><h4><a href="http://www.zuidaima.com/code/file/4136740921492480.htm?dir=/%E8%BF%9B%E9%94%80%E5%AD%98%E9%A1%B9%E7%9B%AE/project/src/com/njue/mis/common/Constants.java">/进销存项目/project/src/com/njue/mis/common/Constants.java</a></h4></li>
                                                                                                                                            <li class="java"><h4><a href="http://www.zuidaima.com/code/file/4136740921492480.htm?dir=/%E8%BF%9B%E9%94%80%E5%AD%98%E9%A1%B9%E7%9B%AE/project/src/com/njue/mis/common/ErrorManager.java">/进销存项目/project/src/com/njue/mis/common/ErrorManager.java</a></h4></li>
                                                                                                                                            <li class="java"><h4><a href="http://www.zuidaima.com/code/file/4136740921492480.htm?dir=/%E8%BF%9B%E9%94%80%E5%AD%98%E9%A1%B9%E7%9B%AE/project/src/com/njue/mis/common/ValidationManager.java">/进销存项目/project/src/com/njue/mis/common/ValidationManager.java</a></h4></li>
                                                                                                                                        </ul></li>
                                                                                                                                </ul>
                                                                                                                                <ul class="jqueryFileTree">
                                                                                                                                    <li class="directory">/进销存项目/project/src/com/njue/mis/dao
                                                                                                                                        <ul class="jqueryFileTree">
                                                                                                                                            <li class="java"><h4><a href="http://www.zuidaima.com/code/file/4136740921492480.htm?dir=/%E8%BF%9B%E9%94%80%E5%AD%98%E9%A1%B9%E7%9B%AE/project/src/com/njue/mis/dao/CustomerDAO.java">/进销存项目/project/src/com/njue/mis/dao/CustomerDAO.java</a></h4></li>
                                                                                                                                        </ul></li>
                                                                                                                                </ul>
                                                                                                                            </ul></li>
                                                                                                                    </ul>
                                                                                                                </ul></li>
                                                                                                        </ul>
                                                                                                    </ul></li>
                                                                                            </ul>
                                                                                        </ul></li>
                                                                                </ul>
                                                                            </ul></li>
                                                                    </ul>
                                                                </ul></li>
                                                        </ul>
                                                    </ul></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <div class="data_list margin_top10">
                <ul class="nav nav-tabs">
                    <li class="nav-item"><a data-toggle="tab" class="nav-link active" href="#download">最热下载</a></li>
                    <li class="nav-item"><a data-toggle="tab" class="nav-link" href="#comment">最热评论</a></li>
                    <li class="nav-item"><a data-toggle="tab" class="nav-link" href="#create">最新分享</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane fade active show" id="download">
                        <div class="datas">
                            <ul class="project_list">
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><a target="_top" href="http://www.zuidaima.com/share/1695882735602688.htm" title="HTML5+jQuery制作温馨浪漫爱心表白动画特效">HTML5+jQuery制作温馨浪漫爱心表白动画特效</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="comment">
                        <div class="datas">
                            <ul class="project_list">
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><span title="最代码官方精品分享代码" class="perfect">精</span><a target="_top" href="http://www.zuidaima.com/share/1550463745526784.htm" title="java开源CMS管理系统jeetemp">java开源CMS管理系统jeetemp</a></li>
                                <li><a target="_top" href="http://www.zuidaima.com/share/1550463293672448.htm" title="java牛官方想开发一个全部开源的系统">java牛官方想开发一个全部开源的系统</a></li>
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><span title="最代码官方精品分享代码" class="perfect">精</span><a target="_top" href="http://www.zuidaima.com/share/1550463514102784.htm" title="企业人力资源管理项目SSH+EXTJS+MySQL整合开发">企业人力资源管理项目SSH+EXTJS+MySQL整合开发</a></li>
                                <li><span title="最代码官方精品分享代码" class="perfect">精</span><a target="_top" href="http://www.zuidaima.com/share/1642369360563200.htm" title="基于springMVC+springSecurity3.x+Mybaits3.x的权限系统,,开放源码,支持开源">基于springMVC+springSecurity3.x+Mybaits3.x的权限系统,,开放源码,支持开源</a></li>
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><span title="最代码官方精品分享代码" class="perfect">精</span><a target="_top" href="http://www.zuidaima.com/share/2043055109475328.htm" title="spring MVC+easyUI+mybatis开发网站后台管理系统源代码下载">spring MVC+easyUI+mybatis开发网站后台管理系统源代码下载</a></li>
                                <li><a target="_top" href="http://www.zuidaima.com/share/1550463575788544.htm" title="【猪猪-前端】基于HTML5 Bootstrap搭建的后台模板charisma，分页，模糊查询已经全部JS实现，无需编码，嵌入数据即可开发，内置8款皮肤，欧美风格，非常好用！">【猪猪-前端】基于HTML5 Bootstrap搭建的后台模板charisma，分页，模糊查询已经全部JS实现，无需编码，嵌入数据即可开发，内置8款皮肤，欧美风格，非常好用！</a></li>
                                <li><span title="最代码官方精品分享代码" class="perfect">精</span><a target="_top" href="http://www.zuidaima.com/share/1764524204903424.htm" title="Apache Shiro+SpringMVC+Hibernate Search+Hibernate+Bootstrap企业信息管理系统基础框架搭建整合实例代码教程">Apache Shiro+SpringMVC+Hibernate Search+Hibernate+Bootstrap企业信息管理系统基础框架搭建整合实例代码教程</a></li>
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><span title="最代码官方精品分享代码" class="perfect">精</span><a target="_top" href="http://www.zuidaima.com/share/2189303415360512.htm" title="springmvc+hibernate+jbpm开发OA自动化办公后台管理系统源码下载">springmvc+hibernate+jbpm开发OA自动化办公后台管理系统源码下载</a></li>
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><span title="最代码官方精品分享代码" class="perfect">精</span><a target="_top" href="http://www.zuidaima.com/share/1812685177441280.htm" title="struts2.3+hibernate4.1+spring3.2+EasyUI1.36整合实现的java后台管理系统">struts2.3+hibernate4.1+spring3.2+EasyUI1.36整合实现的java后台管理系统</a></li>
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><a target="_top" href="http://www.zuidaima.com/share/1695882735602688.htm" title="HTML5+jQuery制作温馨浪漫爱心表白动画特效">HTML5+jQuery制作温馨浪漫爱心表白动画特效</a></li>
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><span title="最代码官方精品分享代码" class="perfect">精</span><a target="_top" href="http://www.zuidaima.com/share/2637758627122176.htm" title="spring+spring mvc+mybatis+bootstrap框架整合搭建ssm完整项目">spring+spring mvc+mybatis+bootstrap框架整合搭建ssm完整项目</a></li>
                                <li><span title="最代码官方原创分享代码" class="orginal">原</span><span title="最代码官方认证分享代码" class="validated">证</span><span title="最代码官方精品分享代码" class="perfect">精</span><a target="_top" href="http://www.zuidaima.com/share/2944710175017984.htm" title="ssh框架开发的个人博客系统源码下载，基于mysql数据库">ssh框架开发的个人博客系统源码下载，基于mysql数据库</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="create">
                        <div class="datas">
                            <ul class="project_list">
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><a target="_top" href="http://www.zuidaima.com/share/4136740921494528.htm" title="java swing开发进销存管理系统">java swing开发进销存管理系统</a></li>
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><span title="最代码官方精品分享代码" class="perfect">精</span><a target="_top" href="http://www.zuidaima.com/share/4133591138749440.htm" title="ssm+bootstrap开发网上零食商城管理系统(前后端分离)">ssm+bootstrap开发网上零食商城管理系统(前后端分离)</a></li>
                                <li><span title="最代码官方原创分享代码" class="orginal">原</span><span title="最代码官方认证分享代码" class="validated">证</span><a target="_top" href="http://www.zuidaima.com/share/4132755597429760.htm" title="Spring Boot+Maven+Spring Data JPA+Layui整合实现增删改查及分页的多表查询项目实例">Spring Boot+Maven+Spring Data JPA+Layui整合实现增删改查及分页的多表查询项目实例</a></li>
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><a target="_top" href="http://www.zuidaima.com/share/4132180970507264.htm" title="HTML+CSS+JS实现的键盘导航特效源码">HTML+CSS+JS实现的键盘导航特效源码</a></li>
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><a target="_top" href="http://www.zuidaima.com/share/4128588870044672.htm" title="HTML5响应式第三方登录页面模板">HTML5响应式第三方登录页面模板</a></li>
                                <li><span title="最代码官方原创分享代码" class="orginal">原</span><span title="最代码官方认证分享代码" class="validated">证</span><a target="_top" href="http://www.zuidaima.com/share/4122308174433280.htm" title="Spring Boot+Maven+Spring Data JPA+apache Shiro整合实现用户权限认证授权">Spring Boot+Maven+Spring Data JPA+apache Shiro整合实现用户权限认证授权</a></li>
                                <li><a target="_top" href="http://www.zuidaima.com/share/4122202879282176.htm" title="layui后台用户登录界面特效">layui后台用户登录界面特效</a></li>
                                <li><span title="最代码官方原创分享代码" class="orginal">原</span><a target="_top" href="http://www.zuidaima.com/share/4121548952833024.htm" title="基于Java Swing 的GUI用户投票系统">基于Java Swing 的GUI用户投票系统</a></li>
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><a target="_top" href="http://www.zuidaima.com/share/4121434880510976.htm" title="HTML5动态用户登录界面模板">HTML5动态用户登录界面模板</a></li>
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><a target="_top" href="http://www.zuidaima.com/share/4120692584811520.htm" title="H5抽签网页小游戏">H5抽签网页小游戏</a></li>
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><a target="_top" href="http://www.zuidaima.com/share/4119408367537152.htm" title="H5吃货节结账计算器">H5吃货节结账计算器</a></li>
                                <li><span title="最代码官方认证分享代码" class="validated">证</span><a target="_top" href="http://www.zuidaima.com/share/4119405888392192.htm" title="H5装修网计算器">H5装修网计算器</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>



        <div class="col-3 right_bar margin_top10">

            <div class="data_list margin_top10">

                <div class="data_list_title">
                    <img src="../img/xin.jpg" height="15px" width="15px" alt="最代码相关分享源代码列表" />相关分享
                </div>
                <div class="datas">
                    <ul class="project_list">
                        <li><span title="最代码官方原创分享代码" class="orginal">原</span>
                            <a target="_top" href="http://www.zuidaima.com/share/2956564349406208.htm" title="java swing基于jackson练习从api接口获取脑筋急转弯的demo">java swing基于jackson练习从api接口获取脑筋急转弯的demo</a>
                        </li>
                        <li><span title="最代码官方原创分享代码" class="orginal">原</span>
                            <a target="_top" href="http://www.zuidaima.com/share/2956564349406208.htm" title="java swing基于jackson练习从api接口获取脑筋急转弯的demo">Spring Boot整合邮件发送并保存历史发送邮箱</a>
                        </li>

                    </ul>
                </div>
            </div>

            <div class="data_list margin_top10">
                <div class="data_list_title">
                    <img src="../img/xin.jpg" height="15px" width="15px" alt="最代码最近下载分享源代码列表" />最近下载
                </div>
                <div class="datas">

                  <c:forEach items="${userBeanList}" var="li">
                    <div class="data">
                        <div>
                             <span>
                                 <a class="name" href="../CodeController/queryuser?id=${li.id}">${li.name}</a>&nbsp;
                                 <span title="137级,距离下次升级还差0贡献值" class="lv_sub">Lv${li.grade}</span>
                             </span>
                                <span class="time pull-right"></span>
                        </div>
                        <div>
                            <span class="code">
                                <a href="../CodeController/querygrade" target="_top" rel="nofollow" >

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
                    <img src="../img/xin.jpg" height="15px" width="15px" alt="最代码最近浏览分享源代码列表" />最近浏览
                </div>
                <div class="datas">
                    <c:forEach items="${userBeanList}" var="li">
                    <div class="data">
                        <div>
                             <span>
                                 <a class="name" href="../CodeController/queryuser?id=${li.id}">${li.name}</a>&nbsp;
                                 <span title="137级,距离下次升级还差0贡献值" class="lv_sub">Lv${li.grade}</span>
                             </span>
                            <span class="time pull-right"></span>
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
                <img src="weixin.jpg" alt="&gt;扫描二维码关注最代码为好友" />扫描二维码关注最代码为好友
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
                <img src="../img/timg.jpg" height="40px" width="40px" alt="最代码官方群9" title="最代码官方群9" border="0" />
            </a>
            <a rel="nofollow" target="_top" href="http://shang.qq.com/wpa/qunwpa?idkey=97f0cf2b725ec7f018bcbe3c9f4fcb807ea7efc93d4de77d91f55046d7741d9b">
                <img src="../img/timg.jpg" height="40px" width="40px" alt="最代码官方群10" title="最代码官方群10" border="0" />
            </a>
            <span class="pull-right">京ICP备12032064号</span>
        </div>
    </div>
</div>
<iframe src="index_13.html" style="display: none; width: 0px; height: 0px;" name="google_osd_static_frame" id="google_osd_static_frame_1736229895268"></iframe>
</body>
</html>
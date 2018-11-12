<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    <meta name="description" content="最代码 www.zuidaima.com 最全面,最专业的源代码分享网站,近万名用户分享超过数万份高质量的java/jquery/bootstrap/html/css源代码" />
    <title>提出问题-代码平台</title>
    <meta name="keywords" content="代码,代码分享,代码例子,源码,java代码，javascript代码,最代码,程序" />
    <link href="http://www.zuidaima.com/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="http://static.zuidaima.cn/static/v201806/js/syntaxhighlighter2/shCore-min.css" type="text/css" rel="stylesheet" />
    <link href="http://static.zuidaima.cn/static/v201806/css/bootstrap.min.css" rel="stylesheet" />
    <link href="http://static.zuidaima.cn/static/v201806/css/font-awesome.min.css" rel="stylesheet" />
    <link href="http://static.zuidaima.com/static/v201806/css/zuidaima.css" rel="stylesheet" />
    <script src="//hm.baidu.com/hm.js?500f123d596f6dae47e36a9a36fed240"></script>
    <script src="http://pagead2.googlesyndication.com/pagead/js/r20181107/r20100101/osd.js"></script>
    <script src="http://pagead2.googlesyndication.com/pub-config/r20160913/ca-pub-2303958443489176.js"></script>
    <script src="http://static.zuidaima.cn/static/v201806/js/ckeditor/ckeditor.js"></script>
    <style>.cke{visibility:hidden;}</style>
    <script src="http://static.zuidaima.cn/static/v201806/js/jquery.1.10.2.min.js"></script>
    <script src="http://static.zuidaima.com/static/v201806/js/zuidaima.js"></script>
    <script type="text/javascript" src="http://static.zuidaima.cn/static/v201806/js/ckeditor/config.js?t=D6IC"></script>
    <link rel="preload" href="https://adservice.google.com/adsid/integrator.js?domain=www.zuidaima.com" as="script" />
    <script type="text/javascript" src="https://adservice.google.com/adsid/integrator.js?domain=www.zuidaima.com"></script>
    <link rel="preload" href="http://pagead2.googlesyndication.com/pagead/js/r20181107/r20180604/show_ads_impl.js" as="script" />
    <link rel="stylesheet" type="text/css" href="http://static.zuidaima.cn/static/v201806/js/ckeditor/skins/moono/editor.css?t=D6IC" />
    <script type="text/javascript" src="http://static.zuidaima.cn/static/v201806/js/ckeditor/lang/zh-cn.js?t=D6IC"></script>
    <script type="text/javascript" src="http://static.zuidaima.cn/static/v201806/js/ckeditor/styles.js?t=D6IC"></script>
    <script type="text/javascript" src="http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/colorbutton/plugin.js?t=D6IC"></script>
    <script type="text/javascript" src="http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/font/plugin.js?t=D6IC"></script>
    <script type="text/javascript" src="http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/smiley/plugin.js?t=D6IC"></script>
    <script type="text/javascript" src="http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/flash/plugin.js?t=D6IC"></script>
    <script type="text/javascript" src="http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/syntaxhighlight/plugin.js?t=D6IC"></script>
    <script type="text/javascript" src="http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/panelbutton/plugin.js?t=D6IC"></script>
    <script type="text/javascript" src="http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/colorbutton/lang/zh-cn.js?t=D6IC"></script>
    <script type="text/javascript" src="http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/flash/lang/zh-cn.js?t=D6IC"></script>
    <script type="text/javascript" src="http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/syntaxhighlight/lang/en.js?t=D6IC"></script>
    <script type="text/javascript" src="http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/font/lang/zh-cn.js?t=D6IC"></script>
    <script type="text/javascript" src="http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/smiley/lang/zh-cn.js?t=D6IC"></script>
    <style id="cke_ui_color" type="text/css"></style>
</head>
<body style="">
<div class="text-center">
    <!-- 718 -->
    <ins class="adsbygoogle my_adslot" style="display: inline-block; width: 728px; height: 90px;" data-ad-client="ca-pub-2303958443489176" data-ad-slot="2718318847" data-adsbygoogle-status="done">
        <ins id="aswift_0_expand" style="display:inline-table;border:none;height:90px;margin:0;padding:0;position:relative;visibility:visible;width:728px;background-color:transparent;">
            <ins id="aswift_0_anchor" style="display:block;border:none;height:90px;margin:0;padding:0;position:relative;visibility:visible;width:728px;background-color:transparent;">
                <iframe width="728" height="90" frameborder="0" marginwidth="0" marginheight="0" vspace="0" hspace="0" allowtransparency="true" scrolling="no" allowfullscreen="true" onload="var i=this.id,s=window.google_iframe_oncopy,H=s&amp;&amp;s.handlers,h=H&amp;&amp;H[i],w=this.contentWindow,d;try{d=w.document}catch(e){}if(h&amp;&amp;d&amp;&amp;(!d.body||!d.body.firstChild)){if(h.call){setTimeout(h,0)}else if(h.match){try{h=s.upd(h,i)}catch(e){}w.location.replace(h)}}" id="aswift_0" name="aswift_0" style="left:0;position:absolute;top:0;width:728px;height:90px;"></iframe>
            </ins>
        </ins>
    </ins>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({});
    </script>
</div>
<div class="main container margin_top10 width_998">
    <div class="row project">
        <div class="col-9 left_bar">
            <div class="data_list">
                <div class="data_list_title">
                    提出问题
                </div>
                <div class="margin_top10">
                    <span class="error"></span>
                </div>
                <div class="margin_top10">
                    <form id="question" class="project" method="post" enctype="multipart/form-data">
                        <div class="input_item_title">
                            <span class="must_input">*</span>牛币
                        </div>
                        <input id="niubi" name="nbcount" class="col-12" type="text" value="1" />
                        <div class="input_item_title">
                            <span class="must_input">*</span>标题
                        </div>
                        <input id="title" name="problrm" class="col-12" type="text" value="" />
                        <div class="input_item_title margin_top10">
                            <span class="must_input">*</span>描述
                        </div>
                        <textarea name="content" id="editor" rows="20" class="col-12" style="visibility: hidden; display: none;"> &lt;p&gt;&lt;s&gt;提问模板,提交时删除此行&lt;/s&gt;&lt;/p&gt; &lt;p&gt;&lt;strong&gt;问题描述&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;&nbsp;&lt;/p&gt; &lt;p&gt;&lt;strong&gt;运行环境&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;jdk7+tomcat7+mysql+IntelliJ IDEA+maven&lt;/p&gt; &lt;p&gt;&lt;strong&gt;项目技术(必填)&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;spring+spring mvc+mybatis+bootstrap+jquery&lt;/p&gt; &lt;p&gt;&lt;strong&gt;项目截图(必填)&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;&nbsp;&lt;/p&gt; &lt;p&gt;&lt;strong&gt;运行截图(必填)&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;&nbsp;&lt;/p&gt; &lt;p&gt;&lt;strong&gt;相关代码片段&lt;/strong&gt;&lt;/p&gt; &lt;p&gt;&nbsp;&lt;/p&gt; &lt;p&gt;&lt;strong&gt;注意事项&lt;/strong&gt;&lt;/p&gt; </textarea>

                        <div id="cke_editor" class="cke_1 cke cke_reset cke_chrome cke_editor_editor cke_ltr cke_browser_webkit" dir="ltr" lang="zh-cn" role="application" aria-labelledby="cke_editor_arialbl">
                            <span id="cke_editor_arialbl" class="cke_voice_label">所见即所得编辑器,editor</span>
                            <div class="cke_inner cke_reset" role="presentation">
                                <span id="cke_1_top" class="cke_top cke_reset_all" role="presentation" style="height: auto; user-select: none;"><span id="cke_7" class="cke_voice_label">工具栏</span><span id="cke_1_toolbox" class="cke_toolbox" role="group" aria-labelledby="cke_7" onmousedown="return false;"><span id="cke_9" class="cke_toolbar" role="toolbar"><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_10" class="cke_button cke_button__link  cke_button_off" "="" href="javascript:void('插入/编辑超链接')" title="插入/编辑超链接" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_10_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(2,event);" onfocus="return CKEDITOR.tools.callFunction(3,event);" onmousedown="return CKEDITOR.tools.callFunction(4,event);" onclick="CKEDITOR.tools.callFunction(5,this);return false;"><span class="cke_button_icon cke_button__link_icon" style="background-image:url(http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/icons.png?t=D6IC);background-position:0 -624px;">&nbsp;</span><span id="cke_10_label" class="cke_button_label cke_button__link_label">插入/编辑超链接</span></a><a id="cke_11" class="cke_button cke_button__unlink cke_button_disabled" "="" href="javascript:void('取消超链接')" title="取消超链接" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_11_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(6,event);" onfocus="return CKEDITOR.tools.callFunction(7,event);" onmousedown="return CKEDITOR.tools.callFunction(8,event);" onclick="CKEDITOR.tools.callFunction(9,this);return false;" aria-disabled="true"><span class="cke_button_icon cke_button__unlink_icon" style="">&nbsp;</span><span id="cke_11_label" class="cke_button_label cke_button__unlink_label">取消超链接</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_12" class="cke_toolbar" role="toolbar"><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_13" class="cke_button cke_button__bold  cke_button_off" "="" href="javascript:void('加粗')" title="加粗" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_13_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(10,event);" onfocus="return CKEDITOR.tools.callFunction(11,event);" onmousedown="return CKEDITOR.tools.callFunction(12,event);" onclick="CKEDITOR.tools.callFunction(13,this);return false;"><span class="cke_button_icon cke_button__bold_icon" style="">&nbsp;</span><span id="cke_13_label" class="cke_button_label cke_button__bold_label">加粗</span></a><a id="cke_14" class="cke_button cke_button__italic  cke_button_off" "="" href="javascript:void('倾斜')" title="倾斜" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_14_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(14,event);" onfocus="return CKEDITOR.tools.callFunction(15,event);" onmousedown="return CKEDITOR.tools.callFunction(16,event);" onclick="CKEDITOR.tools.callFunction(17,this);return false;"><span class="cke_button_icon cke_button__italic_icon" style="background-image:url(http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/icons.png?t=D6IC);background-position:0 -48px;">&nbsp;</span><span id="cke_14_label" class="cke_button_label cke_button__italic_label">倾斜</span></a><a id="cke_15" class="cke_button cke_button__strike  cke_button_off" "="" href="javascript:void('删除线')" title="删除线" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_15_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(18,event);" onfocus="return CKEDITOR.tools.callFunction(19,event);" onmousedown="return CKEDITOR.tools.callFunction(20,event);" onclick="CKEDITOR.tools.callFunction(21,this);return false;"><span class="cke_button_icon cke_button__strike_icon" style="">&nbsp;</span><span id="cke_15_label" class="cke_button_label cke_button__strike_label">删除线</span></a><a id="cke_16" class="cke_button cke_button__removeformat  cke_button_off" "="" href="javascript:void('清除格式')" title="清除格式" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_16_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(22,event);" onfocus="return CKEDITOR.tools.callFunction(23,event);" onmousedown="return CKEDITOR.tools.callFunction(24,event);" onclick="CKEDITOR.tools.callFunction(25,this);return false;"><span class="cke_button_icon cke_button__removeformat_icon" style="">&nbsp;</span><span id="cke_16_label" class="cke_button_label cke_button__removeformat_label">清除格式</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_17" class="cke_toolbar" role="toolbar"><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_18" class="cke_button cke_button__numberedlist  cke_button_off" "="" href="javascript:void('编号列表')" title="编号列表" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_18_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(26,event);" onfocus="return CKEDITOR.tools.callFunction(27,event);" onmousedown="return CKEDITOR.tools.callFunction(28,event);" onclick="CKEDITOR.tools.callFunction(29,this);return false;"><span class="cke_button_icon cke_button__numberedlist_icon" style="">&nbsp;</span><span id="cke_18_label" class="cke_button_label cke_button__numberedlist_label">编号列表</span></a><a id="cke_19" class="cke_button cke_button__bulletedlist  cke_button_off" "="" href="javascript:void('项目列表')" title="项目列表" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_19_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(30,event);" onfocus="return CKEDITOR.tools.callFunction(31,event);" onmousedown="return CKEDITOR.tools.callFunction(32,event);" onclick="CKEDITOR.tools.callFunction(33,this);return false;"><span class="cke_button_icon cke_button__bulletedlist_icon" style="">&nbsp;</span><span id="cke_19_label" class="cke_button_label cke_button__bulletedlist_label">项目列表</span></a><a id="cke_20" class="cke_button cke_button__blockquote  cke_button_off" "="" href="javascript:void('块引用')" title="块引用" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_20_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(34,event);" onfocus="return CKEDITOR.tools.callFunction(35,event);" onmousedown="return CKEDITOR.tools.callFunction(36,event);" onclick="CKEDITOR.tools.callFunction(37,this);return false;"><span class="cke_button_icon cke_button__blockquote_icon" style="">&nbsp;</span><span id="cke_20_label" class="cke_button_label cke_button__blockquote_label">块引用</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_21" class="cke_toolbar" role="toolbar"><span class="cke_toolbar_start"></span><span id="cke_8" class="cke_combo cke_combo__fontsize  cke_combo_off" role="presentation"><span id="cke_8_label" class="cke_combo_label">大小</span><a class="cke_combo_button" hidefocus="true" title="大小" tabindex="-1" "="" href="javascript:void('大小')" role="button" aria-labelledby="cke_8_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(39,event,this);" onmousedown="return CKEDITOR.tools.callFunction(41,event);" onfocus="return CKEDITOR.tools.callFunction(40,event);" onclick="CKEDITOR.tools.callFunction(38,this);return false;"><span id="cke_8_text" class="cke_combo_text cke_combo_inlinelabel">大小</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span class="cke_toolgroup" role="presentation"><a id="cke_22" class="cke_button cke_button__textcolor cke_button_off " "="" href="javascript:void('文本颜色')" title="文本颜色" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_22_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(42,event);" onfocus="return CKEDITOR.tools.callFunction(43,event);" onmousedown="return CKEDITOR.tools.callFunction(44,event);" onclick="CKEDITOR.tools.callFunction(45,this);return false;"><span class="cke_button_icon cke_button__textcolor_icon" style="background-image:url(http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/colorbutton/icons/textcolor.png?t=D6IC);background-position:0 0px;">&nbsp;</span><span id="cke_22_label" class="cke_button_label cke_button__textcolor_label">文本颜色</span><span class="cke_button_arrow"></span></a><a id="cke_23" class="cke_button cke_button__bgcolor cke_button_off " "="" href="javascript:void('背景颜色')" title="背景颜色" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_23_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(46,event);" onfocus="return CKEDITOR.tools.callFunction(47,event);" onmousedown="return CKEDITOR.tools.callFunction(48,event);" onclick="CKEDITOR.tools.callFunction(49,this);return false;"><span class="cke_button_icon cke_button__bgcolor_icon" style="background-image:url(http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/colorbutton/icons/bgcolor.png?t=D6IC);background-position:0 0px;">&nbsp;</span><span id="cke_23_label" class="cke_button_label cke_button__bgcolor_label">背景颜色</span><span class="cke_button_arrow"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_24" class="cke_toolbar" role="toolbar"><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_25" class="cke_button cke_button__image  cke_button_off" "="" href="javascript:void('图象')" title="图象" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_25_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(50,event);" onfocus="return CKEDITOR.tools.callFunction(51,event);" onmousedown="return CKEDITOR.tools.callFunction(52,event);" onclick="CKEDITOR.tools.callFunction(53,this);return false;"><span class="cke_button_icon cke_button__image_icon" style="">&nbsp;</span><span id="cke_25_label" class="cke_button_label cke_button__image_label">图象</span></a><a id="cke_26" class="cke_button cke_button__flash  cke_button_off" "="" href="javascript:void('Flash')" title="Flash" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_26_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(54,event);" onfocus="return CKEDITOR.tools.callFunction(55,event);" onmousedown="return CKEDITOR.tools.callFunction(56,event);" onclick="CKEDITOR.tools.callFunction(57,this);return false;"><span class="cke_button_icon cke_button__flash_icon" style="background-image:url(http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/flash/icons/flash.png?t=D6IC);background-position:0 0px;">&nbsp;</span><span id="cke_26_label" class="cke_button_label cke_button__flash_label">Flash</span></a><a id="cke_27" class="cke_button cke_button__smiley  cke_button_off" "="" href="javascript:void('表情符')" title="表情符" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_27_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(58,event);" onfocus="return CKEDITOR.tools.callFunction(59,event);" onmousedown="return CKEDITOR.tools.callFunction(60,event);" onclick="CKEDITOR.tools.callFunction(61,this);return false;"><span class="cke_button_icon cke_button__smiley_icon" style="background-image:url(http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/smiley/icons/smiley.png?t=D6IC);background-position:0 0px;">&nbsp;</span><span id="cke_27_label" class="cke_button_label cke_button__smiley_label">表情符</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_28" class="cke_toolbar" role="toolbar"><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_29" class="cke_button cke_button__table  cke_button_off" "="" href="javascript:void('表格')" title="表格" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_29_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(62,event);" onfocus="return CKEDITOR.tools.callFunction(63,event);" onmousedown="return CKEDITOR.tools.callFunction(64,event);" onclick="CKEDITOR.tools.callFunction(65,this);return false;"><span class="cke_button_icon cke_button__table_icon" style="background-image:url(http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/icons.png?t=D6IC);background-position:0 -912px;">&nbsp;</span><span id="cke_29_label" class="cke_button_label cke_button__table_label">表格</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_30" class="cke_toolbar" role="toolbar"><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_31" class="cke_button cke_button__syntaxhighlight  cke_button_off" "="" href="javascript:void('插入代码')" title="插入代码" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_31_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(66,event);" onfocus="return CKEDITOR.tools.callFunction(67,event);" onmousedown="return CKEDITOR.tools.callFunction(68,event);" onclick="CKEDITOR.tools.callFunction(69,this);return false;"><span class="cke_button_icon cke_button__syntaxhighlight_icon" style="background-image:url(http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/syntaxhighlight/icons/syntaxhighlight.png?t=D6IC);background-position:0 0px;">&nbsp;</span><span id="cke_31_label" class="cke_button_label cke_button__syntaxhighlight_label">插入代码</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_32" class="cke_toolbar" role="toolbar"><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_33" class="cke_button cke_button__source  cke_button_off" "="" href="javascript:void('源码')" title="源码" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_33_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(70,event);" onfocus="return CKEDITOR.tools.callFunction(71,event);" onmousedown="return CKEDITOR.tools.callFunction(72,event);" onclick="CKEDITOR.tools.callFunction(73,this);return false;"><span class="cke_button_icon cke_button__source_icon" style="">&nbsp;</span><span id="cke_33_label" class="cke_button_label cke_button__source_label">源码</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_34" class="cke_toolbar" role="toolbar"><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_35" class="cke_button cke_button__maximize  cke_button_off" "="" href="javascript:void('全屏')" title="全屏" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_35_label" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(74,event);" onfocus="return CKEDITOR.tools.callFunction(75,event);" onmousedown="return CKEDITOR.tools.callFunction(76,event);" onclick="CKEDITOR.tools.callFunction(77,this);return false;"><span class="cke_button_icon cke_button__maximize_icon" style="background-image:url(http://static.zuidaima.cn/static/v201806/js/ckeditor/plugins/icons.png?t=D6IC);background-position:0 -672px;">&nbsp;</span><span id="cke_35_label" class="cke_button_label cke_button__maximize_label">全屏</span></a></span><span class="cke_toolbar_end"></span></span></span></span>
                                <div id="cke_1_contents" class="cke_contents cke_reset" role="presentation" style="height: 200px;">
                                    <iframe src="" frameborder="0" class="cke_wysiwyg_frame cke_reset" style="width: 370px; height: 100%;" aria-describedby="cke_41" title="所见即所得编辑器,editor" tabindex="0" allowtransparency="true"></iframe>
                                </div>
                                <span id="cke_1_bottom" class="cke_bottom cke_reset_all" role="presentation" style="user-select: none;"><span id="cke_1_resizer" class="cke_resizer cke_resizer_vertical cke_resizer_ltr" title="拖拽以改变大小" onmousedown="CKEDITOR.tools.callFunction(0, event)">◢</span><span id="cke_1_path_label" class="cke_voice_label">元素路径</span><span id="cke_1_path" class="cke_path" role="group" aria-labelledby="cke_1_path_label"><a id="cke_elementspath_36_0" href="javascript:void('body')" tabindex="-1" class="cke_path_item" title="body 元素" hidefocus="true" onkeydown="return CKEDITOR.tools.callFunction(79,0, event );" onclick="CKEDITOR.tools.callFunction(78,0); return false;" role="button" aria-label="body 元素">body</a><span class="cke_path_empty">&nbsp;</span></span></span>
                            </div>
                        </div>
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
                            <span class="must_input">*</span>话题(请选择下面的话题，只能选一个)
                        </div>
                        <input id="topics" name="titel" value="" class="topics col-12" readonly="readonly" />
                        <div class="margin_top10">
                            <div class="datas row">
                                <a class="topic col-3">CRM系统</a>
                                <a class="topic col-3">android studio视频教程</a>
                                <a class="topic col-3">邮件开发</a>
                                <a class="topic col-3">设计模式</a>
                            </div>
                            <div class="datas row margin_top10">
                                <a class="topic col-3">操作系统</a>
                                <a class="topic col-3">Web服务器</a>
                                <a class="topic col-3">服务端游戏开发</a>
                                <a class="topic col-3">客户端游戏</a>
                            </div>
                            <div class="datas row margin_top10">
                                <a class="topic col-3">网络游戏</a>
                                <a class="topic col-3">网页游戏</a>
                                <a class="topic col-3">图片处理</a>
                                <a class="topic col-3">音视频处理</a>
                            </div>
                            <div class="datas row margin_top10">
                                <a class="topic col-3">cms系统</a>
                                <a class="topic col-3">日期时间操作</a>
                                <a class="topic col-3">字节字符串操作</a>
                                <a class="topic col-3">桌面客户端开发</a>
                            </div>
                            <div class="datas row margin_top10">
                                <a class="topic col-3">消息系统</a>
                                <a class="topic col-3">第三方应用开发</a>
                                <a class="topic col-3">脚本和工具</a>
                                <a class="topic col-3">前端技术</a>
                            </div>
                            <div class="datas row margin_top10">
                                <a class="topic col-3">web网站开发</a>
                                <a class="topic col-3">关系型数据库</a>
                                <a class="topic col-3">任务调度</a>
                                <a class="topic col-3">项目管理</a>
                            </div>
                            <div class="datas row margin_top10">
                                <a class="topic col-3">网络编程</a>
                                <a class="topic col-3">博客系统</a>
                                <a class="topic col-3">游戏开发</a>
                                <a class="topic col-3">文本解析和文件处理</a>
                            </div>
                            <div class="datas row margin_top10">
                                <a class="topic col-3">加密混淆</a>
                                <a class="topic col-3">语法算法</a>
                                <a class="topic col-3">缓存系统</a>
                                <a class="topic col-3">搜索爬虫</a>
                            </div>
                            <div class="datas row margin_top10">
                                <a class="topic col-3">日志工具</a>
                                <a class="topic col-3">工作流引擎</a>
                                <a class="topic col-3">手机客户端开发</a>
                                <a class="topic col-3">报表制作</a>
                            </div>
                            <div class="datas row margin_top10">
                                <a class="topic col-3">模板引擎</a>
                                <a class="topic col-3">单元测试</a>
                                <a class="topic col-3">Nosql数据库</a>
                                <a class="topic col-3">论坛系统</a>
                            </div>
                            <div class="datas row margin_top10">
                                <a class="topic col-3">其他</a>
                            </div>
                        </div>
                        <br clear="all" />
                        <div class="margin_top10">
                            <span class="select_file_name"></span>
                        </div>
                        <br clear="all" />
                        <div class="post_project">
                            <a href="javascript:addProblem()" id="create_submit">发表</a>
                        </div>
                        <br clear="all" />
                    </form>
                </div>
            </div>
         </div>
        <div class="col-3 right_bar">
            <div class="data_list margin_top10">
                <div class="data_list_title">
                    <img src="http://static.zuidaima.com/resource/img/heart_ico.png" alt="牛币规则和分享说明" />牛币规则和分享说明
                </div>
                <div class="margin_top10">
                    <ul>
                        <li class="alert alert-info">*由用户自行设置牛币</li>
                        <li class="alert alert-info">如何上传图片</li>
                        <li> <a target="_blank" href="http://static.zuidaima.com//resource/img/how_to_upload_image.gif" title="如何上传图片"><img src="http://static.zuidaima.com//resource/img/how_to_upload_image.gif" alt="如何上传图片" /></a> </li>
                        <li class="alert alert-info">*把问题表达完整</li>
                        <li>代码只支持单个的java文件，多个文件的zip，rar包</li>
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
    <div class="popPanel" style="width: 0px; display: block;">
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
        setInterval("remind(4131429919803392,309794)",30000);
    });
</script>
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
            <!--
                   <a rel="nofollow" target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=727c073145e93bd3ca3f3cf26fb0da62b6c92376bf4dafbb03accc738c1d017e"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="最代码官方群1" title="最代码官方群1"></a>
                   -->
            <a rel="nofollow" target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=d3ef6d04eaad4a3ca96a76511b63e64914965b7d88fb05c3be81ce9d670b20e4"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="最代码官方群9" title="最代码官方群9" /></a>
            <a rel="nofollow" target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=97f0cf2b725ec7f018bcbe3c9f4fcb807ea7efc93d4de77d91f55046d7741d9b"><img border="0" src="http://pub.idqqimg.com/wpa/images/group.png" alt="最代码官方群10" title="最代码官方群10" /></a>
            <span class="pull-right">京ICP备12032064号</span>
        </div>
    </div>
</div>
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?500f123d596f6dae47e36a9a36fed240";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<iframe id="google_osd_static_frame_2672107282636" name="google_osd_static_frame" style="display: none; width: 0px; height: 0px;"></iframe>
<iframe id="google_shimpl" style="display: none;"></iframe>
<script type="text/javascript">
   function addProblem() {
       alert(567)
        $.ajax({
           url:'<%=request.getContextPath()%>/problem/addProblem',
           data:$("#question").serialize(),
           dataType:'post',
           success:function (data) {
               location.href="../problem/queryProblem"
           }
       })
   }

</script>
</body>
</html>
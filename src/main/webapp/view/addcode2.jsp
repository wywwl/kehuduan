<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0024)http://www.zuidaima.com/ -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml"><head>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="description" content="最代码 www.zuidaima.com 最全面,最专业的源代码分享网站,近万名用户分享超过数万份高质量的java/jquery/bootstrap/html/css源代码">
    <title>分享代码-最代码</title>
    <meta name="keywords" content="代码,代码分享,代码例子,源码,java代码，javascript代码,最代码,程序">

    <link href="favicon.ico" rel="shortcut icon" type="image/x-icon">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <script src="/js/summernote-zh-CN.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js1/uploadify/uploadify.css" type="text/css"/>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js1/uploadify/jquery.uploadify.min.js"></script>
    <link rel="stylesheet" type="text/css" href="index.css" media="all">


    <%--<jsp:include page="/common/mystyle.jsp"></jsp:include>--%>
</head>
<body>
<div class="header">

</div>
<div class="text-center">
    <!-- 718 -->


</div>

<div class="main container margin_top10 width_998">
    <div class="row project">
        <div class="col-9 left_bar">
            <div class="data_list">
                <div class="data_list_title">发表博客</div>
                <div class="margin_top10">
                    <span class="error"></span>
                </div>
                <<div class="margin_top10">
                <form id="blog" class="project" method="post" enctype="multipart/form-data">
                    <div class="input_item_title"><span class="must_input">*</span>预扣牛币数1(胡乱提交不返回，审核通过返回，防止垃圾博客)</div>
                    <input id="niubi" name="niubi" class="col-12" type="text" value="-1" disabled="disabled">
                    <div class="input_item_title"><span class="must_input">*</span>标题</div>
                    <input id="titlee" name="code_title" class="col-12" type="text" value="111">
                    <div class="input_item_title margin_top10">
                        <span class="must_input">*</span>描述</div>
                    <div id="summernote">


                    </div>

                    <br clear="all">
                    <div class="input_item_title margin_top10"><span class="must_input">*</span>话题(请选择下面的话题，只能选一个)</div>
                    <input id="topics" name="topics" value="" class="topics col-12" readonly="readonly">
                </form>
            </div>



                <div id="jzuid"></div>

                代码(只支持java,zip文件,非必须)
                <div id="showBars" ></div>
                <input type="file" name ="imgid"   id="imgFileBTN" >
                <%--  <input type="text" id="photourl">--%>
                <%--  <div class="upload margin_top10 input_item_title">
                      代码(只支持java,zip文件,非必须)
                  </div>--%>
                <div class="upload margin_top10 input_item_title select_file col">
                    <%--图片回显的img标签--%>
                    <%--  <div id="showImgDiv" style="width: 150px;height: 200px;border-style:solid;border-width:1px; border-color:#2d5bb5;">
                          <img src="" id="showImg" style="width: 150px;height: 200px;">
                      </div>--%>
                    <%--显示进度条的div--%>
                </div>
                <br clear="all">
                <div class="margin_top10">
                    <span class="select_file_name"></span>
                </div>
                <br clear="all">
                <div class="post_project">
                    <a href="javascript:fabiao()" id="create_submit">发表</a>
                </div>
                <br clear="all">

                <input type="hidden" id="uid"/>
                </form>
            </div>
        </div>
    </div>
  <%--  <div class="col-3 right_bar">

    </div>--%>
</div>

</div>
<div id="ajax-modal" class="modal fade" style="display: none;"></div>
<div class="footer margin_top10">
    <div class="container">

    </div>
</div>

</body>
<script>


    (function ( ) {

        $("#imgFileBTN").uploadify({
            //前台请求后台的url(上传方法) 不可忽略的参数
            'uploader': "../user/headImgUpload",
            //插件自带 不可忽略的参数
            'swf': '../js1/uploadify/uploadify.swf',
            //撤销按钮的图片路径
            'cancelImg': '../js1/uploadify/uploadify-cancel.png',
            //如果为true 为自动上传 在文件后 为false 那么它就要我们自己手动点上传按钮
            'auto': true,
            //可以同时选择多个文件 默认为true 不可忽略
            'multi': false,
            //给上传按钮设置文字
            'buttonText': '上传附件',
            //上传后队列是否消失
            'removeCompleted': true,
            'removeTimeout': 1,
            //上传文件的个数
            'uploadLimit': 2,
            'fileTypeExts': '*.zip',
            'fileSizeLimit': '500MB',
            //给div的进度条加背景 不可忽略
            'queueID': 'showBars',
            // controller层方法中接收文件的参数名
            'fileObjName': 'file',
            //      上传成功后的回调函数
            'onUploadSuccess': function (file, data, json) {
                //$("#showImg").prop("src","../"+data)

                $("#photourl").val(data)


            }

        });

    })

    function toEidt(id,name){
        $("#topics").val(name);
        $("#uid").val(id);
        alert($("#uid").val())

    }
    function addyuanma(){

    }

    $(document).ready(function() {
        $('#summernote').summernote();
    });
    $('#summernote').summernote({
        width: 710,
        height: 130,                 // 定义编辑框高度
        minHeight: 200,             // 定义编辑框最低的高度
        maxHeight: 600,             // 定义编辑框最高德高度
        lang: 'zh-CN',
        <!--工具栏-->
        toolbar: [
            <!--字体工具-->
            ['fontname', ['fontname']], //字体系列
            ['style', ['bold', 'italic', 'underline', 'clear']], // 字体粗体、字体斜体、字体下划线、字体格式清除
            ['font', ['strikethrough']], //字体划线、字体上标、字体下标
            ['fontsize', ['fontsize']], //字体大小
            ['color', ['color']], //字体颜色
            <!--段落工具-->
            ['para', ['ul', 'ol', 'paragraph']], //无序列表、有序列表、段落对齐方式
            <!--插入工具-->
            ['hr',['hr']],//插入水平线
            ['picture',['picture']], //插入图片
            ['fullscreen',['fullscreen']], //全屏
            ['codeview',['codeview']], //查看html代码
            ['link',['link']], //插入链接

        ],
        callbacks: {
            onImageUpload: function(file) {  //图片默认以二进制的形式存储到数据库，调用此方法将请求后台将图片存储到服务器，返回图片请求地址到前端

                //将图片放入Formdate对象中
                var formData = new FormData();
                //‘picture’为后台获取的文件名，file[0]是要上传的文件
                formData.append("picture", file[0]);
                $.ajax({
                    type:'post',
                    url:'../user/testuploadimg',
                    cache: false,
                    data:formData,
                    processData: false,
                    contentType: false,

                    success: function(picture) {
                        $('#summernote').summernote('insertImage',picture);
                    },
                    error:function(){
                        alert("上传失败");
                    }
                });
            }
        }})



    function fabiao(){
        var code_title=$("#titlee").val();
        alert(title);

        var photourl=$("#photourl").val();
        var btext = $('#summernote').summernote('code');
        alert(summernote);
        var topics = $("#uid").val();
        alert(topics);
        $.ajax({
            url: "../fxdm/addfx",
            type: "post",
            data: {"code_title": code_title, "btext": btext,"topics":topics,"photourl":photourl},
            success: function(data) {
                alert("发表成功");
                location.href="../fxdm/toquery";
            },
            error:function(){
                alert("发表失败");
            }
        });
    }
</script>

</html>

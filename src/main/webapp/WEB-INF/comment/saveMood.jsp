<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/2
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.css"  media="all">
<link rel="stylesheet" href="/boot/layui/css/modules/layer/default/layer.css"  >
<script src="../boot/bootstrap3/js/jquery-3.2.0.min.js"></script>
<script src="../boot/bootstrap3/js/toastr.min.js"></script>
<script src="../boot/bootstrap3/js/layui.all.js"></script>

<body>
<form id="addForms" ,method="POST">
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
        <legend>完整功能（）</legend>
    </fieldset>
    <textarea class="layui-textarea" id="LAY_demo1" style="display: none">
     初始内容放在这textare
</textarea>
    用户id:  <input id="text" name="create" value="${user.id}" />

    评论内容:<textarea id="add_Content" name="contenthtml"></textarea><br>
  <%--  头像:<button type="button" class="layui-btn" id="test1">
    <i class="layui-icon">&#xe67c;</i>上传封面
</button>
    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
        预览图：
        <div class="layui-upload-list" id="demo1">
            <p id="demoText"></p>
        </div>
    </blockquote>
    <input type="hidden" name="file" id="add_user_cover"><br>--%>

</form>
<script type="text/javascript">

    toastr.options.positionClass = 'toast-bottom-center';

    //初始化layui相关组件
    layui.use(['form', 'upload', 'layedit', 'laydate'], function(){
        var form = layui.form;
        var upload = layui.upload;
        var edit = layui.layedit;
        var laydate = layui.laydate;

        //初始化编辑器
        usereditor = edit.build("add_Content");

        data_sync = function() {
            edit.sync(usereditor);
        }

        var ssdd1;
        //普通图片上传--封面
        var uploadInst = upload.render({
            //绑定上传组件到具体的标签上
            elem: '#test1'
            //文件上传的后台方法
            ,url: '../upload/uploadUserCover'
            //文件上传到后台的属性名
            ,field:"userCoverFile"
            //是否开启多文件上传
            ,multiple:true
            //文件上传之前调用，弹出模态窗口
            ,before: function(obj){
                ssdd1 = layer.open({
                    type: 1
                    ,title: false //不显示标题栏
                    ,closeBtn: false
                    ,shade: 0.4
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: '<i class="layui-icon layui-anim layui-anim-rotate layui-anim-loop">&#xe63d;</i>'
                });
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#demo1').html('<img height="80px" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')
                });
            }
            ,done: function(data){
                //当一次上传结束之后回调函数
                $("#add_user_cover").val(data.filepath);
                layer.close(ssdd1);
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #ff5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });

    });



/*
    toastr.warning ('发送评论成功!');*/
</script>
</body>
</html>

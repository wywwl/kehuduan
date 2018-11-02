<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
    <form id="myForm" class="form-inline">
        <div class="row">
            <div class="col-xs-6">
                <label>广告内容</label>
                <input type="hidden" name="id" id="id" class="form-control">
                <input type="text" name="text" id="text" class="form-control">
            </div>
            <div class="col-xs-6">
                <label>广告图片</label>
                <input type="file" class="file" id="img" name="img"  multiple  width="42">
                <input type="hidden" id="imageId" name="img">
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6">
                <label>广告企业</label>
                <input type="text" name="enterprise" id="enterprise" class="form-control">
            </div>
            <div class="col-xs-6">
                <label>企业电话</label>
                <input type="text" name="enterprisephone" id="enterprisephone" class="form-control">
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6">
                <label>开始时间</label>
                <br><input type="date" name="starttime" id="starttime" class="form-control">
            </div>
            <div class="col-xs-6">
                <label>结束时间</label>
                <br> <input type="date" name="endtime"  id="endtime" class="form-control">
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6">
                <label>企业邮箱</label>
                <input type="text" name="enterpriseemail" id="enterpriseemail" class="form-control">
            </div>

        </div>
    </form>
</div>
</body>
<script type="text/javascript">
    $("#img").fileinput({
        language : 'zh',
        uploadUrl : "<%=request.getContextPath()%>/student/headImgUpload",
        showUpload: true, //是否显示上传按钮
        showRemove : true, //显示移除按钮
        showPreview : true, //是否显示预览
        showCaption: false,//是否显示标题
        autoReplace : true,
        minFileCount: 0,
        uploadAsync: true,
        maxFileCount: 10,//最大上传数量
        browseOnZoneClick: true,
        msgFilesTooMany: "选择上传的文件数量 超过允许的最大数值！",
        enctype: 'multipart/form-data',
        // overwriteInitial: false,//不覆盖已上传的图片
        allowedFileExtensions : [ "jpg", "png", "gif" ],
        browseClass : "btn btn-primary", //按钮样式
        previewFileIcon : "<i class='glyphicon glyphicon-king'></i>"
    }).on("fileuploaded", function(e, data) {//文件上传成功的回调函数，还有其他的一些回调函数，比如上传之前...
        //alert(data)
        // console.info(data.response.imgUrl)
        //  $("input[name='image']").val(data.response.imgUrl);
        $("#imageId").val(data.response.imgUrl);
        //   $("#imageId").attr("src",data.response.imgUrl);
        /*var res = data.response;
        console.log(res)
        imageData.push({
            "path": res.data.path,
            "date":res.data.date
        });
        console.log(imageData);*/
    });
</script>
</html>
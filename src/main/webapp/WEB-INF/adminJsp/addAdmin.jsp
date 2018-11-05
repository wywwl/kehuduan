<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
<style type="text/css">
    textarea{border:1px solid #ddd;}
    #textareaCount{color:green; margin: 0 4px;}
</style>
</head>
<body>
<div class="container-fluid">
    <form id="myForm" class="form-inline">
        <div class="row">
            <div class="col-xs-6">
                <label>名称</label>
                <input type="text" id="name" name="name" class="form-control">
            </div>
            <div class="col-xs-6">
                <label>账号</label>
                <input type="text" id="login" name="login" class="form-control">
            </div>
        </div>
        <br/>
        <div class="row">
            <div class="col-xs-6">
                <label>密码</label>
                <input type="password" id="upwd" name="upwd" class="form-control">
            </div>
            <div class="col-xs-6">
                <label>年龄</label>
                <input type="text" id="age" name="age" class="form-control">
            </div>
        </div>
        <br/>
        <div class="row">
            <div class="col-xs-6">
                <label>时间</label>
                <input type="text" id="times" name="times" class="form-control date">
            </div>
            <div class="col-xs-6">
                <label>性别</label>
                <label class="radio-inline">
                    <h4><input type="radio" name="sex" value="1">男</h4>
                </label>
                <label class="radio-inline">
                    <h4><input type="radio" name="sex" value="2">女</h4>
                </label>
            </div>
        </div>
        <br/>
        <div class="row">
            <div class="col-xs-12">
                <label>个人介绍</label><br/>
                <textarea class="form-control" id="emial" style="width: 530px;height: 150px;resize: none;overflow:-Scroll;overflow-x:hidden" name="emial" rows="3"placeholder="请详细介绍个人" ></textarea><br>
                您还可以再输入<strong id="textareaCount">500</strong>个字
            </div>
        </div>
    </form>
</div>
</body>
<script type="text/javascript">


    //文本框字的个数
    $(function(){
        $('textarea').keyup(function(event) {
            /* Act on the event */
            var maxLength = 500;
            var len = $('textarea').val().length;
            $('#textareaCount').html(maxLength - len);
            if(parseInt($('#textareaCount').text()) < 0){
                $('#textareaCount').html('0');
                var res = $(this).val().substring(0,500);
                $(this).val(res);
            }
        });
    });

    $('.date').datetimepicker({
        language: 'zh-CN',//显示中文
        format: 'yyyy-mm-dd',//显示格式
        minView: "month",//设置只显示到月份
        initialDate: new Date(),//初始化当前日期
        autoclose: true,//选中自动关闭
        todayBtn: true//显示今日按钮
    });
</script>
</html>

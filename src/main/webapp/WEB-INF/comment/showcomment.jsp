<%@ page import="java.util.List" %>
<%@ page import="com.jk.model.Comment" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/10/31
  Time: 22:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%
    List list = (List)request.getAttribute("list");

    for(int i = 0; i<list.size() ; i++ ){
        Class<Comment> aClass = (Class<Comment>) list.get(i).getClass();
        out.println(aClass.toString() );

    }
%>--%>

<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="../boot/bootstrap3/css/bootstrap.min.css">
<link rel="stylesheet" href="../boot/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css">

<link rel="stylesheet" href="../boot/bootstrap3/css/index.css">


<script src="../boot/bootstrap3/js/jquery-3.2.0.min.js"></script>
<script src="../boot/bootstrap-table/bootstrap-table.js"></script>
<script src="../boot/bootstrap3/js/bootstrap.js"></script>
<script src="../boot/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script src="../boot/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="../boot/bootstrap3/bootbox.js"></script>
<script src="../boot/bootstrap3/messenger.js"></script>
<script src="../boot/bootstrap3/js/bootstrap.min.js"></script>

<body>

<div class="mt50 commentHtml"><div>
    <h6 class="c-c-content c-infor-title" id="i-art-comment">
        <span class="commentTitle">动态消息评论</span>
    </h6>
    <section class="lh-bj-list pr mt20 replyhtml">
        <ul>
            <li class="unBr">
                <aside class="noter-pic">
                    <img width="50" height="50" class="picImg" src="../image/avatar-boy.gif ">
                </aside>
                <div class="of">
                    <section class="n-reply-wrap">
                        <fieldset>
                            <textarea name="content" placeholder="输入您要评论的文字" id="commentContent"></textarea>
                        </fieldset>
                        <p class="of mt5 tar pl10 pr10">
                            <span class="fl "><tt class="c-red commentContentmeg" style="display: none;"></tt></span>
                            <a href="javascript:saveComment();" title="发送" class="lh-reply-btn">发送</a>
                        </p>
                    </section>
                </div>
            </li>
        </ul>
    </section>
    <section class="">
        <section class="question-list lh-bj-list pr">
            <ul class="pr10" id="comment_ulid">
                  <li>
                        <aside class="noter-pic">
                            <img width="50" height="50" class="picImg" src="../image/avatar-boy.gif ">
                            </aside>
                        <div class="of">
                            <span class="fl">
                            <font class="fsize12 c-blue">
                             wk</font>
                            <font class="fsize12 c-999 ml5">评论：</font></span>
                        </div>
                        <div class="noter-txt mt5">

                        </div>
                        <div class="of mt5">
                            <span class="fr"><font class="fsize12 c-999 ml5">201/11/04 12:01</font></span> <span class="fl"> <a class="noter-dy vam" title="回复" href="javascript: void(0)" onclick="queryCommentReply(&#39;8&#39;)">
                                    <em class="icon18">&nbsp;</em>(<span class="replyCount8">0</span>)
                                </a> <tt title="赞一下" class="noter-zan vam ml10" onclick="addPraise(data[i].id)">
                                    <em class="icon18">&nbsp;</em>(<span class="addPraise8_4 praiseCount">0</span>)
                                </tt>
                            </span>
                        </div>
                        <div class="n-reply">
                            <section class="n-reply-wrap">
                                <fieldset>
                                    <textarea name="" class="commentReplyMsgContent8"></textarea>
                                </fieldset>
                                <p class="of mt5 tar pl10 pr10">
                                    <span class="fl"><tt class="c-red commentReplyMsg8"></tt></span>
                                    <a onclick="addCommentReply(data[i].id)" class="lh-reply-btn" title="回复" href="javascript: void(0)">回复</a>
                                </p>
                            </section>
                            <div class="mt10 pl10 pr10 pb10 commentReply8"></div>
                        </div>
                    </li>
            </ul>
        </section>
    </section>






<script >

    $(function() {
        queryComment();


    })



    /* 点赞 */
    function addPraise(id) {
        alert("点赞的id"+id)
        $.ajax({
            url:"../comment/addPraise",
            type:"post",
            dataType:"json",
            data:{
                id:id
            },
            success:function(data){
                if(data==0){
                    goToLogin()
                }else if(data==1){
                    queryComment()
                }else if(data==2){
                    alert("您已点过赞啦")
                }
            }
        })
    }

    /* 查询评论 */
    function queryComment() {
        var bid =1;
        $.ajax({
            url:"../comment/queryComment?bid="+bid,
            type:"post",
            dataType:"json",
            /*data:{bid:2},*/
            success:function(data){
                if(data!=null){
                    var content = "";
                    for(var i = 0; i<data.length; i++){
                        if(data[i].children.length>0 && data[i].children!=null){
                            content += "<li>";
                            content += '<aside class="noter-pic"><img width="50" height="50" class="picImg" src="../image/avatar-boy.gif "></aside>';
                            content += '<div class="of">'
                                +'<span class="fl">'
                                +'<font class="fsize12 c-blue">'
                                +''+data[i].email+'</font>'
                                +'<font class="fsize12 c-999 ml5">评论：</font></span>'
                                +'</div>';
                            content += '<div class="noter-txt mt5">'
                                +'<p>'+data[i].content+'</p>'
                                +'</div>';
                            content += '<div class="of mt5" id="btn">'
                                +'<span class="fr"  "><font class="fsize12 c-999 ml5">'+data[i].addtime+'</font></span> <span class="fl"> <a class="noter-dy vam" title="回复" href="javascript:addCommentReply(\''+data[i].id+'\')" onclick="queryCommentReply()">'
                                +'<em class="icon18">&nbsp;</em>(<span class="replyCount8">0</span>)'
                                +'</a> <tt title="赞一下" class="noter-zan vam ml10" onclick="addPraise(\''+data[i].id+'\')">'
                                +'<em class="icon18">&nbsp;</em>(<span class="addPraise8_4 praiseCount">'+data[i].likenumber+'</span>)'
                                +'</tt>';
                            +'</span>'
                            +'</div>';
                            content += '<div class="n-reply" id="additionalReply_div'+data[i].id+'" style="display:none;width:699px">'
                                +'<section class="n-reply-wrap">'
                                +'<fieldset>'
                                +'<textarea name="" class="commentReplyMsgContent8" id="additionalReply_textareaid'+data[i].id+'"></textarea>'
                                +'</fieldset>'
                                +'<p class="of mt5 tar pl10 pr10">'
                                +'<span class="fl"><tt class="c-red commentReplyMsg8"></tt></span>'
                                +'<a class="lh-reply-btn" title="回复" href="javascript:additionalReply(\''+data[i].id+'\')">回复</a>'
                                +'</p>'
                                +'</section>'
                                +'<div class="mt10 pl10 pr10 pb10 commentReply8"></div>'
                                +'</div>';
                            for(var y = 0; y<data[i].children.length; y++){
                                content += "<ol>";
                                content += '<aside class="noter-pic"><img width="50" height="50" class="picImg" src="../image/avatar-boy.gif "></aside>';
                                content += '<div class="of">'
                                    +'<span class="fl">'
                                    +'<font class="fsize12 c-blue">'
                                    +''+data[i].children[y].email+'</font>'
                                    +'<font class="fsize12 c-999 ml5">评论：</font></span>'
                                    +'</div>';
                                content += '<div class="noter-txt mt5">'
                                    +'<p>'+data[i].children[y].content+'</p>'
                                    +'</div>';
                                content += '<div class="of mt5">'
                                    +'<span class="fr" ><font class="fsize12 c-999 ml5">'+data[i].children[y].addtime+'</font></span> <span class="fl"> <a class="noter-dy vam" title="回复" href="javascript:addCommentReply(\''+data[i].children[y].id+'\')" onclick="queryCommentReply()">'
                                    +'<em class="icon18">&nbsp;</em>(<span class="replyCount8">0</span>)'
                                    +'</a> <tt title="赞一下" class="noter-zan vam ml10" onclick="addPraise(\''+data[i].children[y].id+'\')">'
                                    +'<em class="icon18">&nbsp;</em>(<span class="addPraise8_4 praiseCount">'+data[i].children[y].likenumber+'</span>)'
                                    +'</tt>';
                                +'</span>'
                                +'</div>';
                                content += '<div class="n-reply" id="additionalReply_divs'+data[i].children[y].id+'" style="display:none;width:699px">'
                                    +'<section class="n-reply-wrap">'
                                    +'<fieldset>'
                                    +'<textarea name="" class="commentReplyMsgContent8" id="additionalReply_textareaid'+data[i].children[y].id+'"></textarea>'
                                    +'</fieldset>'
                                    +'<p class="of mt5 tar pl10 pr10">'
                                    +'<span class="fl"><tt class="c-red commentReplyMsg8"></tt></span>'
                                    +'<a class="lh-reply-btn" title="回复" href="javascript:additionalReply(\''+data[i].children[y].id+'\')">回复</a>'
                                    +'</p>'
                                    +'</section>'
                                    +'<div class="mt10 pl10 pr10 pb10 commentReply8"></div>'
                                    +'</div>';
                                content += "</ol>";
                            }
                            content += "</li>";
                        }else{
                            content += "<li>"
                            content += '<aside class="noter-pic"><img width="50" height="50" class="picImg" src="../image/avatar-boy.gif "></aside>';
                            content += '<div class="of">'
                                +'<span class="fl">'
                                +'<font class="fsize12 c-blue">'
                                +''+data[i].email+'</font>'
                                +'<font class="fsize12 c-999 ml5">评论：</font></span>'
                                +'</div>';
                            content += '<div class="noter-txt mt5">'
                                +'<p>'+data[i].content+'</p>'
                                +'</div>';
                            content += '<div class="of mt5">'
                                +'<span class="fr"><font class="fsize12 c-999 ml5">'+data[i].addtime+'</font></span> <span class="fl"> <a class="noter-dy vam" title="回复" href="javascript:addCommentReply(\''+data[i].id+'\')" onclick="queryCommentReply()">'
                                +'<em class="icon18">&nbsp;</em>(<span class="replyCount8">0</span>)'
                                +'</a> <tt title="赞一下" class="noter-zan vam ml10" onclick="addPraise(\''+data[i].id+'\')">'
                                +'<em class="icon18">&nbsp;</em>(<span class="addPraise8_4 praiseCount">'+data[i].likenumber+'</span>)'
                                +'</tt>';
                            +'</span>'
                            +'</div>';
                            content += '<div class="n-reply" id="additionalReply_div'+data[i].id+'" style="display:none;width:699px">'
                                +'<section class="n-reply-wrap">'
                                +'<fieldset>'
                                +'<textarea name="" class="commentReplyMsgContent8" id="additionalReply_textareaid'+data[i].id+'"></textarea>'
                                +'</fieldset>'
                                +'<p class="of mt5 tar pl10 pr10">'
                                +'<span class="fl"><tt class="c-red commentReplyMsg8"></tt></span>'
                                +'<a class="lh-reply-btn" title="回复" href="javascript:additionalReply(\''+data[i].id+'\')">回复</a>'
                                +'</p>'
                                +'</section>'
                                +'<div class="mt10 pl10 pr10 pb10 commentReply8"></div>'
                                +'</div>';
                            content += "</li>"
                        }
                    }
                    $("#comment_ulid").html(content);
                }
            }
        })
    }
    /* 添加评论 */

    function saveComment() {

        var id=1;
        // 评论
        var content = $(".commentReplyMsgContent" + id).val();
        // 评论内容不能为空
        if (content == "") {
            $(".commentReplyMsg" + id).html("内容不能为空！").show();
            return;
        }

        var bid = 2;
        var uid=1;
        var content = $("#commentContent").val();
        $.ajax({
            url:"../comment/saveComment",
            type:"post",
            dataType:"json",
            data:{
                uid:uid,
                bid:bid,
                content:content
            },
            success:function(data){
                if(data.flg==1){
                    alert("未登录")
                    goToLogin();
                }else if (data.flg==2) {
                    alert("评论成功!");
                    $("#commentContent").val("");
                    queryComment();
                }else if(data.flg==3){
                   alert("评论失败!");
                }
            }
        })

    }


    var bol = false;
    /* 打开追加评论的文本框 */
    function addCommentReply(commentId) {
        // 点击时清空错误提示
        $(".commentReplyMsg" + commentId).val("").hide();

        // 评论必须先登陆
        if (!isLogin()) {
            lrFun();
            return;
        }

        // 评论
        var content = $(".commentReplyMsgContent" + id).val().trim();
        // 评论内容不能为空
        if (content == "") {
            $(".commentReplyMsg" + id).html("内容不能为空！").show();
            return;
        }
        if (content.length>800) {
            $(".commentReplyMsg" + id).html("内容不能大于800字符！").show();
            return;
        }
        $.ajax({
            url : '../web/comment/ajax/addcomment',
            type : 'post',
            data : {
                "pCommentId" : commentId,
                "content" : content,
                "type" : type,
                "otherId" : otherId
            },
            async : true,
            dataType : 'text',
            success : function(result) {
                var content = $(".commentReplyMsgContent" + id).val("");

                queryCommentReply(id);
                // 添加回复数
                var replyCount = $(".replyCount" + id).html();
                $(".replyCount" + id).html(replyCount * 1 + 1);
                dialog('提示信息', "成功", 0);
            }
        });
    }

    /*追加评论*/
    function additionalReply(commentId) {
        var courseid = '${course.courseId}';
        var content = $("#additionalReply_textareaid"+commentId).val();
        $.ajax({
            url:"../comment/saveComment.do",
            type:"post",
            dataType:"json",
         /*   博客id ，内容 ，pid为 评论id*/
            data:{
                courseid:courseid,
                content:content,
                pid:commentId
            },
            success:function(data){
                if(data==0){
                    goToLogin()
                }else{
                    $("#additionalReply_textareaid").val("");
                    $("#additionalReply_div").hide();
                    queryComment()
                }
            }
        })
    }

    function goToLogin() {
        if(confirm("你是否登录?登录后就可以发表评论啦!")){

            lrFun(2);
        }else{
            lrFun(1);
        }

    }
    function lrFun(l){
        if(l===1){
            /*刷新当前页面.*/
            window.location.reload();
        }else{
            /*  让用户登陆 location.href="../main/toMainJsp.do" */
        }
    }
    /**
     * 验证前台用户是否已经登录
     * @returns true登录 false未登录
     */
    function isLogin(){
        var is = false;
        var user = getLoginUser();
        if(user!=null && user.userId>0){
            is=true;
        }
        return is;
    }
    /**
     * 获取登录用户
     * @returns User
     */
    function getLoginUser(){
        var user = null;
        $.ajax({
            url:'../uc/getloginUser',
            type:'post',
            async:false,
            dataType:'json',
            success:function(result){
                user = result.entity;
            }
        });
        return user;
    }

</script>
</body>
</html>

<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/6
  Time: 11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>Title</title>
</head>

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
<meta name="viewport" content="width=device-width"/>
<link rel="stylesheet" href="../boot/bootstrap3/css/pinglun.css">
<link rel="stylesallheet" href="../boot/layui/css/layui.css">
<link rel="stylesheet" href="../boot/layui/css/modules/layer/default/layer.css">
<link rel="stylesallheet" href="../boot/bootstrap3/css/bootstrap.css">
<link rel="stylesheet" href="../boot/bootstrap3/css/bootstrap.min.css">
<link rel="stylesheet" href="../boot/bootstrap3/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="../boot/bootstrap3/css/toastr.css">


<script src="../boot/bootstrap3/js/jquery-3.2.0.min.js"></script>
<script src="../boot/bootstrap3/js/bootstrap.min.js"></script>
<script src="../boot/bootstrap3/js/bootstrap.js"></script>
<script src="../boot/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script src="../boot/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="../boot/bootstrap-bootbox/bootbox.js"></script>
<script src="../boot/bootstrap3/messenger.js"></script>

<style>
    .test{
        height: auto;
        margin: 0 15%;
    }
</style>
</head>
<body>
<div class="test">






    <button type="button" class="btn btn-info" onclick="open_add_dia()">发表心情</button>

    <div lang="en-US" class="gitment-container gitment-comments-container">




        <c:forEach items="${mood}" var="mood">
       <ul class="gitment-comments-list">
           <li class="gitment-comment">
               <a class="gitment-comment-avatar">
                   <img class="gitment-comment-avatar-img" src="../upload/${mood.file}">
               </a>
               <div class="gitment-comment-main">
                   <div class="gitment-comment-header">
                       <a class="gitment-comment-name">
                      ${mood.names}
                       </a>
                       <span>${mood.createtime}</span>

                        <div class="gitment-comment-like-btn">
                            <a href="javascript:void(0);" onclick="addAprse(${mood.id})">
                                <svg class="gitment-heart-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 50 50">
                                <path d="M25 39.7l-.6-.5C11.5 28.7 8 25 8 19c0-5 4-9 9-9 4.1 0 6.4 2.3 8 4.1 1.6-1.8 3.9-4.1 8-4.1 5 0 9 4 9 9 0 6-3.5 9.7-16.4 20.2l-.6.5zM17 12c-3.9 0-7 3.1-7 7 0 5.1 3.2 8.5 15 18.1 11.8-9.6 15-13 15-18.1 0-3.9-3.1-7-7-7-3.5 0-5.4 2.1-6.9 3.8L25 17.1l-1.1-1.3C22.4 14.1 20.5 12 17 12z"></path>
                            </svg>

                                ${mood.praiseCount}赞   </a>     <a href="javascript:void(0);" onclick="downAprse(${mood.id})">  (${mood.stepCount})踩  </a>
                        </div>
                    </div>
                    <div class="gitment-comment-body gitment-markdown"><p>

                       ${mood.contenthtml}
                    </p>
                    </div>
                   <a>  ${mood.address}</a>
                </div>
            </li>




        </ul>
        </c:forEach>
    </div>
</div>







</body>

    <script type="text/javascript">

        /* 点赞 */
        function addAprse(id) {
            alert("点赞的id"+id)
            $.ajax({
                url:"../comment/addAprse",
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


        function open_add_dia(){

            bootbox.dialog({
                title:'添加内容',
                message: createAddContent("../toSaveMood"),
                closeButton: true,
                buttons : {
                    "保存" : {
                        "label" : "<i class='icon-ok'></i> 发送我的心情",
                        "className" : "btn-sm btn-success",
                        "callback" : function() {
                            data_sync();
                            var s=$("#addForm").serialize();
                            alert(s)
                            $.ajax({
                                url:'../comment/addContent',
                                type:'post',
                                data:s,
                                dataType:'json',
                                success:function(data){
                                    toastr.warning ('发送评论成功!');
                                    $('#myTable').bootstrapTable('refresh');

                                }
                            });
                        }
                    },
                    "取消" : {
                        "label" : "<i class='icon-info'></i> 取消",
                        "className" : "btn-sm btn-danger",
                        "callback" : function() {

                        }
                    }
                }

            });



        }
        var res;
        function createAddContent(url){
            $.ajax({
                url:url,
                async:false,
                success:function(data){
                    res = data;
                }
            });
            return res;
        }



</script>
</html>



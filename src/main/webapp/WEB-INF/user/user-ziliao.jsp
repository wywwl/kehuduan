<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/inc/taglibs.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  
<title>${session.indexuser.id}-个人资料-${session.indexuser.login}</title>
 <meta name="keywords" content="个人资料" /> 
  <meta name="description" content="个人资料" /> 
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_common.css" />
<link rel="stylesheet" type="text/css" href="${path}/css/css/style_14_home_space.css" />
  <link rel="stylesallheet" href="../boot/layui/css/layui.css">
  <link rel="stylesheet" href="../boot/layui/css/modules/layer/default/layer.css">

<%--<script type="text/javascript">
    function ajaxFileUpload(id) {
    	$.ajaxFileUpload({
    		url : '../upload/uploadimg',
    		secureuri : false,
    		fileElementId : id,
    		dataType : 'json',
    		success : function(data, status) {
    			var isok=data.isok;
    			if(isok==1){
    				$("#img1").attr("src","../ file/"+data.path);
    				$("#img").val(data.path);
    			}
    		},
    		error : function(data, status, e) {
    			alert('上传出错');
    		}
    	});
    	return false;
    }
</script>--%>
</head>
 <script src="<%=request.getContextPath()%>/boot/bootstrap3/js/jquery-3.2.0.min.js"></script>
 <script src="<%=request.getContextPath()%>/public/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
 <body id="nv_forum" class="pg_index">
 <%@ include file="/WEB-INF/inc/top.jsp"%>
  <div id="wp" class="wp">
   <div id="pt" class="bm cl"> 
    <div class="z"> 
     <a href="${path}/" class="nvhm" title="首页">首页</a> 
     <em>›</em> 
     <a href="${path}/index.do">设置</a>
     <em>›</em>个人资料 
    </div> 
   </div> 
   <div id="ct" class="ct2_a wp cl"> 
    <div class="mn"> 
     <div class="bm bw0"> 
      <h1 class="mt">个人资料 </h1> 
      <ul class="tb cl"> 
       <li class="a"><a href="">基本资料</a></li> 
      </ul>
      <form action="${path}/comment/update" method="post" >
       <input type="hidden" name="id" value="${user.id }">
       <table cellspacing="0" cellpadding="0" class="tfm" id="profilelist"> 
        <tbody>
         <tr> 
          <th>用户名</th> 
          <td>${user.login} </td>
          <td>&nbsp;</td> 
         </tr>
         <tr id="tr_realname"> 
          <th id="th_realname">真实姓名</th> 
          <td id="td_realname"> 
          <input type="text" name="name" id="name" class="px" value="${user.login}"  disabled="true"　readOnly="true" />
           <div class="rq mtn" id="showerror_realname"></div><p class="d"></p></td>
         </tr>
         <tr id="tr_realname">

          <th id="th_realname">头像</th> 
          <td id="td_realname"> 
          <%--<input type="hidden" name="img" id="img" class="px" value="${session.indexuser.file}"  />
          <img src="<%=request.getContextPath()%>/file/${sessionScope.indexuser.file}" width="80px;" id="img1" />
           <input type="file"  id="file" name="file" onchange="ajaxFileUpload('file')"/>
--%>
           头像:<button type="button" class="layui-btn" id="test1">
           <i class="layui-icon">&#xe67c;</i>上传封面
          </button>
           <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
            预览图：
            <div class="layui-upload-list" id="demo1">
             <p id="demoText">

              <img src="${path}${user.file}" width="200" >
             </p>
            </div>
           </blockquote>
           <input type="hidden" name=file id="add_user_cover"><br>



		  </td> 
         </tr> 
       <tr id="tr_gender">
          <th id="th_gender">性别</th> 
          <td id="td_gender"> 
          <select name="sex" id="sex" class="ps" tabindex="1"  disabled="true"　readOnly="true" >
          	<option value="0"  <c:if test="${user.sex==0}">selected="selected"</c:if> >保密</option>
          	<option value="1" <c:if test="${user.sex==1}">selected="selected"</c:if>>男</option>
          	<option value="2" <c:if test="${user.sex==2}">selected="selected"</c:if>>女</option></select>
           <div class="rq mtn" id="showerror_gender"></div><p class="d"></p></td>
         </tr>
         <tr id="tr_birthday"> 
          <th id="th_birthday">在本网站的年龄</th>
          <td id="td_birthday"> 
         <input name="birthday" id="birthday" value="${user.webage}"  onfocus="WdatePicker({skin:'YcloudRed',dateFmt:'yyyy-MM-dd'})"  class="Wdate"  disabled="true"　readOnly="true" />
           <div class="rq mtn" id="showerror_birthday"></div><p class="d"></p></td> 
         </tr> 
        <%-- <tr id="tr_birthday">
          <th id="th_birthday">邮箱</th> 
          <td id="td_birthday"> 
         <input name="email" id="email" value="${sessionScope.indexuser.email}"  class="px"/>
           <div class="rq mtn" id="showerror_birthday"></div><p class="d"></p></td> 
         </tr> --%>
         <tr id="tr_birthday"> 
          <th id="th_birthday">邮箱</th>
          <td id="td_birthday">
         <input name="uemial" disabled="true"　readOnly="true"    id="mobile" value="${user.uemial}"  class="px"/>
           <div class="rq mtn" id="showerror_birthday"></div><p class="d"></p></td> 
         </tr> 
        <%-- <tr id="tr_birthday">
          <th id="th_birthday">签名</th> 
          <td id="td_birthday"> 
         <input name="qianming" id="qianming" value="${sessionScope.indexuser.qianming}" class="px"/>
           <div class="rq mtn" id="showerror_birthday"></div><p class="d"></p></td> 
         </tr> --%>
         <tr> 
          <th>&nbsp;</th> 
          <td colspan="2"> 
          <button type="submit" name="profilesubmitbtn" id="profilesubmitbtn" value="true" class="pn pnc"><strong>保存</strong></button> 
          <span id="submit_result" class="rq" style="display: none;">提示信息</span>
           </td> 
         </tr> 
        </tbody>
       </table> 
      </form> 
     </div> 
    </div> 
    <div class="appl">
     <div class="tbn"> 
      <h2 class="mt bbda">设置</h2> 
      <ul> 
       <li class="a"><a href="${path}/index">个人资料</a></li>
       <li ><a href="${path}/topwd">密码安全</a></li>
       <li><a href="${path}/user/jifen/index">积分</a></li>
       <li><a href="${path}/toSendemail">邮箱验证修改密码</a></li>
      </ul> 
     </div>
    </div> 
   </div> 
  </div>

 <script src="../boot/bootstrap3/js/layui.all.js"></script>
 <script type="text/javascript">




     //初始化layui相关组件
     layui.use(['form', 'upload', 'layedit', 'laydate'], function(){
         var form = layui.form;
         var upload = layui.upload;
         var edit = layui.layedit;
         var laydate = layui.laydate;

         //初始化编辑器
         usereditor = edit.build("add_userDesc");

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
             ,multiple:false
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
                 demoText.html('<span style="color: rgba(255,87,34,0.42);">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                 demoText.find('.demo-reload').on('click', function(){
                     uploadInst.upload();
                 });
             }
         });

     });

 </script>
<%@ include file="/WEB-INF/inc/foot.jsp"%>
 </body>
</html>
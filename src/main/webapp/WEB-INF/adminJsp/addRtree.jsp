<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
</head>
<body>
    <input id="rolesId" type="hidden" value="${rid}"/>
    <%--<div id="myrTree"></div>--%>
    <ul id="powerTree" class="ztree"></ul>
</body>
<script type="text/javascript">

    <%--$(function(){--%>
        <%--var roleId = $('#rolesId').val();--%>
        <%--$.ajax({--%>
            <%--url:'<%=request.getContextPath()%>/admin/getbokTree?roleId='+roleId,--%>
            <%--type:'post',--%>
            <%--data:{},--%>
            <%--dataType:'json',--%>
            <%--success:function(result){--%>
                <%--$('#myrTree').treeview({--%>
                    <%--data:result,--%>
                    <%--showCheckbox: true,--%>
                    <%--levels: 1,//设置继承树默认展开的级别设置继承树默认展开的级别--%>
                    <%--onNodeChecked: function(event,node){//选中节点--%>
                        <%--var selectNodes = getChildNodeIdArr(node);//获取所有节点--%>
                        <%--if(selectNodes){//如果子节点不为空，即存在子节点，则选中所有子节点--%>
                            <%--//选择指定的节点，接收节点或节点ID--%>
                            <%--$('#myrTree').treeview('checkNode',[selectNodes,{silent:true}])--%>
                        <%--}--%>
                        <%--console.info(node)--%>
                    <%--},--%>
                    <%--onNodeUnchecked:function(event,node){//取消选中节点--%>
                        <%--var selectNodes=getChildNodeIdArr(node);--%>
                        <%--if(selectNodes){//子节点不为空，则取消选中所有子节点--%>
                            <%--$('#myrTree').treeview("uncheckNode",[selectNodes,{silent:true}]);--%>
                        <%--}--%>
                        <%--console.info(node)--%>
                    <%--},--%>
                    <%--onNodeExpanded  :function(event, node){--%>
                        <%--var selectNodes = getChildNodeIdArr(node);//获取所有节点--%>
                        <%--console.info(selectNodes)--%>
                    <%--}--%>
                <%--})--%>
            <%--}--%>
        <%--})--%>
    <%--})--%>

    $(function(){
        var roleId = $('#rolesId').val();
        var settings={    //在setting中做我们树的一些配置    setting  是创建树之前的要干的事情

            check:{   //复选框  配置
                enable: true,    //  开启 复选框
            },
            data: {				//  data 中  是一些基础信息
                key:{
                    name: "text",   //    默认 是name
                    url:"url",
                    //abc:"uriTab"
                },
                simpleData: {    	 //简单数据设置
                    enable: true,	//简单数据开启  默认为false
                    idKey: "tid",  		// 指定 那个是id 可以自定义
                    pIdKey: "pid",  //  那个是父节点	可以自定义
                    rootPId: 0   	//  将几定义为父节点	可以自定义
                }
            },
            view:{              //显示的设置
                selectedMulti:false, //是否允许多个被选中
                nameIsHTML: true,  //支持HTML  格式
            },
        }
        $.ajax({
            type:"post",
            url:'<%=request.getContextPath()%>/admin/getbokTree?roleId='+roleId,
            dataType:"json",
            success:function (msg){
                //console.info(msg);
                $.fn.zTree.init($("#powerTree"), settings, msg);
            },
            error:function (){
                alert("出错了");
            }
        });
    })











    //递归所有子节点，找到所有层级节点
    // function getChildNodeIdArr(node) {
    //     var ts = [];
    //     if(node.nodes) {
    //         for(x in node.nodes) {
    //             ts.push(node.nodes[x].nodeId);
    //             if(node.nodes[x].nodes) {
    //                 var getNodeDieDai = getChildNodeIdArr(node.nodes[x]);//有第二层，第三层子节点的情况
    //                 for(j in getNodeDieDai) {
    //                     ts.push(getNodeDieDai[j]);
    //                     }
    //                 }
    //             }
    //         } else {
    //         ts.push(node.nodeId);
    //     }
    //     return ts;
    // }







</script>
</html>

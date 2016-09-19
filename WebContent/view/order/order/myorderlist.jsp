<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/pintuer/pintuer.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer/pintuer.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer/respond.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-jtemplates.js"></script>
    
    <style type="text/css">
    	.doc-naver {
		    padding-top: 10px;
		    padding-bottom: 10px;
		}
		.doc-header.fixed-top .doc-naver {
		    padding-top: 10px;
		    padding-bottom: 10px;
		    background-color: #fff;
		}
		.admin {
		    width: 100%;
		    padding: 20px;
		    background: #fff;
		    right: 0;
		    bottom: 0;
		    top: 87px;
		    overflow: auto;
		}
		
		.nav-inline li a {
			line-height: 22px;
		}
		
		.border-back {
    		border-color:#b5cfd9;
		}
		/* .panel-back {
			background-color: #f7f7f7;
		} */
		.table th{text-align: center}
    </style>
    <script type="text/javascript">
    	$(function(){
    		$.ajax({
    			async:false,
                url: "${pageContext.request.contextPath}/order/orderlist.htmls",
                data: {orderType:'my',pageIndex:0,pageSize:30},
                type: "post",
                dataType:"json",
                success: function (json) {
               	 	/* alert(json.data);
               	    $(".booklist").setTemplateElement("Template-List-note-show");
     	         	$(".booklist").setParam('totle', 0);
                 	//process template
                 	$(".booklist").processTemplate(data); */
                 
                 
               	 	$("#orderList").setTemplateElement("Template-List-user-show");
	         		//$("#admin-panel").setParam('isShowBtn', isShowBtn);
	         		//$("#admin-panel").setParam('docAuthArr', docAuthArr);
	                $("#orderList").processTemplate(json.data);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
           });
    		
    		//
    		$("#newOrder").click(function(){
    			location.href = "${pageContext.request.contextPath}/order/newOrder.htmls";
    		});
    		
    	});
    </script>
</head>
<body>
	<%@ include file="/view/order/header.jsp" %>
	<!--内容-->
	<div class="layout" style="margin-bottom: 50px">
		<ul class="bread bg">
			<li><a href="#" class="icon-home">首页</a> </li>
			<li><a href="#" >我的订单</a></li>
		</ul>
		<div class="admin" style="padding: 30px 60px;">
			<div class="padding border-bottom float-right">
				<button class="button bg-blue" id="newOrder"><span class="icon-plus"></span> 新增</button>
			</div>
			<div id="orderList" class="admin-panel">
				
			</div>
		</div>
	</div>
	<!--底部-->
	<div class="layout fixed-bottom bg-white">
		<div class="border-bottom padding-bottom">
			<div class="text-center height-big text-small">
				<strong>版权所有 亚普软件(北京)有限公司&copy; <a href="#"></a> All Rights Reserved.</strong>
			</div>
		</div>
	</div>
	
	<textarea id="Template-List-user-show" rows="0" cols="0" style="display:none">
		<!--
		<table class="table table-bordered table-hover text-small">
			<tbody>
				<tr class="panel-head">
					<th width="45" align="center"><input type="checkbox" value="1" name="id"></th>
					<th width="45">序号</th>
					<th width="80">单号</th>
					<th width="100">下单时间</th>
					<th width="80">金额</th>
					<th width="50">状态</th>
					<th width="100">操作</th>
				</tr>
				{#foreach $T as row}
				<tr class="tr">
					<td align="center"><input type="checkbox" value="1" name="id"></td>
					<td>{$T.row$index+1}</td>
					<td>{$T.row.ordernumber}</td>
					<td>{$T.row.ordertime}</td>
					<td>{$T.row.ordertotal}</td>
					<td>{$T.row.orderstatusmemo}</td>
					<td>操作</td>
				</tr>
				{#/for}
			</tbody>
		</table>
	    -->
	</textarea>
</body>
</html>
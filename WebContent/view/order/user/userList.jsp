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
		
		.table-bordered th {
		    border-bottom: 0px solid #ddd;
		}
		
		.table tr {
			height:45px;
		}
		.table th ,.table td {
			vertical-align: middle;
			padding: 1px 5px;
			text-align: center;
		}
    </style>
    <script type="text/javascript">
    	var parentid = '${sessionScope.pc_user_sessiion.id}';
    	$(function(){
    		$("input[name=radio_user]:eq(0)").attr("checked",'checked');
    		radio_click();
    		$("input[name=radio_user]").click(function(){
    			$(this).val();
    			radio_click();
  			});
    		
    	});
    	
    	function bindTdClick() {
    		$('.table td').unbind('click').click(function(){
    			var html = $(this).html();
    			if (html.indexOf("input") == -1) {
    				$(this).html("<input type='text' class='input input-small' value='"+html+"'/>");
    				$(".input").focus();
    				$(".input").blur(function(){
    					var val = $(this).val();
    					$('.table td').html(val);
    				})
    			}
    		})
    	}
    	
    	function radio_click() {
    		var radio_value = $("input[name='radio_user']:checked").val();
    		$.ajax({
    			async:false,
                url: "${pageContext.request.contextPath}/orderUser/list.htmls",
                data: {'parentid':parentid,identity:radio_value,pageIndex:0,pageSize:30},
                type: "post",
                dataType:"json",
                success: function (json) {
               	 	/* alert(json.data);
               	    $(".booklist").setTemplateElement("Template-List-note-show");
     	         	$(".booklist").setParam('totle', 0);
                 	//process template
                 	$(".booklist").processTemplate(data); */
                 
                 
               	 	$(".admin-panel").setTemplateElement("Template-List-user-show");
	         		//$("#admin-panel").setParam('isShowBtn', isShowBtn);
	         		//$("#admin-panel").setParam('docAuthArr', docAuthArr);
	                $(".admin-panel").processTemplate(json.data);
	                bindTdClick();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
           });
    	}
    </script>
</head>
<body>
	<%@ include file="/view/order/header.jsp" %>
	<!--内容-->
	<div class="layout" style="margin-bottom: 50px;">
		<ul class="bread bg">
			<li><a href="${pageContext.request.contextPath}/order/dispatch.htmls?page=/view/order/index" class="icon-home">首页</a> </li>
			<li><a href="javascript:;" >客户列表</a></li>
		</ul>
		<div class="admin" style="padding: 30px 60px;">
			<form onsubmit="return false;" class="form-x" method="post">
				<div class="form-group float-right">
					<c:choose>
	    				<c:when test="${sessionScope.pc_user_sessiion.id == '1' }">
	    					<input name="radio_user" type="radio" value="A"> 代理
	    					<input name="radio_user" type="radio" value="C"> 门店
	    				</c:when>
	    				<c:when test="${sessionScope.pc_user_sessiion.identity == 'A' }">
	    					<input name="radio_user" type="radio" value="C"> 门店
	    					<!-- <input name="radio_user" type="radio"> 普通会员  -->
	    				</c:when>
	    				<c:otherwise>
	    					<!-- <input name="radio_user" type="radio" checked> 普通会员 -->
	    				</c:otherwise>
	    			</c:choose>
					<!-- <input name="radio_user" type="radio" checked> 代理
					<input name="radio_user" type="radio"> 门店
					<input name="radio_user" type="radio"> 普通会员 -->
					<input name="radio_user" type="radio" value="Z"> 普通会员 
					<a href="javascript:;" onclick="" style="margin-left: 20px" class="button bg-blue">新建</a>
				</div>
			</form>
			<form method="post">
				<div class="admin-panel">
					<table class="table table-bordered table-hover text-small">
						<tbody>
							<tr class="panel-head">
								<th width="45" align="center"><input type="checkbox" value="1" name="id"></th>
								<!-- <th width="120"></th> -->
								<th width="*">商品名称</th>
								<th width="100">规格</th>
								<th width="100">数量</th>
								<th width="100">单价</th>
								<th width="100">折扣</th>
								<th width="180">小计</th>
							</tr>
							<tr>
								<td align="center"><input type="checkbox" value="1" name="id"></td>
								<%-- <td><img alt="" src="${pageContext.request.contextPath}/file/pic/aa26da09-60e8-4168-8bf5-49bd65645e1b.jpg" width="46px" height="46px"></td> --%>
								<td>商品A</td>
								<td align="center">30ml</td>
								<td align="center">12</td>
								<td align="center">180</td>
								<td align="center">0.3</td>
								<td></td>
							</tr>
							<tr>
								<td align="center"><input type="checkbox" value="1" name="id"></td>
								<%-- <td><img alt="" src="${pageContext.request.contextPath}/file/pic/aa26da09-60e8-4168-8bf5-49bd65645e1b.jpg" width="46px" height="46px"></td> --%>
								<td>商品A</td>
								<td align="center">30ml</td>
								<td align="center">12</td>
								<td align="center">180</td>
								<td align="center">0.3</td>
								<td></td>
							</tr>
							<tr>
								<td align="center"><input type="checkbox" value="1" name="id"></td>
								<%-- <td><img alt="" src="${pageContext.request.contextPath}/file/pic/aa26da09-60e8-4168-8bf5-49bd65645e1b.jpg" width="46px" height="46px"></td> --%>
								<td>商品A</td>
								<td align="center">30ml</td>
								<td align="center">12</td>
								<td align="center">180</td>
								<td align="center">0.3</td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>		
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
					<th width="80">姓名</th>
					<th width="100">手机号码</th>
					<th width="80">生日</th>
					<th width="50">性别</th>
					<th width="60">身份</th>
					<th width="*">机构名称</th>
					<th width="*">机构地址</th>
					<th width="100">机构代码</th>
					<th width="80">微信号码</th>
					<th width="80">机构级别</th>
					<th width="50">状态</th>
					<th width="50">排序</th>
					<th width="100">操作</th>
				</tr>
				{#foreach $T as row}
				<tr class="tr">
					<td align="center"><input type="checkbox" value="1" name="id"></td>
					<td>{$T.row$index+1}</td>
					<td>{$T.row.username}</td>
					<td>{$T.row.phonenumber}</td>
					<td>{$T.row.birthday}</td>
					<td>{#if $T.row.sex == 1}男{#else}女{#/if}</td>
					<td>{$T.row.identitymemo}</td>
					<td>{$T.row.companyname}</td>
					<td>{$T.row.companypath}</td>
					<td>{$T.row.companycode}</td>
					<td>{$T.row.wechar}</td>
					<td>{$T.row.rank}</td>
					<td>{#if $T.row.isopen == 1}正常{#else}<span style="color:red">禁用</span>{#/if}</td>
					<td>{$T.row.sort}</td>
					<td>操作</td>
				</tr>
				{#/for}
			</tbody>
		</table>
	    -->
	</textarea>
</body>
</html>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/view/order/css/table.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer/pintuer.js"></script>
    <script src="${pageContext.request.contextPath}/js/pintuer/respond.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery-jtemplates.js"></script>
    <script src="${pageContext.request.contextPath}/js/js.validate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/layer2.4/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/util.js" type="text/javascript"></script>
    
    <style type="text/css">
    	.doc-naver {padding-top: 10px;padding-bottom: 10px;}
		.doc-header.fixed-top .doc-naver {padding-top: 10px;padding-bottom: 10px;background-color: #fff;}
		.nav-inline li a {line-height: 22px;}
		.border-back {border-color:#b5cfd9;}
		.admin {width: 100%; padding: 20px;background: #fff;right: 0;bottom: 0;top: 87px;overflow: auto;}
		.list-group, .list-link {border: solid 1px #EED97C;background-color: #fffdf3;}
		.panel {border-top: solid 0}
		.bg-order-1{background-color: #999;}
		.bg-order0{background-color: #f60 ;}
		.bg-order1{background-color: #0ae;}
		.bg-order2{background-color: #0ae;}
		.bg-order3{background-color: #2c7;}
		    
    </style>
    <script type="text/javascript">
    	var pageIndex = 1;
		var pageSize = 10;
		var totalPage = 0;
    	$(function(){
    		//加载数据-订单列表
    		loadData_orderlist();
    		//新增订货单
    		$("#newOrder").click(function(){
    			location.href = "${pageContext.request.contextPath}/order/newOrder.htmls";
    		});
    		//订单号-查询
    		$(".icon-search").click(function(){
    			loadData_orderlist();
    		});
    		//
    		$(".drop-menu li a").click(function(){
    			$("#orderstatus").val($(this).attr("status"));
    			loadData_orderlist();
    		});
    		
    		//日期控件
    		/* laydate({
 				elem: '#ordertime', //'
   				event: 'focus' //响应事件。如果没有传入event，则按照默认的click
   			}); */
    	});
    	
    	//加载数据-订单列表
    	function loadData_orderlist(){
    		var _data = {};
    		_data.orderType = "my";
    		_data.ordernum = $("#ordernum").val();
    		_data.parentid = $("#parentid").val();;
    		_data.ordertime = $("#ordertime").val();
    		_data.orderstatus = $("#orderstatus").val();
    		_data.pageIndex = pageIndex;
    		_data.pageSize = pageSize;
    		$.ajax({
    			async:false,
                url: "${pageContext.request.contextPath}/order/orderlist.htmls",
                data: _data,
                type: "post",
                dataType:"json",
                success: function (json) {
                	totalPage = Math.ceil(json.total/pageSize);
                	$("#orderList").setTemplateURL("${pageContext.request.contextPath}/view/order/tpl/order/orderlist.tpl");
                	$("#orderList").setParam('rowCount', json.total);
	         		$("#orderList").setParam('pageSize', pageSize);
	         		$("#orderList").setParam('pageIndex', pageIndex);
	         		$("#orderList").setParam('totalPage', totalPage);
                	$("#orderList").processTemplate(json.data);
                	//
                	pageSel();
	                pageEnter();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
           });
    	}
    	
    	//翻页
    	function pageClick(sel_page) {
    		pageIndex = sel_page;
    		loadData_orderlist();	//加载数据-订单列表
    	}
    	//输入页码
    	function pageEnter() {
    		$('.ui-pager-inp').bind('keypress',function(event) {
                if(event.keyCode == "13") {
                	if (isInteger($(this).val())) {
                		if ($(this).val() > totalPage || $(this).val() < 1 || $(this).val() == pageIndex) {
                			return false;
                		}
                		else {
                			pageIndex = $(this).val();
                    		loadData_orderlist();	//加载数据-订单列表
                		}
                	}
                	else {
                	}
                    return false;
                }
            });
    	}
    	//切换每页显示条数
    	function pageSel() {
    		$('.pageSel').change(function(){ 
    			var p1=$(this).children('option:selected').val();//这就是selected的值
    			pageIndex = 1;
    			pageSize = p1;
    			loadData_orderlist();	//加载数据-订单列表
    		}) 
    	}
    	//付款
    	function topayment(id){
    		parent.parent.layer.open({
			    type: 2,
			    title:'支付货款',
			    area: ['390px', '290px'],
			    fix: false, //不固定
			    maxmin: false,
			    content: "${pageContext.request.contextPath}/order/dispatch.htmls?page=/view/order/order/payment",
			    success: function(layero,index){
			    	var win = parent.window['layui-layer-iframe' + index].window;
			    	win.setData(id);
			    },
			    btn: ['确 定', '取 消'],
			  	yes: function(index,layero){
			  		var win = parent.window['layui-layer-iframe' + index].window;
			  		var data = win.getData();
			  		if(data.ispay == 1){
			  			parent.parent.layer.close(index);	//关闭窗体
			  			payment(data.orderid);	//付款
			  		}else if(data.ispay == 0){
			  			parent.parent.layer.msg("您的账户已被冻结",{icon:6});
			  		}else if(data.ispay == -1){
			  			parent.parent.layer.msg("您的余额不足，请充值",{icon:6});
			  		}
			  	},
			    end: function(){
			    	//alert(123);
			    }
			});
    	}
    	//
    	function payment(id){
    		$.ajax({
    			async:false,
                url: "${pageContext.request.contextPath}/order/paymentorder.htmls",
                data: {orderid:id},
                type: "post",
                dataType:"text",
                success: function (text) {
                	if(text == "2"){
                		layer.msg("您的订单已付款。",{icon:6});
                		return;
                	}
                	if(text == "1"){
                		layer.msg("付款成功！",{icon:6});
                		loadData_orderlist();//加载数据
                	}else if(text == "0"){
                		layer.msg("付款失败，您的账户已冻结。",{icon:6});
                	}else if(text == "-1"){
                		layer.msg("付款失败，您的账户余额不足。",{icon:6});
                	}
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
           	});
    	}
    	
    	//取消订单
    	function cancleorder(id){
    		var cf = "您确定要取消订单吗";
			layer.confirm(cf, {title:'系统提示',icon:3,
				btn: ['确定','取消'] //按钮
			}, function(index){
				$.ajax({
	    			async:false,
	                url: "${pageContext.request.contextPath}/order/cancelorder.htmls",
	                data: {orderid:id},
	                type: "post",
	                dataType:"text",
	                success: function (text) {
	                	if(text == "2"){
	                		layer.msg("您的订单已发货，不能取消订单。",{icon:6});
	                	}else if(text == "1"){
	                		layer.msg("您的订单已取消。",{icon:6});
	                		loadData_orderlist();//加载数据
	                	}else{
	                		layer.msg("操作失败！",{icon:6});
	                	}
	                },
	                error: function (jqXHR, textStatus, errorThrown) {
	                    alert(jqXHR.responseText);
	                }
	           	});
	   			layer.close(index);
			}, function(){
			});
    	}
    	
    	//确认收货
    	function signorder(id){
    		alert(id);
    	}
    	
    	//订单详情
    	function orderdetails(id){
    		$("#admin_order").slideToggle(800,function(){
    			//alert("滑动向上缩小完毕");
    			
    		});
    		$("#admin_details").slideToggle(800,function(){
    			//alert("滑动向上缩小完毕");
    			loadData_orderdetails(id);
    		});
    	}
    	/*---------订单详情---------*/
    	
    	var total = 0,total_sum = 0;
    	//加载数据-订单详情
    	function loadData_orderdetails(orderid){
    		$.ajax({
    			async:false,
                url: "${pageContext.request.contextPath}/order/orderdetails.htmls",
                data: {orderid:orderid},
                type: "post",
                dataType:"json",
                success: function (json) {
                	var order = json.order;	//订单
                	$("#ordernum_d").html(order.ordernumber);
                	$("#ordertime").html(order.ordertime);
                	$("#ostatus").html(order.orderstatusmemo);
                	disposal(json.products);	//订单详情
                	var address = json.address;	//收货地址
                	var address_str = "收货人："+address.username+"，联系电话："+address.userphone+"，收货地址："+address.userpath;
                	$("#address").html(address_str);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
           	});
    	}
    	
    	//处理数据-订单商品
    	function disposal(data){
    		//全局对象
    		var objArr = new Array();
    		total = 0;total_sum = 0;
    		for(i=0;i<data.length;i++){
    			objArr.push(initializeObj(data[i]));
    		}
    		//加载模板数据
    		$("#proList").setTemplateURL("${pageContext.request.contextPath}/view/order/tpl/order/orderdetails.tpl");
            $("#proList").processTemplate(objArr);
            //
            $("#total").html(formatFloat(total,2));
            $("#total_sum").html(formatFloat(total,2));
    	}
    	
    	//初始数据对象 - 订单商品
    	function initializeObj(data){
    		var obj = {};
    		obj.id = data.id;
    		obj.brandname = data.brandname;
			obj.productname = data.productname;
			obj.productsize = data.productsize;
			obj.price = formatFloat(data.price,2);		//售价
			obj.buyerdis = formatFloat(data.buyerdis,2);	//折扣
			obj.quantity = data.productnum; 	//数量
			var _subtotal = 0;
			if(parseFloat(data.buyerdis) > 0){
				_subtotal = data.price * data.buyerdis * data.productnum;	//小计
			}else{
				_subtotal = data.price * data.productnum;	//小计
			}
			obj.subtotal = formatFloat(_subtotal,2);
			total = parseFloat(total) + parseFloat(obj.subtotal);
			return obj;
    	}
    	
    	//
    	function goback(){
    		$(".admin").slideToggle(800,function(){
    			//alert("滑动向上缩小完毕");
    		});
    	}
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
		<div id="admin_order" class="admin" style="padding: 10px 60px;">
			<div class="padding float-left" style="padding-left: 0px;">
				<form onsubmit="return false;" class="form-inline" method="post">
					<input type="hidden" id="orderstatus" name=""/>
					<div class="button-group">筛选：</div>
					<div class="button-group">
						<ul class="nav nav-menu nav-inline nav-navicon" id="nav-link3">
							<li class="active"><a href="javascript:;" style="padding: 5px 5px;">全部订单<span class="arrow"></span></a>
								<ul class="drop-menu">
									<li><a href="javascript:;" status="">全部订单</a> </li>
									<li><a href="javascript:;" status="0">待支付订单</a> </li>
									<li><a href="javascript:;" status="1">待发货订单</a> </li>
									<li><a href="javascript:;" status="2">已发货订单</a> </li>
									<li><a href="javascript:;" status="3">已签收订单</a> </li>
									<li><a href="javascript:;" status="-1">已取消订单</a> </li>
								</ul>
							</li>
						</ul>
					</div>
					<!-- <div class="form-group">
						<div class="field">
							<input type="text" placeholder="请输入订单号" size="30" name="ordernum" id="ordernum" class="input">
						</div>
					</div>
					<div class="form-group">
						<div class="field">
							<input type="text" placeholder="请输入下单日期" size="30" id="ordertime" class="input">
						</div>
					</div>
					<div class="form-button">
						<button type="submit" class="button icon-search"> 搜 索</button>
					</div> -->
				</form>
			</div>
			<div class="padding float-right">
				<button class="button bg-blue" id="newOrder"><span class="icon-plus"></span> 新 增</button>
			</div>
			<div id="orderList" class="admin-panel">
				
			</div>
		</div>
		<!-- 订单详情 START -->
		<div id="admin_details" class="admin" style="padding: 0px 60px;display: none;">
			<div class="media-body">
				<div class="padding float-left"><h4>订单详情</h4></div>
				<div class="padding float-right"><button onclick="goback()" class="button button bg-blue icon-reply"> 返回</button></div>
			</div>
			<div style="padding-bottom: 20px;">
				<ul class="list-group">
					<li>订单号：<strong id="ordernum_d"></strong>	<label style="padding-left: 30px;" id="ordertime"></label><span id="ostatus" class="tag bg-yellow float-right"></span></li>
					<li>【收货信息】<span id="address"></span></li>
				</ul>
			</div>
			<h4>订单商品</h4>
			<hr class="">
			<div style="padding-bottom: 20px;">
				<div id="proList" class="admin-panel">
				</div>
				<div class="text-right panel" style="padding: 30px 50px;">
					<div>合计：￥<span id="total">0.00</span></div>
					<br/>
					<div>应付总额：￥<span style="color: red !important" id="total_sum">0.00</span></div>
				</div>
			</div>
			<h4>物流信息</h4>
			<hr class="">
			<div class="table-responsive">
				<table class="table table-hover">
					<tbody><tr>
						<th style="text-align: left;" width="180">处理时间</th>
						<th style="text-align: left;" width="*">处理信息</th>
						<th width="180">操作人</th>
					</tr>
					<tr>
						<td style="text-align: left;">2016-07-20 12:36:13</td>
						<td style="text-align: left;">您的订单已经拣货完毕，待出库交付申通快递，运单号为229111673599</td>
						<td>商家</td>
					</tr>
					<tr>
						<td style="text-align: left;">2016-07-20 19:30:13</td>
						<td style="text-align: left;">由广东东莞南城西平分部 发往 广东东莞中转部</td>
						<td>申通快递</td>
					</tr>
				</tbody></table>
			</div>
		</div>
		<!-- 订单详情  END -->
	</div>
	<!--底部-->
	<div class="layout fixed-bottom bg-white">
		<div class="border-bottom padding-bottom">
			<div class="text-center height-big text-small">
				<strong>版权所有 亚普软件(北京)有限公司&copy; <a href="#"></a> All Rights Reserved.</strong>
			</div>
		</div>
	</div>
	
</body>
</html>
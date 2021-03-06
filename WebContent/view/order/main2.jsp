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
    <title>众恒信和采购分销管理平台</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/view/order/css/c.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/view/order/js/jquery.layout/jquery-ui-latest.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/view/order/js/jquery.layout/jquery.layout-latest.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/view/order/js/commonApp.js"></script>
    <script src="${pageContext.request.contextPath}/js/layer2.4/layer.js" type="text/javascript"></script>
    
    <!-- <link type="image/x-icon" href="/favicon.ico" rel="shortcut icon" />
    <link href="/favicon.ico" rel="bookmark icon" /> -->
    
    <style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }    

    </style>
    
    <script type="text/javascript">
		var myLayout;
		var curInd = -1;
		$(function() {
			myLayout = $('body').layout({
				west__size:					96
			,	west__spacing_closed:		0
			,	west__spacing_open:		0
			,	west__togglerLength_closed:	100
			,	west__togglerContent_closed:""
			,	west__togglerTip_closed:	""
			,	west__sliderTip:			""
			,	west__slideTrigger_open:	"mouseover"
			,	center__maskContents:		true
			});
			
			$(".ui-layout-west").css("z-index",999);
			
			$(".side-menu  a").click(function(){
    			var funcode = $(this).attr("funcode");
    			curInd = $(this).attr("curInd");
    			var url = funcode;
    			if (url == 'index') {
    				$("#mainFrame").attr("src","${pageContext.request.contextPath}/view/system/h.jsp");
    			}
    			else {
    				$("#mainFrame").attr("src",url);
    			}
    			Public.Ui.Menu.curInd = curInd;
    			
    			/* $("#navbar1 li").removeClass("active");
    			$(this).parent().addClass("active"); */
    		});
		})
		
		function removeMenuCurrent() {
			$(".side-menu-li").removeClass("current");
			Public.Ui.Menu.curInd = -1;
		}
		
		function quit() {
			if(confirm("真的要退出系统吗?")) {
	            window.location.href = "${pageContext.request.contextPath}/logout.htmls";
	        };
	    }
	</script>
</head>

<body>
	<div class="ui-layout-west">
		<div class="side-wrap">
			<h1 class="logo">
				<a title="集丽科技, 让美丽更简单！" href="#"><img src="${pageContext.request.contextPath}/view/order/images/logo.png" alt="集丽科技"></a>
			</h1>
			<div class="side-menu">
				<ul>
					<li class="pr side-menu-li li-crop menu1" id="order" code="WBM_ORDER">
						<a class="order side-menu-a new-con-p" target="mainFrame" href="javascript:;" funcode="${pageContext.request.contextPath}/order/dispatch.htmls?page=/view/order/order/myorderlist">
							<i class="icon"></i>订单
						</a>
						<div class="float-menu" style="top: 0px;">
							<ul class="sec-nav">
								<li class="sec-nav-li menu2" code="WBM_ORDER_INDENT">
									<a class="sec-nav-a new-con" target="mainFrame" funcode="${pageContext.request.contextPath}/order/dispatch.htmls?page=/view/order/order/createorder" href="javascript:;">采购</a>
								</li>
								<li class="sec-nav-li menu2" code="WBM_ORDER_RETURNED">
									<a class="sec-nav-a new-con" href="http://corp.dinghuo123.com/order/returnOrder?action=list">我的订单</a>
								</li>
								<li class="sec-nav-li menu2" code="WBM_ORDER_OUTSTOCK">
									<a class="sec-nav-a new-con" target="mainFrame" href="content.html">客户订单</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="pr side-menu-li li-crop menu1" id="customer" code="WBM_CUSTOMER">
						<a class="customer side-menu-a new-con-p" href="javascript:;" curInd="1" funcode="${pageContext.request.contextPath}/order/dispatch.htmls?page=/view/order/user/userList">
							<i class="icon"></i>客户
						</a>
						<div class="float-menu" style="top: 0px;">
							<ul class="sec-nav">
								<li class="sec-nav-li menu2" code="WBM_CUSTOMER_LIST">
									<a class="sec-nav-a new-con" href="javascript:;" curInd="1" funcode="${pageContext.request.contextPath}/order/dispatch.htmls?page=/view/order/user/userList">客户列表</a>
								</li>
								<li class="sec-nav-li menu2" code="WBM_CUSTOMER_LEVEL">
									<a class="sec-nav-a new-con" href="http://corp.dinghuo123.com/customer/type?action=list">客户级别设置</a>
								</li>
							</ul>
						</div>
					</li>
					<li class="pr side-menu-li li-crop menu1" id="product" code="WBM_PRODUCT">
						<a class="product side-menu-a new-con-p" href="http://corp.dinghuo123.com/product/product?action=list&amp;status=0">
							<i class="icon"></i>商品<span class="ui-new-func"></span>
						</a>
						<div class="float-menu" style="display: none; top: 0px;">
							<ul class="sec-nav clearfix sec-nav-flow" style="width: 304px;">
								<li class="sec-nav-li sec-nav-li-flow" style="height: 228px;">
									<a class="sec-nav-a li-a-color" href="javascript:;">商品管理</a>
									<ul class="third-nav-ul">
										<li class="third-nav-li menu2" code="WBM_PRODUCT_LIST">
											<a class="third-nav-a new-con" href="http://corp.dinghuo123.com/product/product?action=list&amp;status=0">商品列表</a>
										</li>
										<li class="third-nav-li menu2" code="WBM_PRODUCT_TYPE">
											<a class="third-nav-a new-con" href="http://corp.dinghuo123.com/product/type?action=list">商品类别</a>
										</li>
										<li class="third-nav-li menu2" code="WBM_PRODUCT_UNIT">
											<a class="third-nav-a new-con" href="http://corp.dinghuo123.com/product/unit?action=list">计量单位</a>
										</li>
									</ul>
								</li>
								<li class="sec-nav-li sec-nav-li-flow" style="height: 228px;">
									<a class="sec-nav-a li-a-color" href="javascript:;">促销管理</a>
									<ul class="third-nav-ul">
										<li class="third-nav-li menu2" code="WBM_PRODUCT_PROMOTION">
											<a class="third-nav-a new-con" href="http://corp.dinghuo123.com/product/promotion?action=productStrategyList">商品促销</a>
										</li>
										<li class="third-nav-li menu2" code="WBM_PRODUCT_ORDER_PROMOTION">
											<a class="third-nav-a new-con" href="http://corp.dinghuo123.com/product/promotion?action=orderStrategyList">订单促销</a>
										</li>
										<li class="third-nav-li menu2" code="WBM_PRODUCT_MIX_PROMOTION">
											<a class="third-nav-a new-con" href="http://corp.dinghuo123.com/product/promotion?action=complexStrategyList">组合促销<span class="ui-new-func"></span></a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</li>
					<li class="pr side-menu-li li-crop menu1" id="pay" code="WBM_FUND">
						<a class="pay side-menu-a new-con-p" href="http://corp.dinghuo123.com/pay/payment?action=list">
							<i class="icon"></i>资金
						</a>
						<div class="float-menu" style="display: none; top: 0px;">
							<ul class="sec-nav clearfix sec-nav-flow" style="width: 221px;">
								<li class="sec-nav-li sec-nav-li-flow" style="height: 126px;">
									<a class="sec-nav-a li-a-color" href="javascript:;">资金管理</a>
									<ul class="third-nav-ul">
										<li class="third-nav-li menu2" code="WBM_FUND_RECEIPT_CONFIRM">
											<a class="third-nav-a new-con" target="mainFrame" href="${pageContext.request.contextPath}/order/dispatch.htmls?page=/view/order/account">资金账户</a>
										</li>
										<li class="third-nav-li menu2" code="WBM_FUND_ONLINE_PAYMENT">
											<a class="third-nav-a new-con" href="http://corp.dinghuo123.com/pay/onlinePayAccount?action=onlinePayAccountManage">在线支付</a>
										</li>
										<li class="third-nav-li menu2" code="WBM_FUND_BANK_ACCOUNT">
											<a class="third-nav-a new-con" href="http://corp.dinghuo123.com/pay/companyBank?action=list">银行账号</a>
										</li>
									</ul>
								</li>
								<li class="sec-nav-li sec-nav-li-flow" style="height: 126px;">
									<a class="sec-nav-a li-a-color" href="javascript:;">资金报表</a>
									<ul class="third-nav-ul">
										<li class="third-nav-li menu2" code="WBM_FUND_INCOME_RECORD">
											<a class="third-nav-a new-con" href="">资金账户</a>
										</li>
										<li class="third-nav-li menu2" code="WBM_FUND_INCOME_STATISTICS">
											<a class="third-nav-a new-con" href="http://corp.dinghuo123.com/pay/payment?action=queryPaymentReport">订单收款统计</a>
										</li>
										<li class="third-nav-li menu2" code="WBM_FUND_SEND_STATISTICS">
											<a class="third-nav-a new-con" href="http://corp.dinghuo123.com/pay/logisticsReconciliation?action=list">发货统计</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</li>
					<li class="pr side-menu-li li-crop menu1" id="message" code="WBM_NOTIFY">
						<a class="message side-menu-a new-con-p" href="http://corp.dinghuo123.com/message/notification?action=list">
							<i class="icon"></i>通知
						</a>
						<div class="float-menu" style="display: none; top: 0px; margin-top: 0px;">
							<ul class="sec-nav clearfix sec-nav-flow" style="width: 249px;">
								<li class="sec-nav-li sec-nav-li-flow" style="height: 126px;">
									<a class="sec-nav-a li-a-color" href="javascript:;">通知管理</a>
									<ul class="third-nav-ul">
										<li class="third-nav-li menu2" code="WBM_NOTIFY_NOTICE">
											<a class="third-nav-a new-con" href="http://corp.dinghuo123.com/message/notification?action=list">通知公告</a>
										</li>
										<li class="third-nav-li menu2" code="WBM_NOTIFY_AD">
											<a class="third-nav-a new-con" href="http://corp.dinghuo123.com/generalize/view?action=list">广告发布</a>
										</li>
										<li class="third-nav-li menu2" code="WBM_NOTIFY_CLASSIFY">
											<a class="third-nav-a new-con" href="http://corp.dinghuo123.com/message/notificationType?action=list">通知分类管理</a>
										</li>
									</ul>
								</li>
								<li class="sec-nav-li sec-nav-li-flow" style="height: 126px;">
									<a class="sec-nav-a li-a-color" href="javascript:;">手机短信</a>
									<ul class="third-nav-ul">
										<li class="third-nav-li menu2" code="WBM_NOTIFY_SMS_RECHARGE">
											<a class="third-nav-a new-con" href="http://corp.dinghuo123.com/message/sms_recharge">短信充值</a>
										</li>
										<li class="third-nav-li menu2" code="WBM_NOTIFY_SMS_SETTING">
											<a class="third-nav-a new-con" href="http://corp.dinghuo123.com/message/sms_setting">短信发送设置</a>
										</li>
									</ul>
								</li>
							</ul>
						</div>
					</li>
					<li class="pr side-menu-li li-crop menu1" id="report" code="WBM_REPORT">
						<a class="report side-menu-a new-con-p" href="http://corp.dinghuo123.com/report/report?action=load&amp;reportType=business&amp;statisticsType=2&amp;dateSegment=4">
							<i class="icon"></i>报表
						</a>
						<div class="float-menu" style="top: 0px; margin-top: 0px;">
							<ul class="sec-nav">
								<li class="sec-nav-li menu2" code="WBM_REPORT_ORDER">
									<a class="sec-nav-a new-con" href="http://corp.dinghuo123.com/report/report?action=load&amp;reportType=business&amp;statisticsType=2&amp;dateSegment=4">订单统计报表</a>
								</li>
								<li class="sec-nav-li menu2" code="WBM_REPORT_AREA">
									<a class="sec-nav-a new-con" href="http://corp.dinghuo123.com/report/report?action=load&amp;reportType=area&amp;statisticsType=5&amp;dateSegment=4">地区统计报表</a>
								</li>
								<li class="sec-nav-li menu2" code="WBM_REPORT_SALE">
									<a class="sec-nav-a new-con" href="http://corp.dinghuo123.com/report/report?action=load&amp;reportType=product&amp;statisticsType=10&amp;dateSegment=4">商品销售报表</a>
								</li>
								<li class="sec-nav-li menu2" code="WBM_REPORT_INDENT">
									<a class="sec-nav-a new-con" href="http://corp.dinghuo123.com/report/report?action=load&amp;reportType=customer&amp;statisticsType=8&amp;dateSegment=4">客户订货报表</a>
								</li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<iframe id="mainFrame" name="mainFrame" class="ui-layout-center" width="100%" height="600" frameborder="0" scrolling="auto" src="${pageContext.request.contextPath}/order/dispatch.htmls?page=/view/order/index"></iframe>
</body>
</html>
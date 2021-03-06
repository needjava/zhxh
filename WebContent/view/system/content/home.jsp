<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <title></title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/boot.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/json2.js"></script>
    <style type="text/css">
	    body {
	        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
	    }
	    .key {
	        background:url(${pageContext.request.contextPath}/images/key.png) no-repeat;width:32px;height:32px;
	    }
	    .setting {
	        background:url(${pageContext.request.contextPath}/images/setting.png) no-repeat;width:32px;height:32px;
	    }
	    .database {
	        background:url(${pageContext.request.contextPath}/images/database.png) no-repeat;width:32px;height:32px;
	    }
	    .print {
	        background:url(${pageContext.request.contextPath}/images/print.png) no-repeat;width:32px;height:32px;
	    }
	    .indexer {
	        background:url(${pageContext.request.contextPath}/images/Notes_Large.png) no-repeat;width:32px;height:32px;
	    }
	    .subject{
	        background:url(${pageContext.request.contextPath}/images/icon/subject.png) no-repeat;width:32px;height:32px;
	    }
	    .faq{
	        background:url(${pageContext.request.contextPath}/images/icon/faq.png) no-repeat;width:32px;height:32px;
	    }
	    .linkus{
	        background:url(${pageContext.request.contextPath}/images/icon/linkus.png) no-repeat;width:32px;height:32px;
	    }
	    .homepic{
	        background:url(${pageContext.request.contextPath}/images/icon/picture.png) no-repeat;width:32px;height:32px;
	    }
	    .job{
	        background:url(${pageContext.request.contextPath}/images/icon/job.png) no-repeat;width:32px;height:32px;
	    }
	    .join{
	        background:url(${pageContext.request.contextPath}/images/icon/join.png) no-repeat;width:32px;height:32px;
	    }
	    .partner{
	        background:url(${pageContext.request.contextPath}/images/icon/partner.png) no-repeat;width:32px;height:32px;
	    }
	    .policy{
	        background:url(${pageContext.request.contextPath}/images/icon/policy.png) no-repeat;width:32px;height:32px;
	    }
	    .law{
	        background:url(${pageContext.request.contextPath}/images/icon/law.png) no-repeat;width:32px;height:32px;
	    }
	    .news{
	        background:url(${pageContext.request.contextPath}/images/icon/news.png) no-repeat;width:32px;height:32px;
	    }
	    .text{
	        background:url(${pageContext.request.contextPath}/images/icon/text.png) no-repeat;width:32px;height:32px;
	    }
	    .case{
	        background:url(${pageContext.request.contextPath}/images/icon/case.png) no-repeat;width:32px;height:32px;
	    }
	    .spec{
	        background:url(${pageContext.request.contextPath}/images/icon/spec.png) no-repeat;width:32px;height:32px;
	    }
    </style>
    
    <script type="text/javascript">
    
	    var dataList = [];
	    
	    var t1 = {};
	    t1.id = "right";
	    t1.text = "内容管理";
	    dataList.push(t1);
	    
	    var t2 = {};
	    t2.id = "homepic";
	    t2.pid = "right";
	    t2.text = "首图轮播";
	    t2.iconCls = "homepic";
	    t2.url = "${pageContext.request.contextPath}/common/dispatch.htmls?page=/view/system/content/homePiclist";
	    t2.iconPosition = "top";
	    dataList.push(t2);
	    
	    var t3 = {};
	    t3.id = "subject";
	    t3.pid = "right";
	    t3.text = "制作专题";
	    t3.iconCls = "subject";
	    t3.url = "${pageContext.request.contextPath}/common/dispatch.htmls?page=/view/system/content/publicList&param={'ptype':'subject'}";
	    t3.iconPosition = "top";
	    dataList.push(t3);
    
	    var t4 = {};
	    t4.id = "faq";
	    t4.pid = "right";
	    t4.text = "FAQ";
	    t4.iconCls = "faq";
	    t4.url = "${pageContext.request.contextPath}/common/dispatch.htmls?page=/view/system/content/publicList&param={'ptype':'faq'}";
	    t4.iconPosition = "top";
	    dataList.push(t4);
    
	    var t5 = {};
	    t5.id = "linkus";
	    t5.pid = "right";
	    t5.text = "联系我们";
	    t5.iconCls = "linkus";
	    t5.url = "${pageContext.request.contextPath}/common/dispatch.htmls?page=/view/system/content/publicList&param={'ptype':'lxwm'}";
	    t5.iconPosition = "top";
	    dataList.push(t5);
	    
	    var t6 = {};
	    t6.id = "job";
	    t6.pid = "right";
	    t6.text = "工作招聘";
	    t6.iconCls = "job";
	    t6.url = "${pageContext.request.contextPath}/common/dispatch.htmls?page=/view/system/content/publicList&param={'ptype':'job'}";
	    t6.iconPosition = "top";
	    dataList.push(t6);
	    
	    var t7 = {};
	    t7.id = "join";
	    t7.pid = "right";
	    t7.text = "区域合作";
	    t7.iconCls = "join";
	    t7.url = "${pageContext.request.contextPath}/common/dispatch.htmls?page=/view/system/content/publicList&param={'ptype':'join'}";
	    t7.iconPosition = "top";
	    dataList.push(t7);
	    
	    var t8 = {};
	    t8.id = "policy";
	    t8.pid = "right";
	    t8.text = "隐私政策";
	    t8.iconCls = "policy";
	    t8.url = "${pageContext.request.contextPath}/common/dispatch.htmls?page=/view/system/content/publicList&param={'ptype':'policy'}";
	    t8.iconPosition = "top";
	    dataList.push(t8);
	    
	    var t9 = {};
	    t9.id = "partner";
	    t9.pid = "right";
	    t9.text = "合作伙伴";
	    t9.iconCls = "partner";
	    t9.url = "${pageContext.request.contextPath}/common/dispatch.htmls?page=/view/system/content/publicList&param={'ptype':'partner'}";
	    t9.iconPosition = "top";
	    dataList.push(t9);
	    
	    var t10 = {};
	    t10.id = "law";
	    t10.pid = "right";
	    t10.text = "法律声明";
	    t10.iconCls = "law";
	    t10.url = "${pageContext.request.contextPath}/common/dispatch.htmls?page=/view/system/content/publicList&param={'ptype':'law'}";
	    t10.iconPosition = "top";
	    dataList.push(t10);

	    var t11 = {};
	    t11.id = "newshy";
	    t11.pid = "right";
	    t11.text = "行业新闻";
	    t11.iconCls = "news";
	    t11.url = "${pageContext.request.contextPath}/common/dispatch.htmls?page=/view/system/content/publicList&param={'ptype':'news_hy'}";
	    t11.iconPosition = "top";
	    dataList.push(t11);
        
        var t12 = {};
	    t12.id = "newsqy";
	    t12.pid = "right";
	    t12.text = "企业新闻";
	    t12.iconCls = "news";
	    t12.url = "${pageContext.request.contextPath}/common/dispatch.htmls?page=/view/system/content/publicList&param={'ptype':'news_qy'}";
	    t12.iconPosition = "top";
	    dataList.push(t12);
        
        var t13 = {};
	    t13.id = "newssp";
	    t13.pid = "right";
	    t13.text = "商品新闻";
	    t13.iconCls = "news";
	    t13.url = "${pageContext.request.contextPath}/common/dispatch.htmls?page=/view/system/content/publicList&param={'ptype':'news_sp'}";
	    t13.iconPosition = "top";
	    dataList.push(t13);
        
        var t14 = {};
	    t14.id = "article";
	    t14.pid = "right";
	    t14.text = "美容文章";
	    t14.iconCls = "text";
	    t14.url = "${pageContext.request.contextPath}/common/dispatch.htmls?page=/view/system/content/publicList&param={'ptype':'mrwz'}";
	    t14.iconPosition = "top";
	    dataList.push(t14);
        
        var t15 = {};
	    t15.id = "case";
	    t15.pid = "right";
	    t15.text = "案例库";
	    t15.iconCls = "case";
	    t15.url = "${pageContext.request.contextPath}/common/dispatch.htmls?page=/view/system/content/publicList&param={'ptype':'case'}";
	    t15.iconPosition = "top";
	    dataList.push(t15);
        
        var t16 = {};
	    t16.id = "spec";
	    t16.pid = "right";
	    t16.text = "下载专区";
	    t16.iconCls = "spec";
	    t16.url = "${pageContext.request.contextPath}/common/dispatch.htmls?page=/view/system/content/specList";
	    t16.iconPosition = "top";
	    dataList.push(t16);
    	$(function(){
    		mini.parse();
            var leftTree = mini.get("leftTree");
            leftTree.loadList(dataList,"id","pid");
            leftTree.selectNode("homepic");
        })
        
        function onItemSelect(e) {
    		var iframe = document.getElementById("mainframe");
            var item = e.item;
            iframe.src = item.url;
        }
        
    </script>
</head>
<body>
	<div class="mini-splitter" style="width:100%;height:100%;">
		<div size="200" showCollapseButton="true">
	        <div id="leftTree" class="mini-outlookmenu"  onitemselect="onItemSelect" borderStyle="border:0" ></div>
	    </div>
		<div showCollapseButton="false" >
		    	<iframe id="mainframe" src="" width="100%" height="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="auto" allowtransparency="yes"></iframe>
		</div>
	    
	</div>
</body>
</html>
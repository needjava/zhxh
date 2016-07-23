// JavaScript 公共工具类

function trim(str){ //删除左右两端的空格
	return str.replace(/(^\s*)|(\s*$)/g, "");
}
function ltrim(str){ //删除左边的空格
	return str.replace(/(^\s*)/g,"");
}
function rtrim(str){ //删除右边的空格
	return str.replace(/(\s*$)/g,"");
}


//获取滚动条位置，存入cookie
function jscroll(classname,name) {
	var jscroll = $('.'+classname).scrollTop();
	if (name == null) {
		setCookie('jscroll',jscroll);
	}
	else {
		setCookie(name,jscroll);
	}
}

//获取滚动条位置，存入cookie
function setCroll(object,name) {
	var jscroll = $(object).scrollTop();
	if (name == null) {
		setCookie('jscroll',jscroll);
	}
	else {
		setCookie(name,jscroll);
	}
}


//设置cookie
function setCookie(name,value){
    var Days = 30;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

//读取cookies
function getCookie(name){
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
    if(arr=document.cookie.match(reg))
        return (arr[2]);
    else
        return null;
}
//删除cookies
function delCookie(name){
    var exp = new Date();
    exp.setTime(exp.getTime() - 1);
    var cval=getCookie(name);
    if(cval!=null)
        document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}

function getRootPath_web() {
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath = window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht = curWwwPath.substring(0, pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return (localhostPaht + projectName);
}




//function sessionOut1(data) {
//	if(data.toString().indexOf("页面过期") > 0 ) {
//		alert("您已经太长时间没有操作,请重新登录。");
//		window.top.location.href=getRootPath_web() + "/login.do";
//	}
//	return false;
//}
//
//$(function(){
//	$.ajaxSetup({
//	    contentType:"application/x-www-form-urlencoded;charset=utf-8",
//	    cache:false,
//	    complete:function(XMLHttpRequest,textStatus){
//	    	var sessionstatus=XMLHttpRequest.getResponseHeader("sessionstatus"); //通过XMLHttpRequest取得响应头，sessionstatus，  
//	    	alert(sessionstatus + "66");
//	        if(sessionstatus=="timeout"){
//	        	alert("登录超时,请重新登录！");
//	            //如果超时就处理 ，指定要跳转的页面
//	            window.top.location.href = getRootPath_web() + "/login.do";
//	            //window.location.replace(webPath.webRoot + "account/login");   
//	        }   
//	    }   
//	});
//})

$.ajaxSetup({
    contentType:"application/x-www-form-urlencoded;charset=utf-8",
    cache:false,
    async: false,
    complete:function(XMLHttpRequest,textStatus){
    	var sessionstatus=XMLHttpRequest.getResponseHeader("sessionstatus"); //通过XMLHttpRequest取得响应头，sessionstatus，  
        if(sessionstatus=="timeout"){
        	alert("登录超时,请重新登录！");
            //如果超时就处理 ，指定要跳转的页面
            window.top.location.href = getRootPath_web() + "/login.do";
            //window.location.replace(webPath.webRoot + "account/login");   
        }   
    }   
});


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

	<style type="text/css">
	    body{
	        margin:0;padding:0;border:0;width:50%;overflow:hidden;
	    }    
    </style>
    
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/videojs_5.10.4/video-js.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/boot.js"></script>
	<script src="${pageContext.request.contextPath}/js/videojs_5.10.4/video.js"></script>
	<script src="${pageContext.request.contextPath}/js/videojs_5.10.4/videojs-mux.js"></script>
	
</head>
<body>
		<video id="preview-player" class="video-js vjs-fluid placeholder vjs-big-play-centered" controls preload="auto" poster=""  data-setup="{}">
		    <source src="http://assets3.ign.com/videos/zencoder/2016/06/15/960/7080c56a76e2b74ec8ecfe4c224441d4-1500000-1466028542-w.mp4" type="video/mp4"></source>
		    <source src="http://vjs.zencdn.net/v/oceans.webm" type="video/webm"></source>
		    
		    <p class="vjs-no-js">要查看此视频请启用JavaScript，并考虑升级到现代高版本Web浏览器。</p>
		</video>
		
		<!-- <video id="my-video" class="video-js vjs-fluid placeholder vjs-big-play-centered" controls preload="auto" width="640" height="264"
		  poster="" data-setup="{}">
		    <source src="http://vjs.zencdn.net/v/oceans.mp4" type='video/mp4'>
		    <source src="http://vjs.zencdn.net/v/oceans.webm" type='video/webm'>
		    <p class="vjs-no-js">
		      To view this video please enable JavaScript, and consider upgrading to a web browser that
		      <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
		    </p>
		  </video> -->
	</div>
</body>
</html>
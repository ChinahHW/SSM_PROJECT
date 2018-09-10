<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>VIDEO</title>
<link href="${pageContext.request.contextPath }/app/style/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath }/app/style/css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<script src="${pageContext.request.contextPath }/app/style/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Cinema Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--webfont-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
<meta charset="utf-8">
	<title>Video.js 7.0</title>
	<link href="${pageContext.request.contextPath }/app/style/css/video-js.min.css" rel="stylesheet">
	<style>
body {
	background-color: #191919
}
.m {
	width: 960px;
	height: 400px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 100px;
}
</style>
</head>
<body>
	<!-- header-section-starts -->
	<div class="full">
			<div class="menu">
				<ul>
					<li><a href="index"><div class="hm"><i class="home1"></i><i class="home2"></i></div></a></li>
					<li><a href="review"><div class="cat"><i class="watching"></i><i class="watching1"></i></div></a></li>
					<li><a class="active" href="video"><div class="video"><i class="videos"></i><i class="videos1"></i></div></a></li>
					
				</ul>
			</div>
		<div class="main">
		<div class="error-content">
			<div class="top-header span_top">
				<div class="logo">
					<a href="index.html"><img src="http://localhost:8080/images/logo.png" alt="" /></a>
					<p>Movie Theater</p>
				</div>
				<div class="search v-search">
					<form action="${pageContext.request.contextPath}/findMovie">
						<input type="text" id="condition" name="condition"/>
						<input type="submit" value="">
					</form>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="m">
			<iframe src="${url }" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true" height="400px" width="960px"> </iframe>
    </div>
	<div class="footer">
		<h6>Disclaimer : </h6>
		<p class="claim">This is a freebies and not an official website, I have no intention of disclose any movie, brand, news.My goal here is to train or excercise my skill and share this freebies.</p>
		<a href="example@mail.com">example@mail.com</a>
		<div class="copyright">
			<p>Copyright &copy; 2015.Company name All rights reserved.<a target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a> - More Templates <a href="http://www.cssmoban.com/" target="_blank" title="手机网站模板">手机网站模板</a> </p>
		</div>
	</div>	
	</div>
	<div class="clearfix"></div>
	</div>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Reviews</title>
<link href="${pageContext.request.contextPath }/app/style/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath }/app/style/css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath }/app/style/css/page.css" rel="stylesheet" type="text/css" media="all" />
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
</head>
<body>
<script type="text/javascript">
$(function(){
	var cstate = true;
	if('${param.p}'!=null && '${param.p}'!=''){
		var cpage = '${param.p}';
		var cstate = true;
	}else{
		var cpage = 1;
		var cstate = false;
	}
	
	document.getElementById("btn"+cpage).className = "btn active";
})
function collect(movieId){
	var url = "${pageContext.request.contextPath}/collect";
	var data = {"movieId":movieId};
	$.post(url,data,function(result){
		if(result=="go to login"){
			window.location.href='${pageContext.request.contextPath}/getLogin';
		}
		alert(result);
	});
}
</script>
	<!-- header-section-starts -->
	<div class="full">
			<div class="menu">
				<ul>
					<li><a href="index"><div class="hm"><i class="home1"></i><i class="home2"></i></div></a></li>
					<li><a class="active" href="review"><div class="cat"><i class="watching"></i><i class="watching1"></i></div></a></li>
					<li><a href="video"><a href="video"><div class="video"><i class="videos"></i><i class="videos1"></i></div></a></li>
					
				</ul>
			</div>
		<div class="main">
		<div class="review-content">
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
			<div class="reviews-section">
				<h3 class="head">Movie Reviews</h3>
					<div class="col-md-9 reviews-grids">
						<div class="review" id="review">
							<c:forEach items="${movies }" var="movie">
								<div class="movie-pic"><a href="${pageContext.request.contextPath}/detail?id=${movie.id}">
								<img src="http://localhost:8080/images/${movie.picture}" alt='' /></a></div>
								<div class="review-info"><a class="span" href="single.html"><i>${movie.name }</i></a>
								<p class="dirctr"><a href=""></a>${movie.time }</p>
								<p class='ratingview'>Critic's Rating:</p>
								<p class='ratingview'>&nbsp;3.5/5</p><div class='clearfix'></div><p class='ratingview c-rating'>Avg Readers' Rating:</p>
								<p class='ratingview c-rating'>&nbsp; 3.3/5</p><div class='clearfix'></div><div class='yrw'><div class='rtm text-center'><a onclick='collect(${movie.id})'>COLLECT IT</a>
								</div><div class='wt text-center'><a href='${pageContext.request.contextPath}/video?url=${movie.url}'>WATCH THIS TRAILER</a></div><div class='clearfix'></div>
								</div><p class='info'>CAST:&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Will Smith, Margot Robbie, Adrian Martinez, Rodrigo Santoro, BD Wong, Robert Taylor</p>
								<p class='info'>DIRECTION: &nbsp;&nbsp;&nbsp;&nbsp;Glenn Ficarra, John Requa</p><p class='info'>GENRE:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Crime</p>
								<p class='info'>DURATION:&nbsp;&nbsp;&nbsp; &nbsp; 1 hour 45 minutes</p></div><div class='clearfix'></div>
							</c:forEach>
							<div id="pagination">
							
							<div style="text-align: center" >
								<c:forEach items="${page }" var="p">
								<a href="${pageContext.request.contextPath}/findMovie?p=${p}&condition=${condition}" class="btn" id="btn${p}">${p }</a>
							</c:forEach>
								<c:if test="${param.p<page.size() }"><a href="${pageContext.request.contextPath}/findMovie?p=${param.p+1}&condition=${condition}" class="btn">Next »</a></c:if>
                                <c:if test="${param.p==page.size() }"><a href="${pageContext.request.contextPath}/findMovie?p=${param.p}&condition=${condition}" class="btn">Next »</a></c:if>
                                <a href="${pageContext.request.contextPath}/findMovie?p=${page.size()}&condition=${condition}" class="btn">Last »</a>
                            </div>
							</div>
							
						</div>
					</div>
					
				
			</div>
			<!---->
				
				<!---->

					</div>

					<div class="clearfix"></div>
			</div>
			</div>
			<div id="fill" style="width: 100%; height: 100%; background-color: #000; position: absolute; top: 0px; left: 0px; opacity: 0.3; display: none; z-index: 100"></div>
	
</html>
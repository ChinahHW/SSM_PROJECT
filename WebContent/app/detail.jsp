<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Detail</title>
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
</head>
<body>
<script type="text/javascript">
document.onclick=Hanlder;
var id;
function Hanlder(e){
	e = e || event;
	var tag = e.srcElement || e.target;
	if(tag.id){
		id = tag.id;
	}
}
$(function(){
	$(document).on("click",".reply",function(){
		var height = document.body.offsetHeight-1000;
		$('html,body').animate({scrollTop: height},1000);
		var url = "${pageContext.request.contextPath}/getInfo";
		var data = {"userid":id};
		$.post(url,data,function(result){
			if(result==null || result==""){
				alert("go to login");
				window.location.href='${pageContext.request.contextPath}/getLogin';
			}
			$("#EnterName").val(result[0].name+" send to "+result[1].name);
			$("#EnterSex").val(result[0].sex);
			$("#Subject").val("未命名主题");
		});
		return false;
    })
    
    $(document).on("click",".agree",function(){
    	var url = "${pageContext.request.contextPath}/agree";
		var data = {"commentid":id};
		$.post(url,data,function(result){
			if(result==null || result==""){
				alert("go to login");
				window.location.href='${pageContext.request.contextPath}/getLogin';
			}else if(result=="success"){
				$("#"+id).text(parseInt($("#"+id).text())+1);
			}else if (result=="del success") {
				$("#"+id).text(parseInt($("#"+id).text())-1);
			}
		})
		return false;
    });
    
	var url = "${pageContext.request.contextPath}/getHistory";
	var data = {"movieid":'${movie.id}'};
	var str = "";
	$.post(url,data,function(result){
		for(var i=0;i<result.length;i++){
			str += "<li><a href='${pageContext.request.contextPath}/friend?friendid="+result[i].id+"'><img src='http://localhost:8080/images/"
			+result[i].picture+"' alt='' /></a><p>"+result[i].name+"</p></li> ";
		}
		$("#history").html("<ul><h3>他（她）们也在看</h3>"+str+"<div class='clearfix'></div></ul>");
	});
	
	
	var url2 = "${pageContext.request.contextPath}/getComment";
	var data2 = {"movieid":'${movie.id}'};
	var str2 = "";
	$.post(url2,data2,function(result2){
			for(var i=0;i<Object.keys(result2.users).length;i++){
				str2 += "<ul><li class='ent'><a href='${pageContext.request.contextPath}/friend?friendid="+result2.users[i].id+"'>"
					+"<img src='http://localhost:8080/images/"+result2.users[i].picture+"' alt='' /></a><p style='text-align: center'>"+result2.users[i].name+"</p></li><li>"
					+"<a href='${pageContext.request.contextPath}/friend?friendid="+result2.users[i].id+"'>"
					+result2.comments[i].content
					+"</a></li><div class='clearfix'></div></ul>";
			}
		$("#comment").html("<h3>最近评论</h3>"+str2);
	});
	
	var url3 = "${pageContext.request.contextPath}/getBest";
	var data3 = {"movieid":'${movie.id}',"limit":1};
	var str3 = "";
	$.post(url3,data3,function(result){
		for(var i=0;i<Object.keys(result.users).length;i++){
		str3 +="<div class='comments-section-grids'><div class='comments-section-grid'>"
		+"<div class='col-md-2 comments-section-grid-image'>"
		+"<a href='${pageContext.request.contextPath}/friend?friendid="+result.users[i].id+"'><img src='http://localhost:8080/images/"+result.users[i].picture+"' class='img-responsive' alt='' /></a>"
		+"</div><div class='col-md-10 comments-section-grid-text'><h4><a href='#'>"+result.users[i].name+"</a></h4>"
		+"<label>5/4/2014 at 22:00   </label><p>"+result.comment[i].content+"</p><p><table><tr><td>"
		+"<img src='http://localhost:8080/images/点赞.jpg' class='img-responsive' alt='' style='display:block'/></td>"
		+"<td><a href='#' id='agree"+result.comment[i].id+"' class='agree'>"
		+result.comment[i].agree+"</a></td></p>"
		+"<td>&nbsp;<a href='#'  id='"+result.users[i].id+"' class='reply' style='color: #dfb636'>回复</a></td></tr></table><i class='rply-arrow'></i></div><div class='clearfix'></div></div></div>"
		}
		$("#best").html("<h4>Best Reader's Review</h4>"+str3);
	});
	
	
	var url4 = "${pageContext.request.contextPath}/getBest2";
	var data4 = {"movieid":'${movie.id}',"limit":3};
	var str4 = "";
	$.post(url4,data4,function(result){
		for(var i=0;i<Object.keys(result.users).length;i++){
		str4 +="<div class='comments-section-grids'><div class='comments-section-grid'>"
		+"<div class='col-md-2 comments-section-grid-image'>"
		+"<a href='${pageContext.request.contextPath}/friend?friendid="+result.users[i].id+"'><img src='http://localhost:8080/images/"+result.users[i].picture+"' class='img-responsive' alt='' /></a>"
		+"</div><div class='col-md-10 comments-section-grid-text'><h4><a href='#'>"+result.users[i].name+"</a></h4>"
		+"<label>5/4/2014 at 22:00   </label><p>"+result.comment[i].content+"</p><p><table><tr><td>"
		+"<img src='http://localhost:8080/images/点赞.jpg' class='img-responsive' alt='' style='display:block'/></td>"
		+"<td><a href='#'  id='agree"+result.comment[i].id+"' class='agree'>"
		+result.comment[i].agree+"</a></td></p>"
		+"<td>&nbsp;<a href='#'  id='"+result.users[i].id+"' class='reply' style='color: #dfb636'>回复</a></td></tr></table><i class='rply-arrow'></i></div><div class='clearfix'></div></div></div>"
		}
		$("#comments").html(str4);
	});
	
	
	var url5 = "${pageContext.request.contextPath}/getLike";
	var data5 = new Date();
	var str5 = "";
	$.post(url5,data5,function(result){
		for(var i=0;i<result.length;i++){
			str5 += "<div class='might-grid'><div class='grid-might'><a href='${pageContext.request.contextPath}/detail?id="+result[i].id+"'>"
			+"<img src='http://localhost:8080/images/"+result[i].picture+"' class='img-responsive' alt=''>"
			+"</div><div class='might-top'><p>"+result[i].clazz+"</p> "
			+result[i].name+" <i> </i></a></div><div class='clearfix'></div></div>";
		}
		$("#like").html("<h4>You might also like</h4>"+str5);
	});
	
});
function sendMessage(movieId){
	var url = "${pageContext.request.contextPath}/sendMessage";
	var data = {"movieId":movieId,
			"EnterName":$("#EnterName").val(),
			"Message":$("#Message").val()};
	$.post(url,data,function(result){
		alert(result);
		if(result=="success"){
			window.location.href='${pageContext.request.contextPath}/detail?id=${movie.id}';
		}
	});
}
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
		<div class="single-content">
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
				<h3 class="head">电影详情</h3>
					<div class="col-md-9 reviews-grids">
						<div class="review">
							<div class="movie-pic">
								<a href="#"><img src="http://localhost:8080/images/${movie.picture}" alt="" /></a>
							</div>
							<div class="review-info">
								<a class="span" href="#"><i>${movie.name}</i></a>
								<p class="dirctr"><a href="">上映时间： </a>${movie.time}</p>
								<p class="ratingview">Critic's Rating:</p>
								<div class="rating">
									<span>☆</span>
									<span>☆</span>
									<span>☆</span>
									<span>☆</span>
									<span>☆</span>
								</div>
								<p class="ratingview">
								&nbsp;3.5/5  
								</p>
								<div class="clearfix"></div>
								<p class="ratingview c-rating">Avg Readers' Rating:</p>
								<div class="rating c-rating">
									<span>☆</span>
									<span>☆</span>
									<span>☆</span>
									<span>☆</span>
									<span>☆</span>
								</div> 	
								<p class="ratingview c-rating">								
								&nbsp; 3.3/5</p>
								<div class="clearfix"></div>
								<div class="yrw">
									<div class="dropdown-button">           			
										<select class="dropdown" tabindex="9" data-settings='{"wrapperClass":"flat"}'>
										<option value="0">Your rating</option>	
										<option value="1">1.Poor</option>
										<option value="2">1.5(Below average)</option>
										<option value="3">2.Average</option>
										<option value="4">2.5(Above average)</option>
										<option value="5">3.Watchable</option>
										<option value="6">3.5(Good)</option>
										<option value="7">4.5(Very good)</option>
										<option value="8">5.Outstanding</option>
									  </select>
									</div>
									<div class="rtm text-center">
										<a onclick="collect(${movie.id})">Collect it</a>
									</div>
									<div class="wt text-center">
										<a href="${pageContext.request.contextPath}/video?url=${movie.url }&movieid=${movie.id }">WATCH THIS TRAILER</a>
									</div>
									<div class="clearfix"></div>
								</div>
								<p class="info">CAST:&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Will Smith, Margot Robbie, Adrian Martinez, Rodrigo Santoro, BD Wong, Robert Taylor</p>
								<p class="info">DIRECTION: &nbsp;&nbsp;&nbsp;&nbsp;Glenn Ficarra, John Requa</p>
								<p class="info">GENRE:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Crime</p>
								<p class="info">DURATION:&nbsp;&nbsp;&nbsp; &nbsp; 1 hour 45 minutes</p>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="single">
							<h3>${movie.name} 是一部${movie.clazz}电影</h3>
							<p>故事简介:<i> ${movie.content}</i></p>
						</div>
							<div class="best-review" id="best">
								
							</div>
							<div class="story-review">
								<h4>REVIEW:</h4>
								<p>So,Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
							</div>
							<!-- comments-section-starts -->
	    <div class="comments-section">
	        <div class="comments-section-head">
				<div class="comments-section-head-text">
					<h3>25 Comments</h3>
				</div>
				<div class="clearfix"></div>
		    </div>
			<div id="comments">
				
			</div>
	    </div>
	  <!-- comments-section-ends -->
		  <div class="reply-section">
			  <div class="reply-section-head">
				  <div class="reply-section-head-text">
					  <h3>Leave Reply</h3>
				  </div>
			  </div> 
			<div class="blog-form">
			    <form>
					<input type="text" id="EnterName" class="text" value="Enter Name" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter Name';}">
					<input type="text" id="EnterSex" class="text" value="Enter Sex" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Enter Sex';}">
					<input type="text" id="Subject" class="text" value="Subject" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Subject';}">
					<textarea id="Message"></textarea>
					<input type="button" id="send" onclick="sendMessage(${movie.id})" value="SUBMIT COMMENT">
			    </form>
			 </div>
		  </div>
		  </div>
					<div class="col-md-3 side-bar">
						<div class="featured" id="history">
							
						</div>
						
						<div class="entertainment" id="comment">
							
						</div>
						<div class="might" id="like">
							<h4>You might also like</h4>
							<div class="might-grid">
								<div class="grid-might">
									<a href="single.html"><img src="http://localhost:8080/images/mi.jpg" class="img-responsive" alt=""> </a>
								</div>
								<div class="might-top">
									<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p> 
									<a href="single.html">Lorem Ipsum <i> </i></a>
								</div>
							<div class="clearfix"></div>
							</div>
			</div>
			<!---->
				<div class="grid-top">
				<h4>Archives</h4>
				<ul>
					<li><a href="#">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </a></li>
					<li><a href="#">Lorem Ipsum has been the industry's standard dummy text ever since the 1500s</a></li>
					<li><a href="#">When an unknown printer took a galley of type and scrambled it to make a type specimen book. </a> </li>
					<li><a href="#">It has survived not only five centuries, but also the leap into electronic typesetting</a> </li>
					<li><a href="#">Remaining essentially unchanged. It was popularised in the 1960s with the release of </a> </li>
					<li><a href="#">Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing </a> </li>
					<li><a href="#">Software like Aldus PageMaker including versionsof Lorem Ipsum.</a> </li>
				</ul>
				</div>
				<!---->

					</div>

					<div class="clearfix"></div>
			</div>
			</div>
		
		
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/js/jquery.flexisel.js"></script>	
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
	<a name="footer" id="footer"></a>
	</body>
</html>
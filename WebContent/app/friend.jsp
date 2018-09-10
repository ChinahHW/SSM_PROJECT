<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
                <!-- METAS -->
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <title>Knowledge Base Theme</title>

                <link rel="shortcut icon" href="http://localhost:8080/images/favicon.png" />


                

                <!-- Style Sheet-->
                <link rel='stylesheet' id='bootstrap-css-css'  href='${pageContext.request.contextPath }/app/style/css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='responsive-css-css'  href='${pageContext.request.contextPath }/app/style/css/responsive5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='pretty-photo-css-css'  href='${pageContext.request.contextPath }/app/style/js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
                <link rel='stylesheet' id='main-css-css'  href='${pageContext.request.contextPath }/app/style/css/main5152.css?ver=1.0' type='text/css' media='all' />
                <link rel='stylesheet' id='custom-css-css'  href='${pageContext.request.contextPath }/app/style/css/custom5152.html?ver=1.0' type='text/css' media='all' />
				<script src="${pageContext.request.contextPath }/app/style/js/jquery.min.js"></script>

                <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
                <!--[if lt IE 9]>
                <script src="js/html5.js"></script></script>
                <![endif]-->


        </head>

        <body>
        
        <script type="text/javascript">
	        $(function(){
				var url = "${pageContext.request.contextPath}/getFriendInfo";
				var data = {"friendid":'${param.friendid}'};
				var str = "";
				$.post(url,data,function(result){
					for(var i=0;i<Object.keys(result.comments).length;i++){
						str += "<header class='clearfix'><a href='single.html'>评论ID："+result.comments[i].id+"</a></h3>"
						+"<div class='post-meta clearfix'><span class='date'></span><span class='category'></span>"
						+"<span class='comments'></span>"
						+"<span class='like-count'>"+result.comments[i].agree+"</span></div></header>"
						+"<p>"+result.comments[i].content+"<br><br></p>";
					}
					 $("#comment").html(str); 
					 
					 str = "";
					 str += "<div><img src='http://localhost:8080/images/"+result.info.picture+"'/></div>"
						+"<h3 class='title'>"+result.info.name+"</h3>"
						+"<p class='intro'>SEX IS "+result.info.sex+"</p><input type='button' value='"+result.isFriend+"' id='addFriend'> &nbsp;";
						if(result.isFriend=="取消关注"){
						str += "<input type='button' value='私信' id='email'>";
						}else{
							str += "<input type='button' value='私信' style='display:none' id='email'>";
						}
					 $("#userinfo").html(str);
					 $(document).on("click","#email",function(){
							$("#fill").show();
							$("#myform").show();
							$("#receiverid").val("Receiver:   "+result.info.name);
					    });
					 
					 str = "";
					 for(var i=0;i<Object.keys(result.movies).length;i++){
					 str += "<section class='span4'><h4 class='category'><a href='${pageContext.request.contextPath}/detail?id="+result.movies[i].id+"'>"+result.movies[i].name+"</a></h4>"
						+"<div class='category-description'><p>"+result.movies[i].clazz+"</p>"
						+"</div></section>";
					 }
					 $("#collection").html(str);
					 
					 
					 $(document).on("click","#addFriend",function(){
					    	var url = "${pageContext.request.contextPath}/addFriend";
							var data = {"friendid":'${param.friendid}'};
							$.post(url,data,function(result){
								if(result=="go to log"){
									window.location.href='${pageContext.request.contextPath}/getLogin';
								}else if(result=="add success"){
									$("#addFriend").val("取消关注");
									$("#email").show();
								}else if(result=="delete success"){
									$("#addFriend").val("关注");
									$("#email").hide();
								}
								alert(result);
							})
					    });
				});
			});
	        function exit(){
				$("#fill").hide();
				$("#myform").hide();
			}
	        function doEmail(){
	        	var url = "${pageContext.request.contextPath}/doEmail";
				var data = {"receiverid":'${param.friendid}',"content":$("#message").val()};
				$.post(url,data,function(result){
						alert(result);
					})
			}
        </script>

                <!-- Start of Header -->
                <div class="header-wrapper">
                        <header>
                                <div class="container">


                                        <div class="logo-container">
                                                <!-- Website Logo -->
                                                <a href="index"  title="Knowledge Base Theme">
                                                        <img src="http://localhost:8080/images/logo.png" alt="Knowledge Base Theme">
                                                </a>
                                                <span class="tag-line">Premium WordPress Theme</span>
                                        </div>


                                        <!-- Start of Main Navigation -->
                                        <nav class="main-nav">
                                                <div class="menu-top-menu-container">
                                                        <ul id="menu-top-menu" class="clearfix">
                                                        		<li><a href="index">首页</a></li>
                                                                <li><a href="userMain">我的主页</a></li>
                                                                <li><a href="message">我的私信</a></li>
                                                        </ul>
                                                </div>
                                        </nav>
                                        <!-- End of Main Navigation -->

                                </div>
                        </header>
                </div>
                <!-- End of Header -->
                <!-- End of Search Wrapper -->

                <!-- Start of Page Container -->
                <div class="page-container">
                        <div class="container">
                                <div class="row">

                                        <!-- start of page content -->
                                        <div class="span8 main-listing">

                                                <article class="format-standard type-post hentry clearfix" id="comment">

                                                </article>
                                                <div class="row home-category-list-area">
                                                        <div class="span8">
                                                                <h2>Categories</h2>
                                                        </div>
                                                </div>

                                                <div class="row-fluid top-cats" id="collection">

                                                        
                                                </div>

                                                <!-- <div id="pagination">
                                                        <a href="#" class="btn active">1</a>
                                                        <a href="#" class="btn">2</a>
                                                        <a href="#" class="btn">3</a>
                                                        <a href="#" class="btn">Next »</a>
                                                        <a href="#" class="btn">Last »</a>
                                                </div> -->

                                        </div>
                                        <!-- end of page content -->


                                        <!-- start of sidebar -->
                                        <aside class="span4 page-sidebar">

                                                <section class="widget">
                                                        <div class="support-widget" id="userinfo">
                                                         
                                                               
                                                        </div>
                                                </section>


                                                
												 
                                        </aside>
                                        <!-- end of sidebar -->
                                </div>
                        </div>
                </div>
                <!-- End of Page Container -->

                <!-- Start of Footer -->
                <footer id="footer-wrapper">
                        <div id="footer" class="container">
                                
                        </div>
                        <!-- end of #footer -->

                        <!-- Footer Bottom -->
                        <div id="footer-bottom-wrapper">
                                <div id="footer-bottom" class="container">
                                        <div class="row">
                                                <div class="span6">
                                                        <p class="copyright">
                                                                Copyright © 2013. All Rights Reserved by KnowledgeBase.Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a>
                                                        </p>
                                                </div>
                                                <div class="span6">
                                                        <!-- Social Navigation -->
                                                </div>
                                        </div>
                                </div>
                        </div>
                        <!-- End of Footer Bottom -->

                </footer>
                <!-- End of Footer -->

                <a href="#top" id="scroll-top"></a>


				<div id="fill" style="width: 100%; height: 100%; background-color: #000; position: absolute; top: 0px; left: 0px; opacity: 0.3; display: none; z-index: 100"></div>
					<div id="myform"
						style="width: 100%; height: 100%; position: absolute; top: 0px; left: 0px; z-index: 101; display: none">
						<form method="post" id="form1">
							<table width="340" border="0"
								style="margin: 20% auto; background-color: #fff; ">
								<tr>
								<td style='padding-left: 16%;'><input type="text" name="receiverid"  id="receiverid" placeholder="发送给。。。"/></td>
								</tr>
								<tr>
									<td style='padding-left: 16%;'><textarea rows="10" cols="5" placeholder="发送内容" id="message" name="message"></textarea></td>
								</tr>
								<tr>
									<td style='padding-left: 16%;'><input type="button" value="发送" onclick="doEmail()"  /> <input type="reset"
										value="重置" /><input type="button" value="退出" onclick="exit()"  /> </td>
								</tr>
							</table>
						</form>
                <!-- script -->
                
                 <script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/jquery.min.js'></script>
                <script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/jquery.easing.1.34e44.js?ver=1.3'></script>
                <script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/prettyphoto/jquery.prettyPhotoaeb9.js?ver=3.1.4'></script>
                <script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/jquery.liveSearchd5f7.js?ver=2.0'></script>
				<script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/jflickrfeed.js'></script>
                <script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/jquery.formd471.js?ver=3.18'></script>
                <script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/jquery.validate.minfc6b.js?ver=1.10.0'></script>
                <script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/custom5152.js?ver=1.0'></script>
				
				
				
        </body>
</html>
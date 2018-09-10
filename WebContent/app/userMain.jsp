<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
                <!-- META TAGS -->
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <title>Knowledge Base Theme</title>

                <link rel="shortcut icon" href="images/favicon.png" />


                

                <!-- Style Sheet-->
                <link rel="stylesheet" href="${pageContext.request.contextPath }/app/style/style.css"/>
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
				var url = "${pageContext.request.contextPath}/getBestByUserId";
				var data = new Date();
				var str = "";
				$.post(url,data,function(result){
					for(var i=0;i<result.comments.length;i++){
						str += "<li class='article-entry standard'><h4><a href='single.html'>评论ID："+result.comments[i].id+"</a></h4>"
						+"<span class='article-meta'>"+result.comments[i].content+"<br></span>"
						+"<span class='like-count'>"+result.comments[i].agree+"</span></li>";
					}
					$("#popular").html("<h3>最高点赞评论：</h3><ul class='articles'>"+str+"</ul>");
					str="";
					for(var i=0;i<result.allcomments.length;i++){
						str += "<li class='article-entry standard'><h4><a href='single.html'>评论ID："+result.allcomments[i].id+"</a></h4>"+
						"<span class='article-meta'>"+result.allcomments[i].content+"<br></span>"
						+"<span class='like-count'>"+result.allcomments[i].agree+"</span></li>";
					}
					$("#recent").html("<h3>最近评论：</h3><ul class='articles'>"+str+"</ul>");
				});
				
				
				var url2 = "${pageContext.request.contextPath}/getCollctionByUserId";
				var data2 = new Date();
				var str2 = "";
				$.post(url2,data2,function(result){
					for(var i=0;i<result.length;i++){
						str2 += "<section class='span4'><h4 class='category'><a href='${pageContext.request.contextPath}/detail?id="+result[i].id+"'>"+result[i].name+"</a></h4>"
						+"<div class='category-description'><p>"+result[i].clazz+"</p>"
						+"</div></section>";
					}
					$("#collection").html(str2);
				});
				
				var url3 = "${pageContext.request.contextPath}/getUserInfo";
				var data3 = new Date();
				var str3 = "";
				var str3_1 = "";
				$.post(url3,data3,function(result){
					str3 += "<div><a href='upload'><img src='http://localhost:8080/images/"+result.picture+"'/></a></div>"
					+"<h3 class='title'>"+result.name+"</h3>"
					+"<p class='intro'>SEX IS "+result.sex+"</p><input type='button' value='修改信息' id='changeInfo'>";
					if(result.isAdmin=="true"){
						
						str3_1 = "<li><a href='index'>首页</a></li><li><a href='userMain'>我的主页</a></li><li><a href='message'>我的私信</a></li>"
						+"<li><a href='${pageContext.request.contextPath}/adminMain'>管理页面</a></li>"
						+"<li><a id='logOut' href='${pageContext.request.contextPath }/logOut'>退出</a></li>";
					}else{
						str3_1 = "<li><a href='index'>首页</a></li><li><a href='userMain'>我的主页</a></li><li><a href='message'>我的私信</a></li>"
						+"<li><a id='logOut' href='${pageContext.request.contextPath }/logOut'>退出</a></li>";
					}
					$("#menu-top-menu").html(str3_1);
					$("#userinfo").html(str3);
					
					$(document).on("click","#changeInfo",function(){
						$("#fill").show();
						$("#myform").show();
				    });
					
				});
				
				
				var url4 = "${pageContext.request.contextPath}/getFriend";
				var data4 = new Date();
				var str4 = "";
				$.post(url4,data4,function(result){
					for(var i=0;i<result.length;i++){
						str4 += "<li><h4><a href='${pageContext.request.contextPath}/friend?friendid="+result[i].id+"' style='font-size:18px;'>姓名："+result[i].name+"</h4>"
						+"<div><img src='http://localhost:8080/images/"+result[i].picture+"'/></div></a>"
						+"<span style='font-size:18px;'>性别："+result[i].sex+"</span></li><hr/>";
					}
					$("#friend").html("<h3>朋友</h3><ul class='articles'>"+str4+"</ul>");
				});
		});
		function exit(){
			$("#fill").hide();
			$("#myform").hide();
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
                                                               
                                                        </ul>
                                                </div>
                                        </nav>
                                        <!-- End of Main Navigation -->

                                </div>
                        </header>
                </div>
                <!-- End of Header -->

                <!-- Start of Search Wrapper -->
                
                <!-- End of Search Wrapper -->

                <!-- Start of Page Container -->
                <div class="page-container">
                        <div class="container">
                                <div class="row">

                                        <!-- start of page content -->
                                        <div class="span8 page-content">

                                                <!-- Basic Home Page Template -->
                                                <div class="row separator">
                                                        <section class="span4 articles-list" id="popular">
                                                                
                                                        </section>

                                                        <section class="span4 articles-list" id="recent">
                                                                
                                                        </section>
                                                </div>

                                                <div class="row home-category-list-area">
                                                        <div class="span8">
                                                                <h2>Categories</h2>
                                                        </div>
                                                </div>

                                                <div class="row-fluid top-cats" id="collection">

                                                        
                                                </div>

                                        </div>
                                        <!-- end of page content -->


                                        <!-- start of sidebar -->
                                        <aside class="span4 page-sidebar">

                                                <section class="widget">
                                                        <div class="support-widget" id="userinfo">
                                                         
                                                               
                                                        </div>
                                                </section>

                                                <section class="widget">
                                                        <div class="quick-links-widget">
                                                                <h3 class="title">Quick Links</h3>
                                                                <ul id="menu-quick-links" class="menu clearfix">
                                                                        <li><a href='index'>首页</a></li>
                                                                        <li><a href='userMain'>我的主页</a></li>
                                                                        <li><a href='message'>我的私信</a></li>
                                                                </ul>
                                                        </div>
                                                </section>

                                                <section id="friend">
                                                                
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

                <!-- script -->
                <script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/jquery.min.js'></script>
                <script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/jquery.easing.1.3.js'></script>
                <script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/jquery.prettyPhoto.js'></script>
                <script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/jflickrfeed.js'></script>
                <script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/jquery.liveSearch.js'></script>
                <script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/jquery.form.js'></script>
                <script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/jquery.validate.min.js'></script>
                <script type='text/javascript' src='${pageContext.request.contextPath }/app/style/js/custom.js'></script>
				<div id="fill" style="width: 100%; height: 100%; background-color: #000; position: absolute; top: 0px; left: 0px; opacity: 0.3; display: none; z-index: 100"></div>
					<div id="myform"
						style="width: 100%; height: 100%; position: absolute; top: 0px; left: 0px; z-index: 101; display: none">
						<form action="${pageContext.request.contextPath}/changeInfo" method="post" id="form1">
							<table width="340" border="0"
								style="margin: 20% auto; background-color: #fff; ">
								<tr>
								<td style='padding-left: 16%;'><input type="text" name="username"  id="username" placeholder="请输入用户名"/></td>
								</tr>
								<tr>
									<td style='padding-left: 16%;'><input type="text" name="oldPassword" id="oldPassword" placeholder="请输入密码"/></td>
								</tr>
								<tr>
									<td style='padding-left: 16%;'><input type="text" name="newPassword" id="newPassword" placeholder="请输入确认密码"/></td>
								</tr>
								<tr>
								<td style='padding-left: 16%;'><input type="text" name="sex"  id="sex" placeholder="性别"/></td>
								</tr>
								<tr>
								<td style='padding-left: 16%;'><input type="text" name="age"  id="age" placeholder="年龄"/></td>
								</tr>
								<tr>
									<td style='padding-left: 16%;'><input type="submit" value="修改"  /> <input type="reset"
										value="重置" /><input type="button" value="退出" onclick="exit()"  /> </td>
								</tr>
							</table>
						</form>
        </body>
</html>
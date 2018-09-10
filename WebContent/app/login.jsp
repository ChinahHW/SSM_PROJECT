<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">

<script src="${pageContext.request.contextPath }/app/style/js/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		
		$(".form").slideDown(500);
		
		$("#landing").addClass("border-btn");

		$("#registered").click(function() {
			$("#landing").removeClass("border-btn");
			$("#landing-content").hide(500);
			$(this).addClass("border-btn");
			$("#registered-content").show(500);
			
		})

		$("#landing").click(function() {
			$("#registered").removeClass("border-btn");
			$(this).addClass("border-btn");
			
			$("#landing-content").show(500);
			$("#registered-content").hide(500);
		})
		
	});
	function getPhoto(){
		var url = "${pageContext.request.contextPath}/getPhoto";
		var data = {"name":$("#name").val()};
		$.post(url,data,function(result){
			$("#photo").html("<img src='http://localhost:8080/images/"+result.picture+"'>");
		});
	}
	
	function registe(){
		var url = "${pageContext.request.contextPath}/registe";
		var data = {"name":$("#rname").val(),
				"password":$("#rpassword").val(),
				"age":$("#rage").val()};
		$.post(url,data,function(result){
			if(result=='success'){
				window.location.href='${pageContext.request.contextPath}/getLogin';
			}
			alert(result);
		});
	}
	function changeImg() {
        var imgSrc = $("#codeImg");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", chgUrl(src));
    }  

　　 //加入时间戳，去缓存机制   
    function chgUrl(url) {
        var timestamp = (new Date()).valueOf();if ((url.indexOf("&") >= 0)) {
            url = url + "&timestamp=" + timestamp;
        } else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }

</script>

<link href="${pageContext.request.contextPath }/app/style/css/login.css" rel="stylesheet" type="text/css" media="all" />

</head>

<body>
<div class="form">
	<div id="landing">登陆</div>
	<div id="registered">注册</div>
	<div class="fix"></div>
	<div id="landing-content">
	
	
		<form action="${pageContext.request.contextPath }/login" method="post">
			<div id="photo"><img src="http://localhost:8080/images/r1.jpg"></div>
			<div class="inp"><input type="text" placeholder="用户名" onblur="getPhoto()" id="name" name='name'></div>
			<div class="inp"><input type="password" placeholder="密码" id="password" name='password'></div>
			<table style="padding-left: 70px;">
				<tr>
					<td><input type="text" style="text-align: center;height: 20px;width: 100px;margin: 0 auto;"
					 placeholder="验证码" id="code" name="code"></td>
					<td><img style="height: 25px;width: 80px;padding-left: 10px;" id="codeImg" alt="验证码" src="${pageContext.request.contextPath}/code.do" onclick="changeImg()"/></td>
				</tr>
			</table>
			
			<%-- <div style="text-align:center"><input type="text" placeholder="验证码" id="code" name="code"></div>
			<div style="text-align:center"><img id="codeImg" alt="验证码" src="${pageContext.request.contextPath}/code.do" onclick="changeImg()"/></div> --%>
			<%-- <td>验证码：</td>
                    <td><input  type="text" name="code"></td>
                    <td><img id="codeImg" alt="验证码" src="${ctx}/admin/code.do" onclick="changeImg()"/></td>     --%>
			<input type="submit" class="login">
		</form>
		
	</div>
	<div id="registered-content">
		<div class="inp"><input type="text" placeholder="请输入用户名" id="rname"></div>
		<div class="inp"><input type="password" placeholder="请输入密码" id="rpassword"></div>
		<div class="inp"><input type="password" placeholder="请再次输入密码" id="rpassword2"></div>
		<div class="inp"><input type="text" placeholder="年龄" id="rage"></div>
		<div class="login" onclick="registe()">立即注册</div>
	</div>
</div>

<script src="http://www.w2bc.com/scripts/2bc/_gg_980_90.js" type="text/javascript"></script></body>
</html>
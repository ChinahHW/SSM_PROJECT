<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的私信</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/app/style/css/message.css" />
<script src="${pageContext.request.contextPath }/app/style/js/jquery.min.js"></script>
</head>
<body>
<script type="text/javascript">
function email(receivername){
	$("#fill").show();
	$("#myform").show();
	$("#receiverid").val("Receiver:   "+receivername);
}

function doEmail(){
	var url = "${pageContext.request.contextPath}/doEmail";
	var data = {"receiverid":$("#rid").val(),"content":$("#message").val()};
	$.post(url,data,function(result){
			alert(result);
			window.location.href='${pageContext.request.contextPath}/message';
		})
}
function exit(){
	$("#fill").hide();
	$("#myform").hide();
}
</script>
		<div style="text-align: center;"><h2><span style="color:red;">私信列表:</span></h2></div>
          <ul class="commentList">
          	<c:forEach items="${map.messages }" var="message" varStatus="loop">
				<c:if test="${message.senderId==map.userid }">
					<li class="item cl"> <a href="${pageContext.request.contextPath}/userMain"><i class="avatar size-L radius"><img alt="" style="width:65px;height:80px;" src="http://localhost:8080/images/${map.senders[loop.count-1].picture }"></i></a>
              		<div class="comment-main">
                	<header class="comment-header">
                  	<div class="comment-meta"><a class="comment-author" href="#">@${map.senders[loop.count-1].name }</a> 评论于
                    <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20</time>
                  	</div>
                	</header>
                	<div class="comment-body">
                  	<p><a href="#">@${map.receivers[loop.count-1].name }</a> ${message.content }</p>
                	</div>
              		</div>
            		</li>
				</c:if>
				<c:if test="${message.receiverId==map.userid }">
					<li class="item cl comment-flip"> <a href="#"><i class="avatar size-L radius" onclick="email('${map.senders[loop.count-1].name }')"><img alt="" style="width:70px;height:80px;" src="http://localhost:8080/images/${map.senders[loop.count-1].picture }"></i></a>
              		<div class="comment-main">
                	<header class="comment-header">
                  	<div class="comment-meta"><a class="comment-author" href="#" id="email" onclick="email('${map.senders[loop.count-1].name }')">@${map.senders[loop.count-1].name }</a> 评论于
                    <time title="2014年8月31日 下午3:20" datetime="2014-08-31T03:54:20">2014-8-31 15:20</time>
                  	</div>
                	</header>
                	<div class="comment-body">
                  	<p><a href="#">@${map.receivers[loop.count-1].name }</a> ${message.content }</p>
                	</div>
              		</div>
            		</li>
            		<input type="hidden" id="rid" value="${map.senders[loop.count-1].id }">
				</c:if>
			</c:forEach>
          </ul>
          
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
									<td style='padding-left: 16%;'><textarea rows="10" cols="22" placeholder="发送内容" id="message" name="message"></textarea></td>
								</tr>
								<tr>
									<td style='padding-left: 16%;'><input type="button" value="发送" onclick="doEmail()"  /> <input type="reset"
										value="重置" /><input type="button" value="退出" onclick="exit()"  /> </td>
								</tr>
							</table>
						</form>
</body>
</html>
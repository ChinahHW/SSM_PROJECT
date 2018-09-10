<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/js/lib/html5shiv.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/js/lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/app/style/css/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/app/style/css/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/app/style/js/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/app/style/css/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/app/style/css/static/h-ui.admin/css/style.css" />
<script src="${pageContext.request.contextPath }/app/style/js/jquery.min.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/js/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>新增图片</title>
<link href="${pageContext.request.contextPath }/app/style/js/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script type="text/javascript">
$(function (){
	$("#file1").on("change",function(){
		$("#img1").show();
		var file=this.files[0];
		if(this.files && file){
			var reader=new FileReader();
			reader.onload=function(e){
				$("#img1").attr("src",e.target.result);
			}
			reader.readAsDataURL(file);
		}
	});
});
</script>
<div class="page-container">
	<form  action="doChangeMovie?movieid=${movie.id }" method="post" enctype="multipart/form-data" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>图片标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${movie.name }" placeholder="" id="name" name="name">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>图片路径：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${movie.url }" placeholder="url" id="url" name="url">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>分类栏目：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<span class="select-box">
				<select name="clazz" class="select" value="${movie.clazz }">
					<option value="未分类">全部类别</option>
					<option value="动作">动作</option>
					<option value="动画">动画</option>
					<option value="科幻">科幻</option>
					<option value="搞笑">搞笑</option>
				</select>
				</span>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">图片摘要：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="content" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" onKeyUp="$.Huitextarealength(this,200)">${movie.content } </textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
		</div>
		
		
									
					</div>
		
										
		<div class="row cl">
			
			
			<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"></label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="uploader-list-container"> 
					<div style='border-left: 30%'>
											文件：<input id='file1' type="file" name="file" />
											<img id="img1" style="width:80px;height:80px;" src='http://localhost:8080/images/${movie.picture }'>
                                        </div>
				</div>
			</div>
		</div>
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存并提交审核</button>
				<button class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>
										

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/js/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/js/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/css/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/css/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/js/lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/js/lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/js/lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/js/lib/webuploader/0.1.5/webuploader.min.js"></script> 

</body>
</html>
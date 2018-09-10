<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
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
<title>图片列表</title>
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
function delMovie(id){
	if(confirm("确认删除么，删除之后将不能恢复，请谨慎考虑！！")){
		var url = "${pageContext.request.contextPath}/delMovie";
		var data = {"movieid":id};
		$.post(url,data,function(result){
			alert(result);
			window.location.href='${pageContext.request.contextPath}/movie-list';
		});
	}
}
/* $(function(){
	var url = "${pageContext.request.contextPath}/getMovie";
	var data = new Date();
	var str = "";
	$.post(url,data,function(result){
		for(var i=0;i<result.length;i++){
			str += "";

		}
		$("#movieinfo").html(str);
	});
}); */
</script>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 图片管理 <span class="c-gray en">&gt;</span> 图片列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><!-- <a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> --> <a class="btn btn-primary radius" onclick="picture_add('添加图片','movie-add.html')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加图片</a></span> <span class="r">共有数据：<strong>${total}</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort">
			<thead>
				<tr class="text-c">
					<th width="40"><input name="" type="checkbox" value=""></th>
					<th width="80">ID</th>
					<th width="100">分类</th>
					<th width="100">封面</th>
					<th>图片名称</th>
					<th width="150">Tags</th>
					<th width="150">更新时间</th>
					<th width="60">发布状态</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody id="movieinfo">
			<c:forEach items="${movies }" var="movie">
				<tr class='text-c'><td><input name='' type='checkbox' value=''></td>
				<td>${movie.id }</td><td>${movie.name }</td><td><a href='javascript:;' ><img width='100' class='picture-thumb' src='http://localhost:8080/images/${movie.picture }'></a></td>
				<td class='text-l'><a class='maincolor' href='javascript:;' >${movie.clazz }</a></td><td class='text-c'>标签</td>
				<td>${movie.time }</td>
				<td class='td-status'><span class='label label-success radius'>已发布</span></td><td class='td-manage'> <a style='text-decoration:none' class='ml-5' href='${pageContext.request.contextPath}/changeMovie?movieid=${movie.id}' title='编辑'><i class='Hui-iconfont'>&#xe6df;</i></a> 
				<a style='text-decoration:none' class='ml-5' onclick="delMovie(${movie.id})" title='删除'><i class='Hui-iconfont'>&#xe6e2;</i></a></td></tr>
			</c:forEach>
			</tbody>
		</table>
		<div style="text-align: center" >
								<c:forEach items="${page }" var="p">
								<a href="${pageContext.request.contextPath}/movie-list?p=${p}" class="btn" id="btn${p}">${p }</a>
							</c:forEach>
                                <a href="${pageContext.request.contextPath}/movie-list?p=${page.size()}" class="btn">Last »</a>
                            </div>
	</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/js/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/js/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/css/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/css/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/js/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/js/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/app/style/js/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
</script>
</body>
</html>
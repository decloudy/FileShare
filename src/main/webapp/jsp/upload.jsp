<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-COMPATIBLE" content="IE=edge,chrome=1">
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon">
<link href="<%=basePath %>css/bootstrap.min.css" rel="stylesheet">
<script src="<%=basePath %>js/jquery-1.12.1.js"></script>
<script src="<%=basePath %>js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=basePath %>js/fileUpload.js"></script>
<link href="<%=basePath %>css/iconfont.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath %>css/personal.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="<%=basePath %>font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/personalCss.css">
<title>原型</title>
<style>
.activs{
	background-color: white;
}
.uploadcontainer{
	margin-top:100px;
	margin-bottom:100px;
}
 .row{
	margin-left:100px;
	
}
</style>
</head>
<body>
<!-- 导航 -->
	<div id="topMenu">
            <nav class="navbar navbar-default  navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">企业内部信息共享平台</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="height:50px">
                	
                    <ul class="nav navbar-nav" id="menu_bar">
                    	<li class="dropdown active" style="width:120px">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="padding:5px;height:50px"><span>
							<img alt="140x140" src="#" style="width:40px;height:40px;"class="img-circle"  onerror="javascript:this.src='<%=basePath %>images/head/indexImg.jpg'" id="loginHead"/>
</span>&nbsp&nbsp<span>${sessionScope.loginUser.userName}</span><strong class="caret"></strong></a>
							<ul class="dropdown-menu" id="personalDrop">
								<li>
									 <a href="<%=basePath %>user/personal/${sessionScope.loginUser.id}.html"><i class="glyphicon glyphicon-user"></i>&nbsp个人中心</a>
								</li>
								<li>
									 <a href="<%=basePath %>user/exit.html"><i class="glyphicon glyphicon-off"></i>&nbsp注销</a>
								</li>
								</ul>
                            
                        </li>
                        <li >
                            <a href="<%=basePath %>user/message.html"><i class="glyphicon glyphicon-bell"></i>我的消息</a>
                        </li> 
                         <li class="dropdown" >
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="glyphicon glyphicon-file"></i>文件管理<strong class="caret"></strong></a>
							<ul class="dropdown-menu" id="fileDrop">
								<li>
									 <a href="#"><i class="glyphicon glyphicon-book"></i>&nbsp公共文件</a>
								</li>
								<li>
									 <a href="#"><i class="glyphicon glyphicon-book"></i>&nbsp我的部门</a>
								</li>
								<li>
									 <a href="#"><i class="glyphicon glyphicon-book"></i>&nbsp个人文件</a>
								</li>
								</ul>
						</li>                      
                        <li class="active">
                            <a href="<%=basePath %>user/admin.html"><i class="glyphicon glyphicon-edit"></i>后台管理</a>
                        </li>
                         

                    </ul>


                </div>

            </nav>
    </div>
    <div class="col-md-2 column" id="menuList">
            <img alt="140x140" src="images/head.jpg" class="img-circle" id="headPic" /><br>
            <ul class="nav sidebar-nav" id="menu">
                <li class="sidebar-brand">
                </li>
               
                <li id="bb" class="flieType   activs">
                    <a href="/fileController/listall"><i class="fa fa-fw fa-user-circle"></i> 全部文件</a>
                </li>
                <li class="flieType">
                    <a href="/fileController/listpicture"><i class="fa fa-fw fa-share-square"></i>图片</a>
                </li>
                <li class="flieType">
                    <a href="/fileController/listtxt"><i class="fa fa-fw fa-key"></i> 文档</a>
                </li>
                <li class="flieType">
                    <a href="/fileController/listvideo"><i class="fa fa-fw  fa-file-picture-o"></i>视频</a>
                </li>
                <li class="flieType">
                    <a href="/fileController/listmusic"><i class="fa fa-fw fa-cog "></i>音乐</a>
                </li>
                <li class="flieType">
                    <a href="/fileController/listother"><i class="fa fa-fw  fa-edit"></i>其他</a>
                </li>
            </ul>
    </div>
<!-- 内容 -->
	<div class="container col-md-10">
		<div class="row">
			<div class="uploadcontainer">
				<form action="upload" method="post" enctype="multipart/form-data"> 			
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="file">上传文件</label>
							<div class="col-md-7">
								<input type="file"  id="file" name="file" class="form-control input-sm"/>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="form-actions floatRight" style="margin-left:200px;margin-top:130px;">
							<input type="submit" value="Upload" class="btn btn-default ">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

</body>
<script>
/* $(function(){ 
	
	var url = ${pageContext.request.contextPath}+"/fileController/list";
	var data = {
		'type':1,
		};
	$.ajax({ 
            type:"POST", 
            url:url, 
            dataType:"json",      
            //contentType:"application/json", //不能添加这个头           
            data:data, //这里不能进行JSON.stringify,发送请求的数据在:form data
            success:function(data){ 
                                       
            } 
         });
	});  */
	//全选
	var basePath='<%=basePath%>';
	var loginUserId="${sessionScope.loginUser.id}";
	 var loginUserType="${sessionScope.loginUser.userType}";
    if(loginUserType!=0){
    	$("#menu_bar li").eq(8).show();
    }else{
    	$("#menu_bar li").eq(8).hide();
    }
	$("#loginHead").attr("src","<%=basePath %>personalIcon/"+loginUserId+".jpg");
	$("#all_check").click(function(){   
	    if(this.checked){   
	        $(".td :checkbox[class=check]").prop("checked", true);  
	    }else{   
		$(".td :checkbox[class=check]").prop("checked", false);
	    }   
	});
   
	var i=0,k=1;
	$('.uploadbtn,.sharebtn').click(function () {
  		$('#upload,#share,').modal('hide');
	})
	
	//暂停
	$('.downloadbtn').click(function () {
		$('#download').modal('hide');
  		$('#download_detail').modal('show');
  		i=0;
	})
	$('.pause').click(function () {
		if (i==1) {
			$('.progress-bar').removeClass("active");
			$('.pause').text("继续");
			i=i-1;
		}else{
			$('.progress-bar').addClass("active");
			$('.pause').text("暂停");
			i=i+1;
		}
  	})
	

	$(".deletebtn").click(function(){
		if($(".item :checkbox:checked"))
		$(".item :checkbox[class=check]:checked").parent().parent().remove(); 
		$(".head").appendTo($(".doc_cont"));
		$('#delete').modal('hide');

	}) 
	$(".breadcrumb li").click(function(){
		$(".breadcrumb li").addClass("active");
	});
	$(".flieType").click(function(){
		 $(this).siblings().removeClass("activs");
		 $(this).addClass("activs");
		 
	});
	$(".flieType li").click(function(){
		var index=$(".flieType").index(this);
		$(".flieType li").index(this).css("background-color","white");
	});
	/* $(".flieType").click(function(){
		var index=$(".flieType").index(this);
		 var url = ${pageContext.request.contextPath}+"/fileController/list";
	var data = {
			'type':index,
			};
	$.ajax({ 
	            type:"POST", 
	            url:url, 
	            dataType:"json",      
	            //contentType:"application/json", //不能添加这个头           
	            data:data, //这里不能进行JSON.stringify,发送请求的数据在:form data
	            success:function(data){ 
	                                       
	            } 
	         });
	}); */
</script>
</html>
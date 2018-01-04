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
</style>
</head>
<body>

<!-- 模态框 -->
<div class="modal fade" id="download" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
    	<div class="modal-content">
        	<div class="modal-header">
            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            	<h4 class="modal-title" id="myModalLabel">下载</h4>
        	</div>
        	<div class="modal-body">
        		<h4>是否下载?</h4>
        	</div>
        	<div class="modal-footer">
            	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            	<button type="button" class="btn btn-primary downloadbtn">确认下载</button>
        	</div>
   		</div>
	</div>
</div>
<div class="modal fade" id="download_detail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
    	<div class="modal-content">
    		<div class="modal-header">
            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            	<h4 class="modal-title" id="myModalLabel">下载</h4>
        	</div>
        	<div class="modal-body">
        		<div class="progress">
	  				<div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
	    				<span class="">45% </span>
	  				</div>
				</div>
        	</div>
        	<div class="modal-footer">
            	<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            	<button type="button" class="btn btn-primary pause">暂停</button>
        	</div>
   		</div>
	</div>
</div>
<div class="modal fade" id="upload" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
    	<div class="modal-content">
        	<div class="modal-header">
            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            	<h4 class="modal-title" id="myModalLabel">上传</h4>
        	</div>
        	<div class="modal-body">
        		<form action="upload" method="post" enctype="multipart/form-data">  
				<input type="file" name="file" /> 
        	</div>
        	<div class="modal-footer">
        		<button type="submit" class="btn btn-default" data-toggle="modal" data-target="#upload">提交</button>
            	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            	</form>
        	</div>
   		</div>
	</div>
</div>
<div class="modal fade" id="share" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
    	<div class="modal-content">
        	<div class="modal-header">
            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            	<h4 class="modal-title" id="myModalLabel">分享</h4>
        	</div>
        	<div class="modal-body">
        		<div class="tabbable" id="tabs-923579">
					<ul class="nav nav-tabs">
						<li  class="active"><a data-toggle="tab" href="#panel1">第一部分</a></li>
						<li><a data-toggle="tab" href="#panel2">第二部分</a></li>
						<li><a data-toggle="tab" href="#panel3">第三部分</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="panel1">
						<p>第一部分内容.</p>
						</div>
						<div class="tab-pane" id="panel2">
						<p>第二部分内容.</p>
						</div>
						<div class="tab-pane" id="panel3">
						<p>第三部分内容.</p>
						</div>
					</div>
				</div>
        	</div>
        	<div class="modal-footer">
            	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            	<button type="button" class="btn btn-primary sharebtn">确认分享</button>
        	</div>
   		</div>
	</div>
</div>
<div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
    	<div class="modal-content">
        	<div class="modal-header">
            	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            	<h4 class="modal-title" id="myModalLabel">删除</h4>
        	</div>
        	<div class="modal-body">
        		<h4>是否删除?</h4>
        	</div>
        	<div class="modal-footer">
            	<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            	<button type="button" class="btn btn-primary deletebtn">确认删除</button>
        	</div>
   		</div>
	</div>
</div>
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
               
                <li id="bb" class="flieType">
                    <a href="/fileController/listall"><i class="fa fa-fw fa-user-circle"></i> 全部文件</a>
                </li>
                <li class="flieType">
                    <a href="/fileController/listpicture"><i class="fa fa-fw fa-share-square"></i>图片</a>
                </li>
                <li class="flieType">
                    <a href="/fileController/listtxt"><i class="fa fa-fw fa-key"></i> 文档</a>
                </li>
                <li class="flieType  activs">
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
			<div class="col-md-8 choice_btn">
				<button type="button" class="btn btn-default" data-toggle="modal" data-target="#upload">上传</button>
				<button type="button" class="btn btn-default" data-toggle="modal" data-target="#download">下载</button>
				<button type="button" class="btn btn-default" data-toggle="modal" data-target="#share">分享</button>
				<button type="button" class="btn btn-default" data-toggle="modal" data-target="#delete">删除</button>
			</div>
			<div class="input-group col-md-3">  
				<input type="text" class="form-control" placeholder="请输入关键字"/>
       			<span class="input-group-btn">
       				<button class="btn btn-default btn-search"><span class="glyphicon glyphicon-search"></span></button>
       				
       			</span>	
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<ol class="breadcrumb" style="background-color:white ;margin-top: 5px; margin-bottom:0px;">
				  <li><a href="#">返回上一级</a></li>
				  <li><a href="#">全部文件</a></li>
				  <li class="active">Data</li>
				</ol>
			</div>
		</div>
		<div class="row">
		  <div class="col-md-12 head">
			  	<div class="item">
			  		<div class="td">
			  			<input type="checkbox" id="all_check">
			  		</div>
			  		<div class="td">
			  			<div class="hd">
			  				<a href="javascript"></a>
			  			</div>
			  		</div>
			  		<div class="td w0">
			  			<div class="sn">
			  				<div class="text">
			  						<span class="s-fc7">文件名</span> 
			  				</div>
			  			</div>
			  		</div>
			  		<div class="td">
			  			<div class="opt hshow">
			  				
			  			</div>
			  		</div>
			  		<div class="td w1">
			  			<div class="text">
			  				<span>大小</span>
			  			</div>
			  		</div>
			  		<div class="td w2">
			  			<div class="text">
			  				<span>修改日期</span>
			  			</div>
			  		</div>
			  	</div>
		  </div>
		  	<c:forEach var="file" items="${files}">
			    <div class="col-md-12">
			  		<div class="item even ">
			  			<div class="td">
				  			<input type="checkbox" class="check" id="${file.id}">
				  		</div>
			  			<div class="td">
			  				<div class="hd">
			  					<a href=""></a>
			  				</div>
			  			</div>
			  			<div class="td w0">
			  				<div class="sn">
			  					<div class="text">
			  						<a href="">
				  							<span class="s-fc7"><c:out value="${file.fileName}"></c:out></span> 
				  					</a>
			  					</div>
			  				</div>
			  			</div>
			  			<div class="td">
			  				<div class="opt hshow">
			  					
			  				</div>
			  			</div>
			  			<div class="td w1">
			  				<div class="text">
			  					<span><c:out value="${file.size}"></c:out></span>
			  					
			  				</div>
			  			</div>
			  			<div class="td w2">
			  				<div class="text">
			  					<c:out value="${file.uploadTime}"></c:out>
			  				</div>
			  			</div>
			  			<div class="">
			  			 <a href="#" type="button" class="btn btn-danger deletebutn" style="padding: 1px 6px;">删除</a> 
			  			</div>
			  			</div>
			  </div>
		   </c:forEach>
		</div>
	</div>

</body>
<script>
/* $(function(){ 
	
	var url = ${pageContext.request.contextPath}+"/fileController/list";
	var data = {
		'type':0,
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
<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
	<link href="<%=basePath %>css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="<%=basePath %>css/message.css" rel="stylesheet" type="text/css">
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/message.js"></script>
	<title>message</title>
</head>

<body>
	<div class="container">
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
                       
                        <li class="active">
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
                        <li >
                            <a href="<%=basePath %>user/admin.html"><i class="glyphicon glyphicon-edit"></i>后台管理</a>
                        </li>                     

                    </ul>


                </div>

            </nav>

    </div>
	<div class="row clearfix">
		<div class="col-md-12 column height1">
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-1 column">
		</div>
		<div class="col-md-2 column ">
			<div class="menu">
			 <button type="button" class="btn btn-default margin2" onclick="but1()">
			 发&#8195送&#8195私&#8195信</button>
			 <button type="button" class="btn btn-default margin2" onclick="but2()">
			 查&#8195看&#8195私&#8195信</button>
			 <button type="button" class="btn btn-default margin2" onclick="but3()">
			 查&#8195看&#8195分&#8195享</button>
			 </div>
		</div>
		<div class="col-md-8 column">

		  <div class="hid" id="page1" style="display: block;">
		  	<div class="sendmessage">
			<div class="row clearfix">
				<div class="col-md-4 column ">
				收件人:
				<label class="checkbox-inline">
     			<input type="radio" name="optionsRadiosinline" id="optionsRadios1"
     			 value="option1" checked> 工号
  				</label>
   				<label class="checkbox-inline">
      			<input type="radio" name="optionsRadiosinline" id="optionsRadios2" 
        		 value="option2"> 姓名
  				 </label>
				</div>
				<div class="col-md-6 column ">
				<input type="text" class="form-control" id="name" placeholder="请输入搜索内容">
				</div>
				<div class="col-md-1 column">
					 <button type="button" class="btn btn-default">搜索</button>
				</div>
			</div>
			<div class="row clearfix margin" >
				<div class="col-md-2 column col-md-offset-1 border height2 " >
					<img  src="v3/default3.jpg" class="img" />
					<br>姓名：<input type="text"  disabled="disabled" class="disabledtext"> 
                	<br>工号：<input type="text"  disabled="disabled" class="disabledtext"> 
				</div>
				<div class="col-md-7 column col-md-offset-1">
				<textarea  class="textarea"></textarea>
				 <button type="button" class="btn btn-default col-md-offset-11">发送</button>
				</div>
			</div>
		    </div>
		  </div>

		  <div class="hid" id="page2" style="display: none;">
		  	<div class="row clearfix" >
		  		<textarea disabled="disabled" class="col-md-11 column margin4 border">dddddddddddddddddddddd</textarea>
		  		<br><input type="text" class="col-md-3 col-md-offset-8 margin3 text1" name=""  disabled="disabled" value="发送者:xxx">
		  	</div>
		  </div>

		  <div class="hid" id="page3" style="display: none;">
		  	<div class="row clearfix" >  		
		  		<a href="" class="col-md-11 column margin4 border" >xxxxx</a>
		  		<input type="text" class="col-md-3 col-md-offset-8 margin3 text1" name=""  disabled="disabled" value="分享者:xxx">
		  	</div>

		  	<div class="row clearfix" >  		
		  		<a href="" class="col-md-11 column margin4 border" >xxxxx</a>
		  		<input type="text" class="col-md-3 col-md-offset-8 margin3 text1" name=""  disabled="disabled" value="分享者:xxx">
		  	</div>

			</div>

		</div>

	</div>
	</div>
</body>
</html>

 <script type="text/javascript">
 
	var basePath='<%=basePath%>';
	var loginUserId="${sessionScope.loginUser.id}";
    $("#loginHead").attr("src","<%=basePath %>personalIcon/"+loginUserId+".jpg");
 
 
 </script>
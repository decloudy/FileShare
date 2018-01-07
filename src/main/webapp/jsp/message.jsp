<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>我的消息</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath %>font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/buttons.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>cropper/dist/cropper.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/toastr.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/personalCss.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/messageCss.css">
    <link href="https://cdn.bootcss.com/bootstrap-switch/3.3.4/css/bootstrap3/bootstrap-switch.min.css" rel="stylesheet">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-switch/3.3.4/js/bootstrap-switch.min.js"></script>
    <script src="<%=basePath %>cropper/dist/cropper.js"></script>
    <script src="<%=basePath %>js/toastr.min.js"></script>
	<script src="<%=basePath %>js/message.js"></script>
</head>
<body>
    <div id="topMenu"  >
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
                            <a href="<%=basePath %>user/message.html" ><i class="glyphicon glyphicon-bell"></i>我的消息</a>
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
    <div class="container">
    <div class="row clearfix">
        <div class="col-md-2 column" id="menuList">
            <img alt="140x140" src="#" style="width:100px;height:100px;"class="img-circle" id="headPic" onerror="javascript:this.src='<%=basePath %>images/head/indexImg.jpg'" /><br>

                    <div class="panel panel-primary" id="menu">
                <div class="panel-heading" style="background-color:#1b9af7">
                    <h3 class="panel-title">
                    </h3>
                </div>

            </div>
                    <button type="button" class="button button-primary button-rounded  button-longshadow button-small menuOption" onclick="but1()"><i class="fa fa-fw fa-plus-square-o"></i> 发送私信</button>
                    <button type="button" class="button button-primary button-rounded  button-longshadow button-small menuOption" onclick="but2()"><i class="fa fa-fw fa-tag"></i> 查看私信</button>
                    <button type="button" class="button button-primary button-rounded  button-longshadow button-small menuOption" onclick="but3()"><i class="fa fa-fw fa-tags "></i> 查看分享</button>
				
             </div>
        <div class="col-md-10 column">
                <!-- Page Content -->
        <div id="page-content-wrapper">

                            <div class="panel panel-primary" id="page1">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        发送私信
                                    </h3>
                                </div>
                                <div class="panel-body" style="height:450px;background:url(<%=basePath %>images/background3.jpg) no-repeat 0px 0px;">

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
				<textarea  class="textarea" style="max-width: 100%;max-height: 250px;" maxlength="250" placeholder="输入信息内容（最多250字）"></textarea>
				 <button type="button" class="btn btn-default col-md-offset-11">发送</button>
				</div>
			</div>
		    </div>
		  </div>

                            </div>



                            <div class="panel panel-primary" id="page2" style="display:none">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                      	  查看私信
                                    </h3>
                                </div>
                                <div class="panel-body" id="shareList" style="height:450px;background:url(<%=basePath %>images/background3.jpg) no-repeat 0px 0px;">
                                    <table class="table table-striped" >
                                        <thead>
                                            <tr style="color:#114257">
                                                <th>
                                                    	文件类别
                                                </th>
                                                <th>
                                                    	文件名
                                                    </th>
                                                <th>
                                                   	 分享时间
                                                </th>
                                                <th>
                                                    	文件下载
                                                </th>
                                                <th>
                                                    	删除记录
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    	视频
                                                </td>
                                                <td>
                                                        TB - Monthly
                                                </td>
                                                <td>
                                                    01/04/2012
                                                </td>
                                                <td>
                                                    <i class="fa  fa-download fa-lg dwl"></i>
                                                </td>
                                                <td>
                                                    <i class="fa fa-trash-o fa-lg del"></i>
                                                </td>
                                            </tr>
                                            <tr class="success" >
                                                <td>
                                                    	文档
                                                </td>
                                                <td>
                                                    TB - Monthly
                                                </td>
                                                <td>
                                                    01/04/2012
                                                </td>
                                                <td>
                                                    <i class="fa  fa-download fa-lg dwl"></i>
                                                </td>
                                                <td>
                                                    <i class="fa fa-trash-o fa-lg del"></i>
                                                </td>
                                            </tr>
                                            <tr class="error">
                                                <td>
                                                   	 其他
                                                </td>
                                                <td>
                                                    TB - Monthly
                                                </td>
                                                <td>
                                                    02/04/2012
                                                </td>
                                                <td>
                                                    <i class="fa  fa-download fa-lg dwl"></i>
                                                </td>
                                                <td>
                                                    <i class="fa fa-trash-o fa-lg del"></i>
                                                </td>
                                            </tr>
                                            <tr class="success">
                                                <td >
                                                   	 文档
                                                </td>
                                                <td>
                                                    TB - Monthly
                                                </td>
                                                <td>
                                                    01/04/2012
                                                </td>
                                                <td>
                                                    <i class="fa  fa-download fa-lg dwl"></i>
                                                </td>
                                                <td>
                                                    <i class="fa fa-trash-o fa-lg del"></i>
                                                </td>
                                            </tr>


                                        </tbody>
                                </table>

                                </div>
                                 <div class="panel-footer" style="padding-top:0px;padding-bottom:0px">
									<ul class="pagination " id="page">
                                        <li>
                                            <a href="#">1</a>
                                        </li>
                                        <li>
                                            <a href="#">2</a>
                                        </li>
                                        <li>
                                            <a href="#">3</a>
                                        </li>
                                        <li>
                                            <a href="#">4</a>
                                        </li>
                                        <li>
                                            <a href="#">下一页</a>
                                        </li>

                                </ul>
                                </div>
                            </div>


                            <div class="panel panel-primary" id="page3" style="display:none">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                       	 查看分享
                                    </h3>
                                </div>
                                <div class="panel-body" style="height:450px;background:url(<%=basePath %>images/background3.jpg) no-repeat 0px 0px;">
									<table class="table table-striped" >
                                        <thead>
                                            <tr style="color:#114257">
                                                <th>
                                                    	文件类别
                                                </th>
                                                <th>
                                                    	文件名
                                                    </th>
                                                <th>
                                                   	 分享时间
                                                </th>
                                                <th>
                                                    	文件下载
                                                </th>
                                                <th>
                                                    	删除记录
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    	视频
                                                </td>
                                                <td>
                                                        TB - Monthly
                                                </td>
                                                <td>
                                                    01/04/2012
                                                </td>
                                                <td>
                                                    <i class="fa  fa-download fa-lg dwl"></i>
                                                </td>
                                                <td>
                                                    <i class="fa fa-trash-o fa-lg del"></i>
                                                </td>
                                            </tr>
                                            <tr class="success" >
                                                <td>
                                                    	文档
                                                </td>
                                                <td>
                                                    TB - Monthly
                                                </td>
                                                <td>
                                                    01/04/2012
                                                </td>
                                                <td>
                                                    <i class="fa  fa-download fa-lg dwl"></i>
                                                </td>
                                                <td>
                                                    <i class="fa fa-trash-o fa-lg del"></i>
                                                </td>
                                            </tr>
                                            <tr class="error">
                                                <td>
                                                   	 其他
                                                </td>
                                                <td>
                                                    TB - Monthly
                                                </td>
                                                <td>
                                                    02/04/2012
                                                </td>
                                                <td>
                                                    <i class="fa  fa-download fa-lg dwl"></i>
                                                </td>
                                                <td>
                                                    <i class="fa fa-trash-o fa-lg del"></i>
                                                </td>
                                            </tr>
                                            <tr class="success">
                                                <td >
                                                   	 文档
                                                </td>
                                                <td>
                                                    TB - Monthly
                                                </td>
                                                <td>
                                                    01/04/2012
                                                </td>
                                                <td>
                                                    <i class="fa  fa-download fa-lg dwl"></i>
                                                </td>
                                                <td>
                                                    <i class="fa fa-trash-o fa-lg del"></i>
                                                </td>
                                            </tr>


                                        </tbody>
                                </table>                                      
                                    </div>
                                    <div class="panel-footer" style="padding-top:0px;padding-bottom:0px">
									<ul class="pagination " id="page">
                                        <li>
                                            <a href="#">上一页</a>
                                        </li>
                                        <li>
                                            <a href="#">1</a>
                                        </li>
                                        <li>
                                            <a href="#">2</a>
                                        </li>
                                        <li>
                                            <a href="#">3</a>
                                        </li>
                                        <li>
                                            <a href="#">4</a>
                                        </li>
                                        <li>
                                            <a href="#">下一页</a>
                                        </li>

                                </ul>
                                </div>
                                </div>
                                

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
 	var userId="${user.id}";
 	var userTelephone="${user.telephone}";
    var userAddress="${user.address}";
    var userEmail="${user.email}";
    var userGender="${user.gender}";
    var userPassword="${user.password}";
    var loginUserType="${sessionScope.loginUser.userType}";
    
    
    $(".imgContainer img").attr("src","<%=basePath %>personalIcon/"+userId+".jpg");
    $("#headPic").attr("src","<%=basePath %>personalIcon/"+userId+".jpg");
    $("#loginHead").attr("src","<%=basePath %>personalIcon/"+loginUserId+".jpg");
    

  $(function(){
            var userSet="${user.userSet}";
        if(userSet==1){
    		$('#mySwitch input').bootstrapSwitch('state',false); 
    		$('#mySwitch input').bootstrapSwitch('offColor',"success");
    		$('#mySwitch input').bootstrapSwitch('onColor',"info");  
    	}else{
    		$('#mySwitch input').bootstrapSwitch('state',true); 
    		$('#mySwitch input').bootstrapSwitch('onColor',"info");
    		$('#mySwitch input').bootstrapSwitch('offColor',"success"); 
   			}
        })
   
       
    if(loginUserType!=0){
    	$("#menu_bar li").eq(8).show();
    }else{
    	$("#menu_bar li").eq(8).hide();
    }
 </script>

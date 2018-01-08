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
</head>
<body>
    <div id="topMenu"  >
            <nav class="navbar navbar-default  navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">企业内部信息共享平台</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="height:50px">
                	
                    <ul class="nav navbar-nav" id="menu_bar">
                    	<li class="dropdown " style="width:120px">
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
                    <button type="button" class="button button-primary button-rounded  button-longshadow button-small menuOption" onclick="but1()" ><i class="fa fa-fw fa-tags "></i> 我的接收</button>
				
             </div>
        <div class="col-md-10 column">
                <!-- Page Content -->
        <div id="page-content-wrapper">

                            <div class="panel panel-primary" id="page1">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                      	  我的接收
                                    </h3>
                                </div>
                                <div class="panel-body" id="shareList" style="height:450px;background:url(<%=basePath %>images/background3.jpg) no-repeat 0px 0px;">
                                    <table class="table table-striped" >
                                        <thead>
                                            <tr style="color:#114257">
                                                <th>
                                                    	用户名
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
                                        <tbody id="messageBody">
                                        </tbody>
                                </table>

                                </div>
                                 <div class="panel-footer" style="padding-top:0px;padding-bottom:0px">
									<ul class="pagination " id="page">

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
    var loginUserType="${sessionScope.loginUser.userType}";
    

    $("#headPic").attr("src","<%=basePath %>personalIcon/"+loginUserId+".jpg");
    $("#loginHead").attr("src","<%=basePath %>personalIcon/"+loginUserId+".jpg");
    
      toastr.options = {

	        "closeButton": true, //是否显示关闭按钮

	        "debug": false, //是否使用debug模式

	        "positionClass":'toast-center-center',//弹出窗的位置

	        "showDuration": "300",//显示的动画时间

	        "hideDuration": "300",//消失的动画时间

	        "timeOut": "1000", //展现时间

	        "extendedTimeOut": "1000",//加长展示时间

	        "showEasing": "swing",//显示时的动画缓冲方式

	        "hideEasing": "linear",//消失时的动画缓冲方式

	        "showMethod": "fadeIn",//显示时的动画方式

	        "hideMethod": "fadeOut" //消失时的动画方式

	    };
    
    
     function showShare(msgId,userName,shareTime){
  		var node='';	
  		node+='<tr id="msg'+msgId+'"><td>'+userName+'</td><td>'+shareTime+'</td><td onclick="edit(this)"><i class="fa  fa-download fa-lg dwl" ></i><td><i class="fa fa-trash-o fa-lg del" onclick="del(this,'+msgId+')"></i></td> </tr>';
  		$("#messageBody").append(node);
  		
  	}
  	
  	
  	
  	 function creatPage(pageNum,pageIndex){
		  	$('#page').html("");
			var node='';
			for(var i=0;i<pageNum;i++){

			node+='<li><a id="'+(i+1)+'" style="cursor:pointer" onclick="page('+(i+1)+')">'+(i+1)+'</a></li>';}

			if(parseInt(pageNum)!=1&&parseInt(pageIndex)!=parseInt(pageNum)){
				node+='<li><a style="cursor:pointer" id="'+(parseInt(pageIndex)+1)+'" onclick="page('+(parseInt(pageIndex)+1)+')">下一页 &rarr;</a></li>';
			}
			$('#page').append(node);
			
			if(parseInt(pageIndex)!=1){
				$('#page').prepend('<li><a style="cursor:pointer" id="'+(parseInt(pageIndex)-1)+'" onclick="page('+(parseInt(pageIndex)-1)+')">&larr; 上一页</a></li>');
				
			}
		}
		
		
		var json='${msgList}';
	
	if(json!='blank'){
	var msgJson=JSON.parse(json);

	for(var i=0;i<msgJson.msg.length;i++){
		showShare(msgJson.msg[i].msgId,msgJson.msg[i].sendName,msgJson.msg[i].sendTime,msgJson.msg[i].content);
   		
   	}
   	creatPage(parseInt(msgJson.msg[0].pageNum),1)
}




 function page(nowIndex){	
	 var pageIndex=nowIndex;
  $.ajax({ 
    type: 'POST', 	
	url: basePath+'user/pageMsgAjax.html',
	data: {
		userId:"110",
		pageIndex:pageIndex
	},
	dataType: 'json',
	success: function(data){
		$("#messageBody").html("");
		 for(var i=0;i<data.msg.length;i++){
			 	
				showShare(data.msg[i].msgId,data.msg[i].sendName,data.msg[i].sendTime,data.msg[i].content);
      }
		 var pageNum=data.msg[0].pageNum;
		 creatPage(pageNum,pageIndex);

	},
	error: function(jqXHR){     
	   alert("发生错误：" + jqXHR.status);  
	},     
});
  
  
  }
  
  
   function del(val,msgId){
  		
    	$.ajax({
			type: 'POST',
			url:basePath+'user/deleteMsgAjax.html',
			data: {
				msgId:msgId,
				},
			dataType: 'json',
			success: function(data){
			var state=data.sucess;
			$(val).parent().parent().remove();
			toastr.success("删除成功");

			},
			error: function(jqXHR){
				alert("发生错误：" + jqXHR.status);
			},
		});	
  		
  	}
    


 </script>

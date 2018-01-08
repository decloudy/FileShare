<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>个人中心</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath %>font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/buttons.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>cropper/dist/cropper.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/toastr.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/personalCss.css">
    <link href="https://cdn.bootcss.com/bootstrap-switch/3.3.4/css/bootstrap3/bootstrap-switch.min.css" rel="stylesheet">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/bootstrap-switch/3.3.4/js/bootstrap-switch.min.js"></script>
    <script src="<%=basePath %>cropper/dist/cropper.js"></script>
    <script src="<%=basePath %>js/toastr.min.js"></script>
    <script src="<%=basePath %>js/personal.js"></script>
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
                    <button type="button" class="button button-primary button-rounded  button-longshadow button-small menuOption" ><i class="fa fa-fw fa-user-circle"></i> 个人信息</button>
                    <button type="button" class="button button-primary button-rounded  button-longshadow button-small menuOption" ><i class="fa fa-fw fa-share-square"></i> 分享记录</button>
                    <button type="button" class="button button-primary button-rounded  button-longshadow button-small menuOption" ><i class="fa fa-fw fa-cog "></i> 个人设置</button>
				
             </div>
        <div class="col-md-10 column">
                <!-- Page Content -->
        <div id="page-content-wrapper">

                            <div class="panel panel-primary" id="information">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        个人信息
                                    </h3>
                                </div>
                                <div class="panel-body" style="height:450px;background:url(<%=basePath %>images/background3.jpg) no-repeat 0px 0px;">
                                    <div class="list-group" id="personal">
                                        <div class="list-group-item" style="color: #468847;font-size:17px">
                                            <i class="fa fa-fw fa-user-circle fa-lg" style="color: #468847;"></i>基础信息
                                        </div>
                                        <div class="list-group-item" style="background-color: #d9edf7;">
                                            <span class="label">姓名：</span><span>${user.userName}</span>
                                        </div>
                                        <div class="list-group-item">
                                            <span class="label">工号：</span><span>${user.userAccount}</span>
                                        </div>

                                        <div class="list-group-item" style="background-color: #d9edf7;">
                                            <span class="label">部门：</span><span>${user.departName}</span>
                                        </div>
                                        <div class="list-group-item" >
                                            <span class="label">入职日期：</span><span>${workTime}</span>
                                        </div>
                                        <div class="list-group-item" style="background-color: #d9edf7;color: #468847;font-size:17px">
                                            <i class="fa fa-fw fa-user-circle fa-lg" style="color: #468847;"></i>私人信息
                                        </div>
                                        <div class="list-group-item" >
                                            <span class="label">性别：</span><span id="show_gender">${user.gender}</span>
                                        </div>
                                        <div class="list-group-item" style="background-color: #d9edf7;">
                                            <span class="label">邮箱：</span><span id="show_email">${user.email}</span>
                                        </div>
                                        <div class="list-group-item" >
                                            <span class="label">联系电话：</span><span id="show_tel">${user.telephone}</span>
                                        </div>
                                        <div class="list-group-item" style="background-color: #d9edf7;">
                                            <span class="label">住址：</span><span id="show_address">${user.address}</span>
                                        </div>

                                    </div>
                                </div>
                                <div class="panel-footer">

                                </div>
                            </div>



                            <div class="panel panel-primary" id="share" style="display:none">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                      	  分享记录
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
                                        <tbody id="shareBody">
                                                


                                        </tbody>
                                </table>

                                </div>
                                 <div class="panel-footer" style="padding-top:0px;padding-bottom:0px">
									<ul class="pagination " id="page">
                                       

                                </ul>
                                </div>
                            </div>


                            <div class="panel panel-primary" id="set" style="display:none">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                       	 个人设置
                                    </h3>
                                </div>
                                <div class="panel-body" style="height:450px;background:url(<%=basePath %>images/background3.jpg) no-repeat 0px 0px;">

                                            <button type="button" class="button button-3d button-primary button-rounded select" id="passEdit"><i class="fa fa-fw fa-key"></i>修改密码</button>
                                            <button type="button" class="button button-3d button-primary button-rounded select" id="infoEdit"><i class="fa fa-fw  fa-edit"></i>修改个人信息</button>
                                            <button type="button" class="button button-3d button-primary button-rounded select" id="headEdit"><i class="fa fa-fw  fa-file-picture-o"></i>修改头像</button><br>

                                            <div class="switch"  id="mySwitch">
                                                <span id="check"><i class="fa fa-fw fa-lock fa-inverse"></i>允许他人查看我的分享</span><input type="checkbox" checked data-on-text="是" data-off-text="否" name="mySwitch_set" />
                                            </div>


                                            <div class="alert alert-dismissable alert-info" id="warning">

                                            <h4>
                                               	 注意!
                                            </h4> <strong>Warning!</strong> 请勿向其他人泄露您的账号信息
                                    </div>
                                </div>
                                <div class="panel-footer">

                                </div>
                            </div>
                            </div>



        </div>
        </div>
    </div>


    <div class="modal fade" id="modal-container-449471" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color:#f0ad4e;border-radius:4px">
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title " id="myModalLabel" style="color:white">
                                	修改密码
                            </h4>
                        </div>
                        <div class="modal-body" >
                        
                        <div class="row clearfix">
							<div class="col-md-7 column">
								 <form class="bs-example bs-example-form" role="form"  id="pwdInput">
                                            <br>
                                                <div class="input-group" >
                                                <span  class="input-group-addon glyphicon glyphicon-lock" id="oldPassword"></span>
                                                <input type="password" class="form-control pull-left" placeholder="旧密码" data-toggle="tooltip"
                                                        data-placement="right" title="请输入旧密码"
                                                         onKeyUp="value=value.replace(/[^a-zA-Z0-9]/g,'')" >
                                                </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-addon glyphicon glyphicon-edit"></span>
                                                <input type="password" class="form-control" placeholder="新密码" data-toggle="tooltip"
                                                        data-placement="right" title="请输入与旧密码不同的新密码" onKeyUp="value=value.replace(/[^a-zA-Z0-9]/g,'')" >
                                                </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-addon glyphicon glyphicon-check"></span>
                                                <input type="password" class="form-control" placeholder="确认新密码" data-toggle="tooltip"
                                                        data-placement="right" title="请确认您的新密码" onKeyUp="value=value.replace(/[^a-zA-Z0-9]/g,'')" >
                                                </div>
                                            <br>

                                            </form>
							</div>
							<div class="col-md-5 column">
								
							</div>
							</div>                                         

                        </div>
                        <div class="modal-footer">
                             <button type="button" class="btn btn-warning" data-dismiss="modal" >取消</button>
                             <button type="button" class="btn btn-primary" id="pwdChange_btn">提交修改</button>
                        </div>
                    </div>

                </div>

            </div>




            <div class="modal fade" id="modal-container-99553" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color:#f0ad4e;border-radius:4px">
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myModalLabel" style="color:white">
                               	 修改头像
                            </h4>
                        </div>
                        <div class="modal-body" >
                        <div class="row clearfix">
							<div class="col-md-8 column">
							<div class="imgContainer" >
                            	<img src="#" alt="用户头像" onerror="javascript:this.src='<%=basePath %>images/head/indexImg.jpg'" >
                        	</div>
							</div>
							<div class="col-md-4 column">
								<label  class="importDiv"  for="inputImage" title="Upload image file">
                        			<input  id="inputImage" name="file" type="file" accept="image/*">
                        			<span class="importImage">上传图片&nbsp;&nbsp;&nbsp;<i class="fa fa-cloud-upload"></i></span>
                        		</label>
							</div>
						</div>
                                                                                             
                        </div>
                        <div class="modal-footer">
                             <button type="button" class="btn btn-warning" data-dismiss="modal" >取消</button>
                             <button type="button" class="btn btn-primary imgConfirm" >提交修改</button>
                        </div>
                    </div>

                </div>

            </div>



            <div class="modal fade" id="modal-container-801374" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color:#f0ad4e;border-radius:4px">
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title " id="myModalLabel" style="color:white">
                              	  修改个人信息
                            </h4>
                        </div>
                        <div class="modal-body" >
                                            <form class="bs-example bs-example-form" role="form"  id="infoInput">
                                            <br>
                                                <div class="input-group">
                                                <span class="input-group-addon glyphicon glyphicon-earphone" ></span>
                                                <input type="text" class="form-control" placeholder="联系电话" data-toggle="tooltip"
                                                        data-placement="right" title="请输入联系方式" id="infoInput_tel">
                                                </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-addon glyphicon glyphicon-envelope"></span>
                                                <input type="email" class="form-control" placeholder="邮箱" data-toggle="tooltip"
                                                        data-placement="right" title="请输入常用邮箱" id="infoInput_email"">
                                                </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-addon glyphicon glyphicon-user"></span>
                                                <div class="form-control">
                                                    <label class="gender"><input name="gender" type="radio"  value="男" />男 </label>
                                                    <label class="gender"><input name="gender" type="radio"  value="女" />女 </label>
                                                    <label class="gender"><input name="gender" type="radio" value="保密" />保密 </label>

                                                </div>

                                                </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-addon glyphicon glyphicon-home"></span>
                                                <input type="text" class="form-control" placeholder="住址" data-toggle="tooltip"
                                                        data-placement="right" title="请输入住址" id="infoInput_addr"">
                                                </div>
                                            <br>

                                            </form>

                        </div>
                        <div class="modal-footer">
                             <button type="button" class="btn btn-warning" data-dismiss="modal" >取消</button>
                             <button type="button" class="btn btn-primary" id="infoChange_btn">提交修改</button>
                        </div>
                    </div>

                </div>

            </div>
            
            
            
             <div class="modal fade" id="modal-container-173159" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" >
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title" id="myModalLabel" >
                               	 提醒
                            </h4>
                        </div>
                        <div class="modal-body" style="text-align:center;">
                            	<div class="changeSuccess">
                    				<i class="fa fa-check-circle fa-5x" ></i>
                				</div>
                				<h3>修改成功！</h3>
                        </div>
                        <div class="modal-footer">
                             <button type="button" class="btn btn-success" data-dismiss="modal" >关闭</button>
                        </div>
                    </div>

                </div>

            </div>
            
            <div class="modal fade" id="modal-container-455769" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color:#8f5756;color:white;border-radius:2%">
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title " id="myModalLabel" >
                               	 提醒
                            </h4>
                        </div>
                        <div class="modal-body" >
                          	  确认删除此记录吗？
                        </div>
                        <div class="modal-footer">
                             <button type="button" class="btn btn-warning" data-dismiss="modal" >取消</button>
                             <button type="button" class="btn btn-primary" >确定</button>
                        </div>
                    </div>

                </div>

            </div>
            
            
            
            <div id="showImage" style="display:none">
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
    var userSet="${user.userSet}";
    var loginUserType="${sessionScope.loginUser.userType}";
    
    
    if(loginUserId!=userId){
    	$(".menuOption:eq(2)").hide();
    	if(userSet==1){
    	$(".menuOption:eq(1)").hide();
    	}
    }
    
    
    $(".imgContainer img").attr("src","<%=basePath %>personalIcon/"+userId+".jpg");
    $("#headPic").attr("src","<%=basePath %>personalIcon/"+userId+".jpg");
    $("#loginHead").attr("src","<%=basePath %>personalIcon/"+loginUserId+".jpg");
    

    
    if(loginUserType!=0){
    	$("#menu_bar li").eq(8).show();
    }else{
    	$("#menu_bar li").eq(8).hide();
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
    
    
    function showShare(userId,fileId,fileType,fileName,shareTime){
  		var node='';	
  		node+='<tr id="file'+fileId+'"><td>'+fileType+'</td><td>'+fileName+'</td><td>'+shareTime+'</td><td onclick="edit(this,'+userId+','+fileId+')"><i class="fa  fa-download fa-lg dwl" ></i><td><i class="fa fa-trash-o fa-lg del" onclick="del(this,'+fileId+')"></i></td> </tr>';
  		$("#shareBody").append(node);
  		
  	}
    
    
    var json='${shareList}';
	
	if(json!='blank'){
	var shareJson=JSON.parse(json);

for(var i=0;i<shareJson.share.length;i++){

   		showShare(shareJson.share[i].userId,shareJson.share[i].fileId,shareJson.share[i].fileTypeName,shareJson.share[i].fileName,shareJson.share[i].shareTime)
   	}
   	creatPage(parseInt(shareJson.share[0].pageNum),1)
}
    
    

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
        
     	
        
  $("#infoEdit").click(function(){

    $("#modal-container-801374").modal('show');

    if(userTelephone!="未填写"){
    		$("#infoInput_tel").val(userTelephone);
    }
    else{$("#infoInput_tel").val("");}
    if(userAddress!="未填写"){
    		$("#infoInput_addr").val(userAddress);
    }else{$("#infoInput_addr").val("");}
    if(userEmail!="未填写"){
    		$("#infoInput_email").val(userEmail);
    }else{$("#infoInput_email").val("");}
    
    if(userGender=="男"){
    	 $("input[type='radio'][name='gender']").attr("checked",false);
    	 $("input[type='radio'][name='gender']").get(0).checked = true;
    }else if(userGender=="女"){
    	 $("input[type='radio'][name='gender']").attr("checked",false);
    	 $("input[type='radio'][name='gender']").get(1).checked = true;
    }else{
    	 $("input[type='radio'][name='gender']").attr("checked",false);
    	 $("input[type='radio'][name='gender']").get(2).checked = true;
    }
    
    

  });
  
   $("#pwdChange_btn").click(function(){
  		var pwd_used=$("#pwdInput input").eq(0).val();
  		var pwd_new=$("#pwdInput input").eq(1).val();
  		var pwd_confirm=$("#pwdInput input").eq(2).val();
  		if(pwd_used!=""&&pwd_new!=""&&pwd_confirm!=""){
  			if(pwd_used!=userPassword){ 		
  				toastr.error("旧密码填写错误");
  			}else{
  				if(pwd_new==pwd_used){
  					toastr.error("新旧密码不可重复");
  				}else{
  				
  					if(pwd_new!=pwd_confirm){
  						toastr.error("两次密码填写不一致");
  					}else{
  						$.ajax({
	    					type: 'POST',
							url:basePath+'user/pwdChangeAjax.html',
							data: {
								newPassword:pwd_new,
								userId:"${user.id}"
								},
							dataType: 'json',
							success: function(data){
							var pwd_state=data.success;
							userPassword=pwd_state;
							$("#modal-container-449471").modal('hide');
							$("#modal-container-173159").modal('show');

							},
							error: function(jqXHR){
		   					alert("发生错误：" + jqXHR.status);
							},
						});
  					
  					}
  					
  				}
  			
  				
  				}
  			
  		}else{
  			toastr.error("请输入完整信息");
  		}
   
    });
    
    
    
    
     $("#infoChange_btn").click(function(){
  		var user_tel=$("#infoInput input").eq(0).val().trim();
  		var user_email=$("#infoInput input").eq(1).val().trim();
  		var user_address=$("#infoInput input").eq(5).val().trim();
  		var user_gender=$("input[type='radio'][name='gender']:checked").val();


  						$.ajax({
	    					type: 'POST',
							url:basePath+'user/infoChangeAjax.html',
							data: {
								tel:user_tel,
								email:user_email,
								address:user_address,
								gender:user_gender,
								userId:"${user.id}"
								},
							dataType: 'json',
							success: function(data){
							var info_address=data.address;
							var info_tel=data.tel;
							var info_email=data.email;
							var info_gender=data.gender;
							
							if(info_tel!="未填写"){
    								$("#infoInput_tel").val(userTelephone);
    							}
    							else{$("#infoInput_tel").val("");}
    						if(info_address!="未填写"){
    								$("#infoInput_addr").val(userAddress);
    							}else{$("#infoInput_addr").val("");}
    						if(info_email!="未填写"){
    								$("#infoInput_email").val(userEmail);
    							}else{$("#infoInput_email").val("");}
    
    						if(info_gender=="男"){
    	 						$("input[type='radio'][name='gender']").attr("checked",false);
    	 						$("input[type='radio'][name='gender']").get(0).checked = true;
    						}else if(info_gender=="女"){
    	 						$("input[type='radio'][name='gender']").attr("checked",false);
    	 						$("input[type='radio'][name='gender']").get(1).checked = true;
    						}else{
    							$("input[type='radio'][name='gender']").attr("checked",false);
    	 						$("input[type='radio'][name='gender']").get(2).checked = true;
    						}
							
							userTelephone=info_tel;
    						userAddress=info_address;
    						userEmail=info_email;
    						userGender=info_gender;
							
							
							$("#modal-container-801374").modal('hide');
							$("#modal-container-173159").modal('show');

							},
							error: function(jqXHR){
		   					alert("发生错误：" + jqXHR.status);
							},
						});	
  						
   
    });
    
    
    
    
    function del(val,fileId){
  		
    	$.ajax({
			type: 'POST',
			url:basePath+'user/deleteShareAjax.html',
			data: {
				fileId:fileId,
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
    
    
    
    $('#mySwitch input').on('switchChange.bootstrapSwitch', function (event,state) { 
    	var setState;
    	if(state){
    		setState=0;
    	}
    	else{
    		setState=1;
    	}
    	
    	$.ajax({
			type: 'POST',
			url:basePath+'user/setChangeAjax.html',
			data: {
				userId:userId,
				setState:setState
				},
			dataType: 'json',
			success: function(data){
			var userset=data.sucess;

			},
			error: function(jqXHR){
				alert("发生错误：" + jqXHR.status);
			},
		});	
          
    }); 
    
    
    
     function page(nowIndex){	
	 var pageIndex=nowIndex;
	 var userId="${user.id}";
  $.ajax({ 
    type: 'POST', 	
	url: basePath+'user/showShareAjax.html',
	data: {
		userId:userId,
		pageIndex:pageIndex
	},
	dataType: 'json',
	success: function(data){
		$("#shareBody").html("");
		 for(var i=0;i<data.share.length;i++){
			 	
				showShare(data.share[i].userId,data.share[i].fileId,data.share[i].fileTypeName,data.share[i].fileName,data.share[i].shareTime)
      }
		 var pageNum=data.share[0].pageNum;
		 creatPage(pageNum,pageIndex);

	},
	error: function(jqXHR){     
	   alert("发生错误：" + jqXHR.status);  
	},     
});
  
  
  }
   
 </script>

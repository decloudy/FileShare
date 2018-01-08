<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>后台管理</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath %>font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/buttons.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/toastr.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/adminCss.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="<%=basePath %>bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.min.js"></script>
    <script src="<%=basePath %>js/toastr.min.js"></script>
    <script src="<%=basePath %>js/admin.js"></script>
    
</head>
<body>
    <div id="topMenu">
            <nav class="navbar navbar-default  navbar-fixed-top" role="navigation">
                <div class="navbar-header">
                     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="#">企业内部信息共享平台</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="height:50px">
                	
                    <ul class="nav navbar-nav" id="menu_bar">
                    	<li class="dropdown" style="width:120px">
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
    <div class="container">
    <div class="row clearfix">
        <div class="col-md-2 column" id="menuList">


            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">

                    </h3>
                </div>

            </div>

            <div class="panel-group" id="panel-457596">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                         <a class="panel-title" data-toggle="collapse" data-parent="#panel-457596" href="#panel-element-406504">用户管理</a>
                    </div>
                    <div id="panel-element-406504" class="panel-collapse in">
                        <div class="panel-body">
                            <button type="button" class="button button-primary button-rounded  button-longshadow button-small menuOption" id="addUser"><i class="fa fa-fw fa-user-circle"></i> 用户添加</button>
                    		<button type="button" class="button button-primary button-rounded  button-longshadow button-small menuOption" id="editInfo"><i class="fa fa-fw fa-share-square"></i> 资料管理</button>
                        </div>
                    </div>
                </div>
                <div class="panel panel-primary" style="margin-top: 15px;">
                    <div class="panel-heading">
                         <a class="panel-title collapsed" data-toggle="collapse" data-parent="#panel-457596" href="#panel-element-535630">公告</a>
                    </div>
                    <div id="panel-element-535630" class="panel-collapse collapse">
                        <div class="panel-body">
                            <button type="button" class="button button-primary button-rounded  button-longshadow button-small menuOption" id="notice" ><i class="fa fa-fw fa-user-circle"></i>公告编辑</button>
                        </div>
                    </div>
                </div>

            </div>

             </div>
        <div class="col-md-10 column">
                <!-- Page Content -->
        <div id="page-content-wrapper">

                            <div class="panel panel-primary" id="userAdd">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                      	  用户添加
                                    </h3>
                                </div>
                                <div class="panel-body" style="height:450px;background:url(<%=basePath %>images/background3.jpg) no-repeat 0px 0px;">
                                     <form class="bs-example bs-example-form" role="form"  id="userInput">
                                            <br>
                                                <div class="input-group">
                                                <span class="input-group-addon " style="color: #468847;font-weight:bold">姓名</span>
                                                <input type="text" class="form-control" placeholder="未填写"  onkeyup="value=value.replace(/[\d]/g,'') "onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[\d]/g,''))" maxlength=10 name="Numbers">
                                                </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-addon " style="color: #468847;font-weight:bold">工号</span>
                                                <input type="text" class="form-control" placeholder="未填写" onkeyup="value=value.replace(/[^\d]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" >
                                                </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-addon " style="color: #468847;font-weight:bold">入职日期</span>
                                                <input type="text" value="" class="form-control" id="datetimepicker" data-date-format="yyyy-mm-dd">
                                                </div>
                                            <br>

                                            <div class="input-group">
                                                    <span class="input-group-addon" style="color: #468847;font-weight:bold">部门</span>
                                                    <select class="form-control "   >
                                                        <c:forEach var="departList" items="${departList}">
                                							<option value="${departList.id}"><c:out value="${departList.departName}"></c:out></option>
                            							</c:forEach>
                                                    </select>
                                                </div><br>


                                            </form>
                                            <button type="button" class="btn btn-primary" id="submitUser">添加用户</button>

                                </div>
                                <div class="panel-footer">

                                </div>
                            </div>

                            <div class="panel panel-primary" id="userEdit" style="display:none">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                       	资料管理
                                    </h3>
                                </div>
                                <div class="panel-body" style="height:450px;background:url(<%=basePath %>images/background3.jpg) no-repeat 0px 0px;">
                                    <div class="row clearfix">
										<div class="col-md-12 column">
											<div class="row clearfix">
												<div class="col-md-4 column">
													<div class="input-group">
                                        				<input type="text" class="form-control" placeholder="未输入" id="searchContent"/>
                                        				<div class="input-group-btn">
														<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
														搜索&nbsp<span class="glyphicon glyphicon-search"> 
														<span class="caret"></span>
														</button>
														<ul class="dropdown-menu pull-right" id="search">
															<li>
                                								<a href="javascript:void(0)">按工号搜索</a>
                            								</li>
                            								<li>
                                								<a href="javascript:void(0)">按姓名搜索</a>
                            								</li>
														</ul>
														</div>
                                 						</div>												
												</div>
												<div class="col-md-4 column">
												</div>
												<div class="col-md-4 column" >
													 <div class="input-group"  style="width:80%">
                                    	
														<div class="dropdown" >
    														<button type="button" class="btn dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown" style="width:60%;background-color:white;border:1px solid #468847">排序
        														<span class="caret"></span>
    														</button>
    													<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1" id="sort">
        													<li>
                                								<a href="javascript:void(0)"  >按姓名排序</a>
                            								</li>
                            								<li>
                                								<a href="javascript:void(0)"  >按工号排序</a>
                            								</li> 
                            								<li>
                                								<a href="javascript:void(0)"  >按部门排序</a>
                            								</li>     
    													</ul>
														</div>	
                                   					</div> 
                                   					
                                   					<div class="input-group"  style="width:80%">
                                    	
														<div class="dropdown" >
    														<button type="button" class="btn dropdown-toggle" id="dropdownMenu2" data-toggle="dropdown" style="display:none;width:60%;background-color:white;border:1px solid #468847">排序
        														<span class="caret"></span>
    														</button>
    													<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2" id="sort1">
        													<li>
                                								<a href="javascript:void(0)"  >按姓名排序</a>
                            								</li>
                            								<li>
                                								<a href="javascript:void(0)"  >按工号排序</a>
                            								</li> 
                            								<li>
                                								<a href="javascript:void(0)"  >按部门排序</a>
                            								</li>     
    													</ul>
														</div>	
                                   					</div> 
                                   					
                                   					
                                   					                                  	
                                				</div>
												</div>
											</div>
										</div>
									                     
                                                     
                         
                                     <table class="table table-striped" >
                                        <thead>
                                            <tr style="color: #468847;font-weight:bold">
                                                <th>
                                                  	  姓名
                                                </th>
                                                <th>
                                                    	工号
                                                    </th>
                                                <th>
                                                   	 部门
                                                </th>
                                                <th>
                                                   	 入职日期
                                                </th>
                                                <th>
                                                   	 资料编辑
                                                </th>
                                                <th>
                                                   	 用户删除
                                                </th>
                                                <th>
                                                   	 密码重置
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody id="userBody">
                                           
                                        </tbody>
                                </table>
                                </div>
                                <div class="panel-footer" style="padding-top:0px;padding-bottom:0px">
									<ul class="pagination " id="page">
                                        

                                </ul>
                                <ul class="pagination " id="page1" style="display:none">
                                        

                                </ul>
                                </div>
                            </div>

                            <div class="panel panel-primary" id="noticeEdit" style="display:none">
                                <div class="panel-heading">
                                    <h3 class="panel-title">
                                        	公告编辑
                                    </h3>
                                </div>
                                <div class="panel-body" style="height:450px;background:url(<%=basePath %>images/background3.jpg) no-repeat 0px 0px;">
                                    <div class="row clearfix">
                                        <div class="col-md-8 column">
                                            <form class="bs-example bs-example-form" role="form" id="noticeInput">

                                                <div class="input-group">
                                                    <span class="input-group-addon">标题</span>
                                                    <input type="text" class="form-control" placeholder="输入公告标题">
                                                </div>
                                                <br>
                                                <div class="input-group">
                                                    <span class="input-group-addon">内容</span>
                                                   <textarea class="textarea form-control" style="resize:none;height:240px"   placeholder="请输入公告内容" ></textarea>
                                                </div>
                                                <br>
                                                <div class="input-group">
                                                    <span class="input-group-addon">部门</span>
                                                    <select class="form-control"  >

                                                        <c:forEach var="departList" items="${departList}">
                                							<option value="${departList.id}"><c:out value="${departList.departName}"></c:out></option>
                            							</c:forEach>
                                                    </select>
                                                </div>

                                            </form>

                                        </div>
                                        <div class="col-md-4 column">
                                                <button type="button" class="btn btn-primary btn-2g btn-block" id="submitNotice">发布公告</button>
                                        </div>
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
                        <div class="modal-header" style="background-color:#8f5756;color:white;border-radius:2%">
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title " id="myModalLabel" >
                               	 提醒
                            </h4>
                        </div>
                        <div class="modal-body" >
                          	  确认删除此用户吗？此用户文件将一并删除
                        </div>
                        <div class="modal-footer">
                             <button type="button" class="btn btn-warning" data-dismiss="modal" >取消</button>
                             <button type="button" class="btn btn-primary" id="delConfirm">确定</button>
                        </div>
                    </div>

                </div>

            </div>


            <div class="modal fade" id="modal-container-99553" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color:#468847;color:white;border-radius:2%">
                             <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h4 class="modal-title " id="myModalLabel" >
                               	 资料编辑
                            </h4>
                        </div>
                        <div class="modal-body" >
                             <form class="bs-example bs-example-form" role="form"  id="editUser">
                                            <br>
                                                <div class="input-group">
                                                <span class="input-group-addon " style="color: #468847;font-weight:bold">姓名</span>
                                                <input type="text" class="form-control" placeholder="未填写" data-toggle="tooltip"
                                                        data-placement="right" title="请输入真实姓名" >
                                                </div>
                                            <br>
                                            <div class="input-group">
                                                <span class="input-group-addon " style="color: #468847;font-weight:bold">工号</span>
                                                <input type="text" class="form-control" placeholder="未填写" data-toggle="tooltip"
                                                        data-placement="right" title="请输入工号" >
                                                </div>
                                            <br>                                           
                                            
                                            <div class="input-group">
                                                <span class="input-group-addon " style="color: #468847;font-weight:bold">入职日期</span>
                                                <input type="text" value="" class="form-control" id="datetimepicker1" data-date-format="yyyy-mm-dd">
                                                </div>
                                            <br>

                                            <div class="input-group">
                                                    <span class="input-group-addon" style="color: #468847;font-weight:bold">部门</span>
                                                    <select class="form-control "   >
                                                        <c:forEach var="departList" items="${departList}">
                                							<option value="${departList.id}"><c:out value="${departList.departName}"></c:out></option>
                            							</c:forEach>
                                                    </select>
                                                </div><br>                                      
                                            </form>
                        </div>
                        <div class="modal-footer">
                             <button type="button" class="btn btn-warning" data-dismiss="modal" >取消</button>
                             <button type="button" class="btn btn-primary" id="changeUser">提交修改</button>
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
	var loginUserDepartId="${sessionScope.loginUser.departId}";
	var opts = $("#userInput select option");
	var opts1 = $("#editUser select option"); 
	var opts2 = $("#noticeInput select option");   
	if(loginUserType==1){
		
    	for(var i=0;i<opts.length;i++){  
           if(loginUserDepartId==opts[i].value){  
                  opts[i].selected = 'selected';
                  opts1[i].selected = 'selected'; 
                  opts2[i].selected = 'selected';   
          		  $("#userInput select ").attr("disabled","disabled"); 
          		  $("#editUser select ").attr("disabled","disabled"); 
          		  $("#noticeInput select ").attr("disabled","disabled"); 
                   break;  
             }  
          } 

    }
  $("#loginHead").attr("src","<%=basePath %>personalIcon/"+loginUserId+".jpg");
 
 
   function edit(val,userId,departId){

   if(loginUserType==1&&loginUserDepartId!=departId)
   {
   	 toastr.warning("权限不足"); 
   }else{
   
   	
   	 $.ajax({
				type: 'POST',
				url:basePath+'user/showEditAjax.html',
				data: {
					userId:userId,
					},
				dataType: 'json',
				success: function(data){
				var userName=data.userName;
				var userAccount=data.userAccount;
				var departmentId=data.departmentId;
				var workTime=data.workTime;
				
				$("#editUser input").eq(0).val(userName);
				$("#editUser input").eq(1).val(userAccount);
				$('#datetimepicker1').val(workTime);
				for(var i=0;i<opts1.length;i++){  
           			if(departmentId==opts[i].value){  
                  		opts1[i].selected = 'selected'; 
                  		if(loginUserType==1){ 
          		  		$("#editUser select ").attr("disabled","disabled");} 
                   		break;  
             }  
          }  
				 
	 
				$("#modal-container-99553").modal('show');

				},
				error: function(jqXHR){
					alert("发生错误：" + jqXHR.status);
				},
			});	
	

   	$("#changeUser").attr("onclick","editUser("+val+"\""+userId+"\")");
   	
   	}
   	
   
	  
  }
  
  
    function del(val,userId,departId){
    
    if(loginUserType==1&&loginUserDepartId!=departId)
   				{
   	 				toastr.warning("权限不足"); 
   				}else{

    	 $.ajax({  type: 'POST', 	
					url: basePath+'user/deleteUserAjax.html',
					data: {
						userId:userId
					},
					dataType: 'json',
					success: function(data){
						if(data.success){
							toastr.success("删除成功");
							$(val).parent().parent().remove();
						}


					},
					error: function(jqXHR){     
					   alert("发生错误：" + jqXHR.status);  
					},     
				});}
    

  }
  
    function showUsers(userId,userName,userAccount,workTime,departId,departName){
		var node='';	
		node+='<tr id="user'+userId+'"><td>'+userName+'</td><td>'+userAccount+'</td><td>'+departName+'</td><td>'+workTime+'</td><td onclick="edit(this,'+userId+','+departId+')"><i class="fa fa-edit fa-lg edit" ></i><td><i class="fa fa-trash-o fa-lg del" onclick="del(this,'+userId+','+departId+')"></i></td><td><i class="fa fa-rotate-right fa-lg reset" onclick="reset('+departId+','+userId+')"></i></td> </tr>';
		$("#userBody").append(node);
		
	}
	
	
	var json='${userList}';
	
	if(json!='blank'){
	var userJson=JSON.parse(json);

for(var i=0;i<userJson.users.length;i++){

   		showUsers(userJson.users[i].id,userJson.users[i].userName,userJson.users[i].userAccount,userJson.users[i].workTime,userJson.users[i].departId,userJson.users[i].departName)
   	}
   	creatPage(parseInt(userJson.users[0].pageNum),1,"userAccount")
}
	
	
	
	
			 function sortSearch(sortMethod,searchMethod,searchContent){	  
			  $.ajax({ 
				    type: 'POST', 	
					url: basePath+'user/searchAjax.html',
					data: {
						userId:"110",
						searchMethod:searchMethod,
						searchContent:searchContent,
						sort:sortMethod,
						pageIndex:"1"
					},
					dataType: 'json',
					success: function(data){
						$("#userBody").html("");
						if(data.success){
							toastr.warning("无相关用户记录");
							$('#page1').hide();
						}else{
							
							for(var i=0;i<data.users.length;i++){
							 	var userName=data.users[i].userName;
								var userId=data.users[i].id;
								var departId=data.users[i].departId;
								var departName=data.users[i].departName;
								var workTime=data.users[i].workTime;
								var userAccount=data.users[i].userAccount;
								showUsers(userId,userName,userAccount,workTime,departId,departName);
				      }

						 var pageNum=data.users[0].pageNum;
						 creatPage(pageNum,1,sortMethod);
						}
						
						 

					},
					error: function(jqXHR){     
					   alert("发生错误：" + jqXHR.status);  
					},     
				});
		  
		  
		  }
	
	
	  function creatPage(pageNum,pageIndex,sortMethod){
  		  	$('#page').html("");
  		  	$('#page1').html("");
  			var node='';
  			for(var i=0;i<pageNum;i++){

  			node+='<li><a id="'+(i+1)+'" style="cursor:pointer" onclick="page(\''+sortMethod+'\','+(i+1)+')">'+(i+1)+'</a></li>';}

  			if(parseInt(pageNum)!=1&&parseInt(pageIndex)!=parseInt(pageNum)){
  				node+='<li><a style="cursor:pointer" id="'+(parseInt(pageIndex)+1)+'" onclick="page(\''+sortMethod+'\','+(parseInt(pageIndex)+1)+')">下一页 &rarr;</a></li>';
  			}
  			$('#page').append(node);
  			$('#page1').append(node);
  			if(parseInt(pageIndex)!=1){
  				$('#page').prepend('<li><a style="cursor:pointer" id="'+(parseInt(pageIndex)-1)+'" onclick="page(\''+sortMethod+'\','+(parseInt(pageIndex)-1)+')">&larr; 上一页</a></li>');
  				$('#page1').prepend('<li><a style="cursor:pointer" id="'+(parseInt(pageIndex)-1)+'" onclick="page(\''+sortMethod+'\','+(parseInt(pageIndex)-1)+')">&larr; 上一页</a></li>');
  			}
  		}
	
	
	 function reset(departId,userId){
		
		
		

   			if(loginUserType==1&&loginUserDepartId!=departId)
   				{
   	 				toastr.warning("权限不足"); 
   				}else{
   					 $.ajax({
				type: 'POST',
				url:basePath+'user/resetPwdAjax.html',
				data: {
					userId:userId,
					},
				dataType: 'json',
				success: function(data){
				var resultState=data.success;
					toastr.success("密码已重置");
				},
				error: function(jqXHR){
					alert("发生错误：" + jqXHR.status);
				},
			});	
   
   				}
			
	
	}
	
	
	

  
  
  function editUser(val,userId){
	  var userName=$("#editUser input").eq(0).val().trim();
	  var userAccount=$("#editUser input").eq(1).val().trim();
	  var workTime=$('#datetimepicker1').val();
	  var departmentId=$("#editUser select").val();
	  
	  
	  if(userName==""||userAccount==""){
		  toastr.error("请输入完整信息");
	  }else{
		  $.ajax({
				type: 'POST',
				url:basePath+'user/editUserAjax.html',
				data: {
					userId:userId,
					userName:userName,
					userAccount:userAccount,
					workTime:workTime,
					departmentId:departmentId
					},
				dataType: 'json',
				success: function(data){
				var resultState=data.success;
				if(resultState==1){
					$("#modal-container-99553").modal('hide');
					toastr.success("修改成功");
					 
			
					//var tr=$("#user"+userId);
					//alert($("#user2 td").eq(1).val());
					//tr.children().eq(0).val(userName);
					//tr.children().eq(1).val(userAccount);
					//tr.children().eq(2).val(data.departName);
					//tr.children().eq(3).val(workTime);
				}else{
					 toastr.error("该工号已存在，修改失败");
				}

				},
				error: function(jqXHR){
					alert("发生错误：" + jqXHR.status);
				},
			});	
	  } 
	  
	  }
	  
	  
	  
	 function page(sortMethod,nowIndex){	
	 
	 
	 var pageIndex=nowIndex;
	   
	  
  $.ajax({ 
    type: 'POST', 	
	url: basePath+'user/showUsersAjax.html',
	data: {
		userId:"110",
		sort:sortMethod,
		pageIndex:pageIndex
	},
	dataType: 'json',
	success: function(data){
		$("#userBody").html("");
		 for(var i=0;i<data.users.length;i++){
			 	var userName=data.users[i].userName;
				var userId=data.users[i].id;
				var departId=data.users[i].departId;
				var departName=data.users[i].departName;
				var workTime=data.users[i].workTime;
				var userAccount=data.users[i].userAccount;
				showUsers(userId,userName,userAccount,workTime,departId,departName);
      }
		 var pageNum=data.users[1].pageNum;
		 creatPage(pageNum,pageIndex,sortMethod);

	},
	error: function(jqXHR){     
	   alert("发生错误：" + jqXHR.status);  
	},     
});
  
  
  }
	  


  
 
 </script>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">  
<head>  
    <meta charset="UTF-8">  
    <link href="<%=basePath %>css/bootstrap.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>css/loginCss.css" >
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/bootstrap.min.js"></script>
    <title>login</title>  
</head>  
<body>  
<!-- 账号密码登录 -->  
<div class="container">
	<div class="intop">
		<div class="col-md-12 column" style="height: 100px;">
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row clearfix">
				<div class="col-md-1 column">
				</div>
				<div class="col-md-5 column">
					<img  src="<%=basePath %>images/main1.jpg" style="width: 100%;height: 250px;" />
				</div>
				<div class="col-md-5 column">
					<h2>登录</h2>
					<div class="row clearfix">
						<div class="col-md-3 column">
						<h4>用户名:</h4>
						<br><h4>密&#8195码:</h4>
						</div>
						<div class="col-md-9 column">
						<form action="dologin.html" method="POST" id="tologin">
						<h4><input type="text" class="form-control" id="nm" placeholder="请输入用户名" name="loginname"></h4>
						<h4><input type="password" class="form-control" id="pass" placeholder="请输入密码(初始为6个8)" name="password"></h4>
						<a href="exit.html" class="col-md-offset-9">忘记密码</a>
						<br><button type="button" class="btn btn-primary col-md-offset-2" onclick="lg()">&#8195登&#8195&#8195录&#8195</button>
						</form>
						</div>
					</div>
				</div>
				<div class="col-md-1 column">
				</div>
			</div>
		</div>
	</div>
</div>



</body>
</html>
 <script type="text/javascript">
 	var basePath='<%=basePath%>';
   function lg(){
  		var name=$("#tologin input").eq(0).val();
  		var password=$("#tologin input").eq(1).val();
		if(name==""||password==""){
		if (name=="") {
			nm.placeholder="用户名为空";
		}
		if(password==""){
  			pass.placeholder="密码为空";
  		}
			return false;
		}
		document.getElementById("tologin").submit();		
  		}
  			

   
    

 </script>

/*
* @Author: Marte
* @Date:   2017-12-15 22:07:40
* @Last Modified by:   Marte
* @Last Modified time: 2017-12-17 19:42:46
*/

'use strict';

$(document).ready(function(){
  $("#addUser").click(function(){
    $("#userAdd").fadeIn();
    $("#userEdit").hide();
    $("#noticeEdit").hide();

  });
  
  
 
 
  

  $("#editInfo").click(function(){
    $("#userAdd").hide();
    $("#userEdit").fadeIn();
    $("#noticeEdit").hide();
    
    
    $.ajax({ 
	    type: 'POST', 	
		url: basePath+'user/showUsersAjax.html',
		data: {
			userId:"110",
			sort:"id",
			pageIndex:"1"
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
			 creatPage(pageNum,1,"userAccount");

		},
		error: function(jqXHR){     
		   alert("发生错误：" + jqXHR.status);  
		},     
	});
    
   

  });

  $("#notice").click(function(){
    $("#userAdd").hide();
    $("#userEdit").hide();
    $("#noticeEdit").fadeIn();

  });



  
  var date=new Date();
  var year=date.getFullYear();
  var month=date.getMonth()+1;
  var day=date.getDay();
  var time = year+"-"+month+"-"+day;
  $('#datetimepicker').val(time);
  
  
  
  $.fn.datetimepicker.dates['zh-CN'] = {  
          days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],  
          daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],  
          daysMin:  ["日", "一", "二", "三", "四", "五", "六", "日"],  
          months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],  
          monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],  
          today: "今天",  
          suffix: [],  
          meridiem: ["上午", "下午"]  
  }; 
  
  $('#datetimepicker').datetimepicker({
	  minView:2,
	  autoclose:1,
	  language:  'zh-CN'
      });
  
  $('#datetimepicker1').datetimepicker({
	  minView:2,
	  autoclose:1,
	  language:  'zh-CN'
      });
  
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
  
  $("#submitUser").click(function(){
	  var userName=$("#userInput input").eq(0).val().trim();
	  var userAccount=$("#userInput input").eq(1).val().trim();
	  var workTime=$('#datetimepicker').val();
	  var departmentId=$("#userInput select").val();
	  
	  
	  if(userName==""||userAccount==""){
		  toastr.error("请输入完整信息");
	  }else{
		  $.ajax({
				type: 'POST',
				url:basePath+'user/addUserAjax.html',
				data: {
					userName:userName,
					userAccount:userAccount,
					workTime:workTime,
					departmentId:departmentId
					},
				dataType: 'json',
				success: function(data){
				var resultState=data.success;
				if(resultState==1){
					toastr.success("用户添加成功");
					$("#userInput input").eq(0).val("");
					$("#userInput input").eq(1).val("");
				}else{
					 toastr.error("该工号已存在，添加失败");
				}

				},
				error: function(jqXHR){
					alert("发生错误：" + jqXHR.status);
				},
			});	
	  } 
	  
	  });
  
  $("#userInput input").eq(0).focus(function(){
	 toastr.info("请输入真实姓名"); 
  });
  
  $("#userInput input").eq(1).focus(function(){
		 toastr.info("请输入员工工号"); 
	  });
  
  $("#userInput input").eq(2).focus(function(){
		 toastr.info("请选择员工入职日期"); 
	  });
  
  $("#userInput select").focus(function(){
		 toastr.info("请选择员工部门"); 
	  });
  
  
  
  function showUsers(userId,userName,userAccount,workTime,departId,departName){
		var node='';	
		node+='<tr id="user'+userId+'"><td>'+userName+'</td><td>'+userAccount+'</td><td>'+departName+'</td><td>'+workTime+'</td><td onclick="edit(this,'+userId+','+departId+')"><i class="fa fa-edit fa-lg edit" ></i><td><i class="fa fa-trash-o fa-lg del" onclick="del(this,'+userId+','+departId+')"></i></td><td><i class="fa fa-rotate-right fa-lg reset" onclick="reset(this,'+userId+')"></i></td> </tr>';
		$("#userBody").append(node);
		
	}
  
  
  
  
  function sort(sortMethod){	  
	  
  $.ajax({ 
    type: 'POST', 	
	url: basePath+'user/showUsersAjax.html',
	data: {
		userId:"110",
		sort:sortMethod,
		pageIndex:"1"
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
		 creatPage(pageNum,1,sortMethod);

	},
	error: function(jqXHR){     
	   alert("发生错误：" + jqXHR.status);  
	},     
});
  
  
  }
  
  
  
  		$("#sort li").eq(0).click(function(){
  				var sortMethod="userName";
  				sort(sortMethod);

  		});
  		$("#sort li").eq(1).click(function(){
  			var sortMethod="userAccount";
  			sort(sortMethod);

  		});
  		$("#sort li").eq(2).click(function(){
  			var sortMethod="departId";
  			sort(sortMethod);

  		});

  

  
  
  		function creatPage(pageNum,pageIndex,sortMethod){
  		  	$('#page').html("");
  			var node='';
  			for(var i=0;i<pageNum;i++){

  			node+='<li><a id="'+(i+1)+'" onclick="page(\''+sortMethod+'\','+(i+1)+')">'+(i+1)+'</a></li>';}

  			if(parseInt(pageNum)!=1&&parseInt(pageIndex)!=parseInt(pageNum)){
  				node+='<li><a id="'+(parseInt(pageIndex)+1)+'" onclick="page(\''+sortMethod+'\','+(parseInt(pageIndex)+1)+')">下一页 &rarr;</a></li>';
  			}
  			$('#page').append(node);
  			if(parseInt(pageIndex)!=1){
  				$('#page').prepend('<li><a id="'+(parseInt(pageIndex)-1)+'" onclick="page(\''+sortMethod+'\','+(parseInt(pageIndex)-1)+')">&larr; 上一页</a></li>');
  			}
  		}
  
  
  

});
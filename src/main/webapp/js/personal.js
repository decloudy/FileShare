/*
* @Author: Marte
* @Date:   2017-11-30 23:11:07
* @Last Modified by:   Marte
* @Last Modified time: 2017-12-17 19:39:51
*/

'use strict';

$(document).ready(function(){
  $(".menuOption:eq(0)").click(function(){
	  var id="110";
	  $.ajax({
			type: 'POST',
			url:basePath+'user/infoShowAjax.html',
			data: {
				userId:id
				},
			dataType: 'json',
			success: function(data){
			var show_address=data.address;
			var show_tel=data.tel;
			var show_email=data.email;
			var show_gender=data.gender;
			
			

			$("#show_tel").html(show_tel);
			$("#show_address").html(show_address);
			$("#show_email").html(show_email);
			$("#show_gender").html(show_gender);


			},
			error: function(jqXHR){
				alert("发生错误：" + jqXHR.status);
			},
		});	
	  
	  
	  
    $("#information").fadeIn();;
    $("#share").hide();
    $("#set").hide();

  });


  $(".menuOption:eq(1)").click(function(){
    $("#information").hide();
    $("#share").fadeIn();;
    $("#set").hide();

  });
  $(".menuOption:eq(2)").click(function(){
    $("#information").hide();
    $("#share").hide();
    $("#set").fadeIn();;

  });



  $("#passEdit").click(function(){

    $("#modal-container-449471").modal('show');
    $('#pwd_warning').hide();
    $("#pwdInput input").eq(0).val("");
    $("#pwdInput input").eq(1).val("");
    $("#pwdInput input").eq(2).val("");

  });

  

    $("#headEdit").click(function(){

    $("#modal-container-99553").modal('show');

  });
    
    
    
    
    var $image=$('.imgContainer > img');
    var form = document.forms.namedItem("fileinfo");
    $image.cropper({
      aspectRatio: 1 / 1,
      guides: false
    });
    var $inputImage = $('#inputImage'),
          URL = window.URL || window.webkitURL,
          blobURL;

      if (URL) {
        $inputImage.change(function () {
          var files = this.files,
              file;

          if (files && files.length) {
            file = files[0];

            if (/^image\/\w+$/.test(file.type)) {
              blobURL = URL.createObjectURL(file);
              $image.one('built.cropper', function () {
                URL.revokeObjectURL(blobURL); // Revoke when load complete
              }).cropper('reset', true).cropper('replace', blobURL);
              $inputImage.val('');
            } else {
              showMessage('Please choose an image file.');
            }
          }
        });
      } else {
        $inputImage.parent().remove();
      }
      
      
      
      
      $('.imgConfirm').click(function(event) {
          var result=$image.cropper('getCroppedCanvas');
          $("#showImage").html(result);
          var carvans=document.getElementById("showImage");
          carvans=carvans.getElementsByTagName("canvas")[0];
          var data=carvans.toDataURL();
           $.ajax({
        	  url: basePath+'user/iconAjax.html',
        	  type: "POST",
        	  data: {"image":data.toString()},
        	  dataType:'json',
        	  success: function(data){
        		  	  if(data.success){
        		  		$("#modal-container-99553").modal('hide');
        		  		$("#modal-container-173159").modal('show'); 		  		
        		  		
        		  	  }else{
        		  		  alert("发生错误");
        		  	  }
      		},
      		error: function(jqXHR){
      		   alert("发生错误：" + jqXHR.status);
      		},
          });
        });
    
    
      toastr.options = {

  	        "closeButton": true, //是否显示关闭按钮

  	        "debug": false, //是否使用debug模式

  	        "positionClass":'toast-top-center',//弹出窗的位置

  	        "showDuration": "300",//显示的动画时间

  	        "hideDuration": "300",//消失的动画时间

  	        "timeOut": "1000", //展现时间

  	        "extendedTimeOut": "1000",//加长展示时间

  	        "showEasing": "swing",//显示时的动画缓冲方式

  	        "hideEasing": "linear",//消失时的动画缓冲方式

  	        "showMethod": "fadeIn",//显示时的动画方式

  	        "hideMethod": "fadeOut" //消失时的动画方式

  	    };
      
   
      $(".dwl").click(function(){
    	    $("#modal-container-455769").modal('show');

    	  });

      $(".del").click(function(){
    	    $("#modal-container-455769").modal('show');

    	  });
    
});
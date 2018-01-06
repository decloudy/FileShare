package com.zust.FileShare.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zust.FileShare.dto.DepartmentDto;
import com.zust.FileShare.dto.FiletypeDto;
import com.zust.FileShare.dto.UserDto;
import com.zust.FileShare.entity.User;
import com.zust.FileShare.service.DepartmentService;
import com.zust.FileShare.service.FileTypeServiceI;
import com.zust.FileShare.service.UserService;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping("/user")
public class UserController {

	
	@Autowired
    private UserService userService;
	
	@Autowired
    private DepartmentService departmentService;
	
	@Autowired
    private FileTypeServiceI fileTypeService;

    
    @Autowired
    private HttpSession session;
	
    @RequestMapping(value = "/personal/{id}",method = RequestMethod.GET)
    public String personal(@PathVariable("id") int id,ModelMap model){
    	
    	UserDto userDto = userService.findById(id);
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		String workTime=dateFormat.format(userDto.getWorkTime());
    	model.addAttribute("user",userDto);
    	model.addAttribute("workTime",workTime);
    	
        return "personal";
    }
    
    
    @RequestMapping(value = "/admin",method = RequestMethod.GET)
    public String admin(ModelMap model){
    	model.addAttribute("departList", departmentService.findAllDepart());
        return "admin";
    }
    
    
    @RequestMapping(value="/pwdChangeAjax",method=RequestMethod.POST)
	 public void pwdChangeAjax(HttpServletRequest request,HttpServletResponse response) {
		try {

			int userId= Integer.parseInt(request.getParameter("userId"));
			String newPassword=request.getParameter("newPassword");
			PrintWriter out = response.getWriter();
			UserDto userDto=(UserDto) session.getAttribute("loginUser");
			userDto.setPassword(newPassword);
			session.setAttribute("loginUser", userDto);
			int state=userService.pwdChange(userId, newPassword);
										
			out.print("{\"success\":\""+newPassword+"\"}");
			out.flush();  
			out.close(); 

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
    
    
    
    @RequestMapping(value="/infoChangeAjax",method=RequestMethod.POST)
	 public void infoChangeAjax(HttpServletRequest request,HttpServletResponse response) {
		try {

			int userId= Integer.parseInt(request.getParameter("userId"));
			String tel=request.getParameter("tel");
			String email=request.getParameter("email");
			String address=request.getParameter("address");
			String gender=request.getParameter("gender");
			PrintWriter out = response.getWriter();
			UserDto userDto=(UserDto) session.getAttribute("loginUser");
			int gender_num=0;
			if(gender.equals("男")){
				gender_num=1;
			}else if(gender.equals("女")){
				gender_num=-1;
			}
			userDto.setUserGender(gender_num);
			userDto.setGender(gender);
			
			if(address==null||address==""){
				userDto.setAddress("未填写");
			}else{
				userDto.setAddress(address);
			}
			if(email==null||email==""){
				userDto.setEmail("未填写");
			}else{
				userDto.setEmail(email);
			}
			if(tel==null||tel==""){
				userDto.setTelephone("未填写");
			}else{
				userDto.setTelephone(tel);
			}
			session.setAttribute("loginUser", userDto);
			int state=userService.infoChange(userId,tel,email,gender_num,address);
			StringBuffer json=new StringBuffer();
			json.append("{\"tel\":\""+tel+"\",");
			json.append("\"email\":\""+email+"\",");
			json.append("\"gender\":\""+gender+"\",");
			json.append("\"adress\":\""+address+"\"}");
			out.print(json.toString());
			out.flush();  
			out.close(); 

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
    
    
    
    @RequestMapping(value="/infoShowAjax",method=RequestMethod.POST)
	 public void infoShowAjax(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			int userId= Integer.parseInt(request.getParameter("userId"));
			PrintWriter out = response.getWriter();
			UserDto userDto=(UserDto) session.getAttribute("loginUser");

			String tel=userDto.getTelephone();
			String email=userDto.getEmail();
			String gender=userDto.getGender();
			String address=userDto.getAddress();
			StringBuffer json=new StringBuffer();
						

			json.append("{\"tel\":\""+tel+"\",");
			json.append("\"email\":\""+email+"\",");
			json.append("\"gender\":\""+gender+"\",");
			json.append("\"address\":\""+address+"\"}");
			
			
			out.print(json.toString());
			out.flush();  
			out.close(); 

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
    
    
    
    @RequestMapping(value="/setChangeAjax",method=RequestMethod.POST)
	 public void setChangeAjax(HttpServletRequest request,HttpServletResponse response) {
		try {

			int userId= Integer.parseInt(request.getParameter("userId"));
			int set= Integer.parseInt(request.getParameter("setState"));
			PrintWriter out = response.getWriter();
			UserDto userDto=(UserDto) session.getAttribute("loginUser");
			userDto.setUserSet(set);
			session.setAttribute("loginUser", userDto);
			int state=userService.setChange(userId, set);
										
			out.print("{\"success\":\""+state+"\"}");
			out.flush();  
			out.close(); 

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
    
    
    @RequestMapping(value="/showEditAjax",method=RequestMethod.POST)
	 public void showEditAjax(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			int userId= Integer.parseInt(request.getParameter("userId"));
			PrintWriter out = response.getWriter();
			UserDto userDto=userService.findById(userId);
			SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
			String workTime=dateFormat.format(userDto.getWorkTime());
			StringBuffer json=new StringBuffer();
			json.append("{\"userAccount\":\""+userDto.getUserAccount()+"\",");
			json.append("\"workTime\":\""+workTime+"\",");
			json.append("\"departmentId\":\""+userDto.getDepartId()+"\",");
			json.append("\"userName\":\""+userDto.getUserName()+"\"}");
			out.print(json.toString());
										
			out.flush();  
			out.close(); 

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
    
    
    
    
    @RequestMapping(value="/addUserAjax",method=RequestMethod.POST)
  	 public void addUserAjax(HttpServletRequest request,HttpServletResponse response) throws ParseException {
  		try {

  			String userName= request.getParameter("userName");
  			String userAccount= request.getParameter("userAccount");
  			String workTime= request.getParameter("workTime");
  			int departmentId= Integer.parseInt(request.getParameter("departmentId"));
  			int resultState=1;
  			
  			SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
  			Date workDate=dateFormat.parse(workTime);
  			PrintWriter out = response.getWriter();
  			UserDto userDto=new UserDto();
  			UserDto userDto1=userService.findByaccount(userAccount);
  			if(userDto1!=null){
  				resultState=0;
  				out.print("{\"success\":\""+resultState+"\"}");
  	  			out.flush();  
  	  			out.close(); 
  			}else{
  				
  				userDto.setDepartId(departmentId);
  				userDto.setWorkTime(workDate);
  				userDto.setUserAccount(userAccount);
  				userDto.setUserName(userName);
  				userDto.setUserType(0);
  				userDto.setUserGender(0);
  				userDto.setUserSet(0);
  				userDto.setPassword("888888");
  				int state=userService.addUser(userDto);
  				
  				
  				UserDto userDto2=userService.findByaccount(userAccount);
  				String filePath=request.getSession().getServletContext().getRealPath("/")+"/files/"; 

  				filePath =filePath+userDto2.getId();

  				File file = new File(filePath);
  	            if (!file.exists()) {  
  	               file.mkdirs();  
  	               List<FiletypeDto> fileTypeDto=fileTypeService.getFileTypeList();
  	             for(FiletypeDto fileType:fileTypeDto){			
  	    			String childPath=filePath+"/"+fileType.getId();
  	    			File typeFile = new File(childPath);
  	   	            if (!typeFile.exists()) {  
  	   	            	typeFile.mkdirs();  
  	   	            } 
  	    		}
  	               
  	            }  

				
  				out.print("{\"success\":\""+resultState+"\"}");
  	  			out.flush();  
  	  			out.close(); 
  			}
  			 			

  		} catch (IOException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
  }
    
    
    @RequestMapping(value="/showUsersAjax",method=RequestMethod.POST)
	 public void showUsersAjax(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=utf-8");
			int userId= Integer.parseInt(request.getParameter("userId"));
			String sort="id";
			PrintWriter out = response.getWriter();
			List<UserDto> userDto=userService.findByPages(1, 8, sort);
			long count=userService.getCount();
			int pageNum=0;
			if(count%8==0){
				pageNum=(int) (count/8);
			}else{
				pageNum=(int) (count/8+1);
			}
			System.out.println(count);
			System.out.println(pageNum);
			
			StringBuffer json=new StringBuffer();
			json.append("{\"users\":[");
			for(UserDto user:userDto){
				SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
				String workTime=dateFormat.format(user.getWorkTime());
				json.append("{\"id\":\""+user.getId()+"\",");
				json.append("\"departId\":\""+user.getDepartId()+"\",");
				json.append("\"userName\":\""+user.getUserName()+"\",");
				json.append("\"workTime\":\""+workTime+"\",");
				json.append("\"departName\":\""+user.getDepartName()+"\",");
				json.append("\"userAccount\":\""+user.getUserAccount()+"\"},");	
			}
			json.deleteCharAt(json.length() - 1);
			json.append("]}");
			out.print(json.toString());
			out.flush();  
			out.close(); 

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
    
    
    
    @RequestMapping(value="/editUserAjax",method=RequestMethod.POST)
  	 public void editUserAjax(HttpServletRequest request,HttpServletResponse response) throws ParseException {
  		try {

  			int userId= Integer.parseInt(request.getParameter("userId"));
  			int departId=Integer.parseInt(request.getParameter("departmentId"));
  			String userName=request.getParameter("userName");
  			String userAccount=request.getParameter("userAccount");
  			String workTime=request.getParameter("workTime");


  			SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
  			Date workDate=dateFormat.parse(workTime);
  			System.out.println(workDate);
  			PrintWriter out = response.getWriter();
  			UserDto userDto=userService.findById(userId);
  			UserDto userDto1=userService.findByaccount(userAccount);
  			if(userDto1!=null&&userDto.getUserAccount()!=userDto1.getUserAccount()){
  					int resultState=0;
  	  				out.print("{\"success\":\""+resultState+"\"}");
  	  	  			out.flush();  
  	  	  			out.close(); 
  				
  			}else{
  				
  				int resultState=userService.userChange(userId, userName, userAccount, departId, workTime);
  				UserDto userDto2=userService.findById(userId);
  	  			StringBuffer json=new StringBuffer();
  	  			json.append("{\"success\":\""+resultState+"\",");
  	  			json.append("\"departName\":\""+userDto2.getDepartName()+"\"}");
  	  			System.out.println(json);
  	  			out.print(json.toString());
  	  			out.flush();  
  	  			out.close(); 
  				
  				
  			}
  			

  		} catch (IOException e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
  }
    
    
    
    
    @RequestMapping(value="/iconAjax",method=RequestMethod.POST)
	public void iconAjax(HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession();
		UserDto userDto=(UserDto) session.getAttribute("loginUser");
		int userId=userDto.getId();
		String image=request.getParameter("image");
		String filePath=request.getSession().getServletContext().getRealPath("/")+"/personalIcon/"; 
	    String fileName=userId+".jpg";
		String imgFilePath = filePath+fileName;
		 // 只允许image  
        String header ="data:image";  
        String[] imageArr=image.split(",");  
        if(imageArr[0].contains(header)){//是img的  
      
      // 去掉头部  
        image=imageArr[1]; 
		try {
			Base64  decoder = new Base64();  
			byte[] decodedBytes = decoder.decode(image);
			File targetFile = new File(filePath);  
            if(!targetFile.exists()){    
                targetFile.mkdirs();    
            }  
			FileOutputStream out = new FileOutputStream(imgFilePath);
			out.write(decodedBytes);
			out.close(); 
			response.setCharacterEncoding("UTF-8");
			PrintWriter out_1 = response.getWriter();
			out_1.print("{\"success\":true}");
			out_1.flush();
			out_1.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       }
    }
      
    
    
 // 登录
 	@RequestMapping(value = "/load", method = RequestMethod.GET)
 	public String load(HttpSession session, HttpServletRequest request) {
 		
 		List<UserDto> userDto=userService.findAllUsers();
 		List<FiletypeDto> fileTypeDto=fileTypeService.getFileTypeList();
 		String filePath=request.getSession().getServletContext().getRealPath("/")+"/files/"; 
 		for(UserDto user:userDto){
 			int id=user.getId();			
 			String personalPath=filePath+id;
 			File personFile = new File(personalPath);
	            if (!personFile.exists()) {  
	            	personFile.mkdirs();
	            	 
	  	             for(FiletypeDto fileType:fileTypeDto){			
	  	    			String childPath=filePath+user.getId()+"/"+fileType.getId();
	  	    			File typeFile = new File(childPath);
	  	   	            if (!typeFile.exists()) {  
	  	   	            	typeFile.mkdirs();  
	  	   	            } 
	            	
	  	             }
	            } 
 		}
 		
 		List<DepartmentDto> departmentDto=departmentService.findAllDepart();
 		for(DepartmentDto depart:departmentDto){
 			int departId=depart.getId();	
 			String departPath=filePath+"depart"+departId;
 			File departFile = new File(departPath);
	            if (!departFile.exists()) {  
	            	departFile.mkdirs();  
	            	
	            	 for(FiletypeDto fileType:fileTypeDto){			
		  	    			String childPath=departPath+"/"+fileType.getId();
		  	    			File typeFile = new File(childPath);
		  	   	            if (!typeFile.exists()) {  
		  	   	            	typeFile.mkdirs();  
		  	   	            } 
	            	 }
	            } 
 		}
 		
 		
 		
 		String companyPath=filePath+"company";
 		File companyFile = new File(companyPath);
        if (!companyFile.exists()) {  
        	companyFile.mkdirs(); 
        	
        	 for(FiletypeDto fileType:fileTypeDto){			
	    			String childPath=companyPath+"/"+fileType.getId();
	    			File typeFile = new File(childPath);
	   	            if (!typeFile.exists()) {  
	   	            	typeFile.mkdirs();  
	   	            } }
        } 
 		
 		
 		
 		
 		return "login";

 	}

 	@RequestMapping(value = "/exit", method = RequestMethod.GET)
 	public String tuichu(HttpSession session) {
 		session.invalidate();
 		return "login";

 	}
 	
 	
 	@RequestMapping(value = "/message", method = RequestMethod.GET)
 	public String message(HttpSession session) {
 		return "message";

 	}

 	@RequestMapping(value = "/dologin", method = RequestMethod.POST, params = "loginname")
 	public String doload(@RequestParam("loginname") String userAccount, @RequestParam("password") String password,
 			HttpSession session) {
 		if (userAccount == null || userAccount.length() <= 0) {
 			JOptionPane.showMessageDialog(null, "用户名不能为空", "提示", JOptionPane.ERROR_MESSAGE);
 			return "login";
 		}
 		if (password == null || password.length() <= 0) {
 			JOptionPane.showMessageDialog(null, "密码不能为空", "提示", JOptionPane.ERROR_MESSAGE);
 			return "login";
 		}

 		UserDto userdto = new UserDto();
 		userdto = userService.findByaccount(userAccount);
 		if (userdto == null) {
 			JOptionPane.showMessageDialog(null, "账号不存在", "提示", JOptionPane.ERROR_MESSAGE);
 			return "login";
 		}
 		String turepassword = userdto.getPassword();
 		if (password.equals(turepassword)) {
 			session.setAttribute("loginUser", userdto);
 			// int type=userdto.getUserType();

 			// if(type==1) {
 			//
 			//
 			// }
 			// else if(type==0) {
 			//
 			//
 			// }
 			return "redirect:personal/"+userdto.getId()+".html";
 		} else {
 			JOptionPane.showMessageDialog(null, "密码错误", "提示", JOptionPane.ERROR_MESSAGE);
 			return "login";
 		}
 	}

 	// 浏览主页面
 	@RequestMapping(value = "/main", method = RequestMethod.GET)
 	public String lookinto(HttpSession session) {
 		// 改为dto
 		UserDto user0 = (UserDto) session.getAttribute("user");
 		if (user0 == null) {
 			return "login";
 		} else
 			return "message";
 	}
    



}

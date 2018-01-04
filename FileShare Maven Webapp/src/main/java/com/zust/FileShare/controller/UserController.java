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
import com.zust.FileShare.dto.UserDto;
import com.zust.FileShare.entity.User;
import com.zust.FileShare.service.DepartmentService;
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
  				System.out.println(filePath);
  				File file = new File(filePath);
  				file.mkdirs();
  				
				
  				out.print("{\"success\":\""+resultState+"\"}");
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
 	public String load(HttpSession session) {
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

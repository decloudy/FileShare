package com.zust.FileShare.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.zust.FileShare.dao.MessageDao;
import com.zust.FileShare.dao.UserDao;
import com.zust.FileShare.dto.MessageDto;
import com.zust.FileShare.dto.UserDto;
import com.zust.FileShare.entity.Message;
import com.zust.FileShare.entity.User;
import com.zust.FileShare.service.MessageService;
import com.zust.FileShare.service.UserService;


@Controller
@RequestMapping("/message")
public class MessageController {
	@Autowired
    private UserService userService;
	@Autowired
    private MessageService messageservice;
    @Autowired
    private HttpSession session;
    
    @RequestMapping(value="/savemessage",method=RequestMethod.POST)
	 public void savemessage(HttpServletRequest request,HttpServletResponse response) throws IOException {
    	try {
    	Integer sendid= Integer.parseInt(request.getParameter("sendid"));
    	Integer recevieid= Integer.parseInt(request.getParameter("recevieid"));
		String content=request.getParameter("content");
		PrintWriter out = response.getWriter();
		MessageDto messagedto=new MessageDto();
		messagedto.setContent(content);
		messagedto.setUserByReceiveId(recevieid);
		messagedto.setUserBySendId(sendid);
		messagedto.setMsgType(0);
		int state=messageservice.saveMessage(messagedto);
		
		out.print("success");
		out.flush();  
		out.close();
    	} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    @RequestMapping(value="/findmessage",method=RequestMethod.POST)
	 public void findmessage(HttpServletRequest request,HttpServletResponse response)throws IOException  {
    	try {
        	Integer recevieid= Integer.parseInt(request.getParameter("recevieid"));
    		PrintWriter out = response.getWriter();
    		MessageDto messagedto=new MessageDto();
    		//Î´Íê

    		out.flush();  
    		out.close();
        	} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    }
    @RequestMapping(value="/findshare",method=RequestMethod.POST)
	 public void findshare(HttpServletRequest request,HttpServletResponse response) throws IOException  {
    	try {
        	Integer recevieid= Integer.parseInt(request.getParameter("recevieid"));
    		PrintWriter out = response.getWriter();
    		MessageDto messagedto=new MessageDto();
    		//Î´Íê

    		out.flush();  
    		out.close();
        	} catch (IOException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    }
    
}

//@RequestMapping(value="/pwdChangeAjax",method=RequestMethod.POST)
// public void pwdChangeAjax(HttpServletRequest request,HttpServletResponse response) {
//	try {
//
//		int userId= Integer.parseInt(request.getParameter("userId"));
//		String newPassword=request.getParameter("newPassword");
//		PrintWriter out = response.getWriter();
//		UserDto userDto=(UserDto) session.getAttribute("loginUser");
//		userDto.setPassword(newPassword);
//		session.setAttribute("loginUser", userDto);
//		int state=userService.pwdChange(userId, newPassword);
//									
//		out.print("{\"success\":\""+newPassword+"\"}");
//		out.flush();  
//		out.close(); 
//
//	} catch (IOException e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
//}

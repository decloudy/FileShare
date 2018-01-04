package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import entity.Tequipment;
import entity.Tuser;
import service.UserServiceDo;
import service.Dao.TequipmentDAO;
import service.Dao.TuserDAO;

@Controller
@RequestMapping("/user")
public class UserController {
	UserServiceDo userservice=new UserServiceDo();
	TuserDAO userdao=new TuserDAO();
	TequipmentDAO equipmentdao=new TequipmentDAO();
Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value="/regist",method=RequestMethod.GET)
	//进入注册
	public String Register(){
		return "regist";
	}
	@RequestMapping(value="/regist",method=RequestMethod.POST)
	//注册确认
	public String Registed(HttpSession session,Tuser user){
		logger.info("regist action"+user.getLoginName());
		Date time = new Date();
		Tuser u=new Tuser();
		u.setLoginName(user.getLoginName());
		u.setPassword(user.getPassword());
		u.setRealName(user.getRealName());
		u.setType(user.getType());
		u.setEmail(user.getEmail());
		u.setTel(user.getTel());
		u.setType(1);
//		user.setLastLoginTime(time);
		session.setAttribute("user", u);
		userdao.save(u);
		return "login";
	}
	//进入登录
	@RequestMapping("/login")
	public String getLogin() {
		return "login";
	}
	@RequestMapping("/loginType")
    public ModelAndView adminSave(HttpServletRequest request,HttpSession session,Tuser user,String password) {
		session.setAttribute("user", user);
		request.setAttribute("password", password);
		ModelAndView modelAndView = new ModelAndView();
//		logger.info("密码"+user.getLoginName());
		
		List<Tequipment> allEquipment;
		
		List<Tuser> findUser=userdao.findByProperty("loginName", user.getLoginName());
//		logger.info("密码"+findUser.size());
		for(Tuser userType:findUser) {
			String datebasepw=userType.getPassword();
			String inputpw=request.getParameter("password");
			//管理员登录
			if(userType.getType()==0&&datebasepw.equals(inputpw)) {
				allEquipment=userservice.getAllEquipment();
				Date time2 = new Date(); 
//				logger.info("管理员"+allEquipment.size());
				List<Tuser> allLoginName=userservice.getAllLoginName();
				userservice.updateLoginTime(time2, user.getLoginName());
				modelAndView.addObject("allEquipment", allEquipment);
				modelAndView.addObject("allLoginName",allLoginName);
				modelAndView.setViewName("adminhome");
			}
			//普通用户登录
			else if(userType.getType()==1&&datebasepw.equals(inputpw)) {
				Date time3 = new Date(); 
				userservice.updateLoginTime(time3, user.getLoginName());
				allEquipment=userservice.getEquipment(user.getLoginName());
//				logger.info("用户"+allEquipment.size());
				modelAndView.addObject("Equipment", allEquipment);
				modelAndView.setViewName("userhome");
			}
			else {
				modelAndView.setViewName("login");
			}
		}
		
		return modelAndView;
	}
//	添加设备
	@RequestMapping(value="/AddEquipment",method=RequestMethod.POST)
	public ModelAndView AddEquipment(HttpServletRequest request,Tequipment equipment,String username) {
		Date time4 = new Date(); 
		ModelAndView modelAndView = new ModelAndView();
		request.setAttribute("username", username);
		
		List<Tuser> selectUser=userservice.findId((String)request.getAttribute("username"));
		for(Tuser user:selectUser) {
			equipment.setUserId(user);
		}
		equipment.setName(equipment.getName());
		equipment.setDescription(equipment.getDescription());
		equipment.setCode(equipment.getCode());
		equipment.setAddTime(time4);
		equipment.setPrice(equipment.getPrice());
		equipment.setPlace(equipment.getPlace());
		equipmentdao.save(equipment);
		List<Tequipment> allEquipment=userservice.getAllEquipment();
		modelAndView.addObject("allEquipment",allEquipment);
		modelAndView.setViewName("adminhome");
		return modelAndView;
	}
}

package com.zust.FileShare.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.zust.FileShare.dto.FileDto;
import com.zust.FileShare.dto.UserDto;
import com.zust.FileShare.service.FileServiceI;

/**
 * 资源控制器
 * 
 * @author 孙宇
 * 
 */
@Controller
@RequestMapping("/fileController")
public class FileController {
	Logger logger = LoggerFactory.getLogger(FileController.class);
	@Autowired
	private FileServiceI fileService;

	/**
	 * 获得资源树(资源类型为某类型)
	 * 
	 * 通过用户ID判断，他能看到的资源
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/listall", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView list(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		List<FileDto> files = fileService.allFile(1);
		modelAndView.addObject("files", files);
		modelAndView.setViewName("personalSpace");
		return modelAndView;
	}

	@RequestMapping(value = "/listpicture", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView listpicture(HttpServletRequest request, HttpServletResponse response) {
		int ty = 1;
		ModelAndView modelAndView = new ModelAndView();
		List<FileDto> files = fileService.getFile(1, ty);
		// logger.info("具体："+files.get(0).getFileName());
		modelAndView.addObject("files", files);
		modelAndView.setViewName("personalSpace1");
		return modelAndView;
	}

	@RequestMapping(value = "/listtxt", method = { RequestMethod.GET, RequestMethod.POST })

	public ModelAndView listtxt(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		int ty = 2;
		List<FileDto> files = fileService.getFile(1, ty);
		// logger.info("具体："+files.get(0).getFileName());
		modelAndView.addObject("files", files);
		modelAndView.setViewName("personalSpace2");
		return modelAndView;
	}

	@RequestMapping(value = "/listvideo", method = { RequestMethod.GET, RequestMethod.POST })

	public ModelAndView listvideo(HttpServletRequest request, HttpServletResponse response) {
//		logger.info("具体：");
		ModelAndView modelAndView = new ModelAndView();
		int ty = 3;
		List<FileDto> files = fileService.getFile(1, ty);
		//logger.info("具体："+files.get(0).getFileName());
		modelAndView.addObject("files", files);
		modelAndView.setViewName("personalSpace3");
		return modelAndView;
	}

	@RequestMapping(value = "/listmusic", method = { RequestMethod.GET, RequestMethod.POST })

	public ModelAndView listmusic(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		int ty = 4;
		List<FileDto> files = fileService.getFile(1, ty);
		// logger.info("具体："+files.get(0).getFileName());
		modelAndView.addObject("files", files);
		modelAndView.setViewName("personalSpace4");
		return modelAndView;
	}

	@RequestMapping(value = "/listother", method = { RequestMethod.GET, RequestMethod.POST })

	public ModelAndView listother(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		int ty = 5;
		List<FileDto> files = fileService.getFile(1, ty);
		// logger.info("具体："+files.get(0).getFileName());
		modelAndView.addObject("files", files);
		modelAndView.setViewName("personalSpace5");
		return modelAndView;
	}

	
	
	/**
	 * 添加资源
	 * 
	 * @return
	 */
	@RequestMapping(value = "upload", method = RequestMethod.GET)

	public String upload() {
		return "upload";
	}

	@RequestMapping(value = "upload", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView uploadForm(HttpServletRequest request, HttpServletResponse response) {
		UserDto userdto=new UserDto();
			//request.getParameter("username")
		 	FileDto filedto=new FileDto();
			String file1=request.getParameter("file");

			ModelAndView modelAndView = new ModelAndView();
	        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;     
	        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy/MM/dd/HH");     
	        /**构建图片保存的目录**/    
	        String logoPathDir = "/files/"+userdto.getUserName(); 
	        /**得到图片保存目录的真实路径**/    
	        String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);   
	        
	        /**根据真实路径创建目录**/    
	        File logoSaveFile = new File(logoRealPathDir);     
	        if(!logoSaveFile.exists())     
	            logoSaveFile.mkdirs();           
	        /**页面控件的文件流**/    
	        MultipartFile multipartFile = multipartRequest.getFile("file");      
	        /**获取文件的后缀**/    
	        String suffix = multipartFile.getOriginalFilename().substring  
	                        (multipartFile.getOriginalFilename().lastIndexOf("."));   
	        
//	        /**使用UUID生成文件名称**/    
//	        String logImageName = UUID.randomUUID().toString()+ suffix;//构建文件名称     
	        String logImageName = multipartFile.getOriginalFilename(); 
	        //logger.info("具体："+suffix);
	        /**拼成完整的文件保存路径加文件**/    
	        String fileName = logoRealPathDir + File.separator   + logImageName;                
	        File file = new File(fileName);          
	       logger.info("具体："+multipartFile.getSize());
	        try {     
	            multipartFile.transferTo(file);     
	        } catch (IllegalStateException e) {     
	            e.printStackTrace();     
	        } catch (IOException e) {            
	            e.printStackTrace();     
	        } 
	        /** 添加到filedto**/
	        filedto.setUser("1");
	        filedto.setSize(multipartFile.getSize());
	       filedto.setFileName(logImageName);
	       filedto.setFileAddress(fileName);
	       filedto.setUploadTime(new Date());
	       fileService.add(filedto,suffix);
			
	        modelAndView.addObject("fileName", fileName);
			modelAndView.setViewName("personalSpace");
			return modelAndView;
			//return "redirect: /listall"; 
	}
	/**
	 * 跳转到资源编辑页面
	 */
	 @RequestMapping("/sharePage")
	 public void editPage(HttpServletRequest request, String id) {
//	 request.setAttribute("resourceTypeList",resourceTypeService.getResourceTypeList());
//	 Resource r = resourceService.get(id);
//	 request.setAttribute("resource", r);
//	 return "/admin/resourceEdit";
	 }
	
	/**
	 * 编辑资源
	 * 
	 * @param resource
	 * @return
	 */
	// @RequestMapping("/edit")
	// @ResponseBody
	// public Json edit(Resource resource) {
	// Json j = new Json();
	// resourceService.edit(resource);
	// j.setSuccess(true);
	// j.setMsg("编辑成功！");
	// return j;
	// }

	/**
	 * 获得资源列表
	 * 
	 * 通过用户ID判断，他能看到的资源
	 * 
	 * @return
	 */
	// @RequestMapping("/treeGrid")
	// @ResponseBody
	// public List<Resource> treeGrid(HttpSession session) {
	// SessionInfo sessionInfo = (SessionInfo)
	// session.getAttribute(ConfigUtil.getSessionInfoName());
	// return resourceService.treeGrid(sessionInfo);
	// }

	/**
	 * 删除资源
	 * 
	 * @param id
	 * @return
	 */
	// @RequestMapping("/delete")
	// @ResponseBody
	// public Json delete(String id) {
	// Json j = new Json();
	// resourceService.delete(id);
	// j.setMsg("删除成功！");
	// j.setSuccess(true);
	// return j;
	// }

}

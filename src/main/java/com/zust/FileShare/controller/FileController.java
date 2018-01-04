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
 * ��Դ������
 * 
 * @author ����
 * 
 */
@Controller
@RequestMapping("/fileController")
public class FileController {
	Logger logger = LoggerFactory.getLogger(FileController.class);
	@Autowired
	private FileServiceI fileService;

	/**
	 * �����Դ��(��Դ����Ϊĳ����)
	 * 
	 * ͨ���û�ID�жϣ����ܿ�������Դ
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
		// logger.info("���壺"+files.get(0).getFileName());
		modelAndView.addObject("files", files);
		modelAndView.setViewName("personalSpace1");
		return modelAndView;
	}

	@RequestMapping(value = "/listtxt", method = { RequestMethod.GET, RequestMethod.POST })

	public ModelAndView listtxt(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		int ty = 2;
		List<FileDto> files = fileService.getFile(1, ty);
		// logger.info("���壺"+files.get(0).getFileName());
		modelAndView.addObject("files", files);
		modelAndView.setViewName("personalSpace2");
		return modelAndView;
	}

	@RequestMapping(value = "/listvideo", method = { RequestMethod.GET, RequestMethod.POST })

	public ModelAndView listvideo(HttpServletRequest request, HttpServletResponse response) {
//		logger.info("���壺");
		ModelAndView modelAndView = new ModelAndView();
		int ty = 3;
		List<FileDto> files = fileService.getFile(1, ty);
		//logger.info("���壺"+files.get(0).getFileName());
		modelAndView.addObject("files", files);
		modelAndView.setViewName("personalSpace3");
		return modelAndView;
	}

	@RequestMapping(value = "/listmusic", method = { RequestMethod.GET, RequestMethod.POST })

	public ModelAndView listmusic(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		int ty = 4;
		List<FileDto> files = fileService.getFile(1, ty);
		// logger.info("���壺"+files.get(0).getFileName());
		modelAndView.addObject("files", files);
		modelAndView.setViewName("personalSpace4");
		return modelAndView;
	}

	@RequestMapping(value = "/listother", method = { RequestMethod.GET, RequestMethod.POST })

	public ModelAndView listother(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		int ty = 5;
		List<FileDto> files = fileService.getFile(1, ty);
		// logger.info("���壺"+files.get(0).getFileName());
		modelAndView.addObject("files", files);
		modelAndView.setViewName("personalSpace5");
		return modelAndView;
	}

	
	
	/**
	 * �����Դ
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
	        /**����ͼƬ�����Ŀ¼**/    
	        String logoPathDir = "/files/"+userdto.getUserName(); 
	        /**�õ�ͼƬ����Ŀ¼����ʵ·��**/    
	        String logoRealPathDir = request.getSession().getServletContext().getRealPath(logoPathDir);   
	        
	        /**������ʵ·������Ŀ¼**/    
	        File logoSaveFile = new File(logoRealPathDir);     
	        if(!logoSaveFile.exists())     
	            logoSaveFile.mkdirs();           
	        /**ҳ��ؼ����ļ���**/    
	        MultipartFile multipartFile = multipartRequest.getFile("file");      
	        /**��ȡ�ļ��ĺ�׺**/    
	        String suffix = multipartFile.getOriginalFilename().substring  
	                        (multipartFile.getOriginalFilename().lastIndexOf("."));   
	        
//	        /**ʹ��UUID�����ļ�����**/    
//	        String logImageName = UUID.randomUUID().toString()+ suffix;//�����ļ�����     
	        String logImageName = multipartFile.getOriginalFilename(); 
	        //logger.info("���壺"+suffix);
	        /**ƴ���������ļ�����·�����ļ�**/    
	        String fileName = logoRealPathDir + File.separator   + logImageName;                
	        File file = new File(fileName);          
	       logger.info("���壺"+multipartFile.getSize());
	        try {     
	            multipartFile.transferTo(file);     
	        } catch (IllegalStateException e) {     
	            e.printStackTrace();     
	        } catch (IOException e) {            
	            e.printStackTrace();     
	        } 
	        /** ��ӵ�filedto**/
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
	 * ��ת����Դ�༭ҳ��
	 */
	 @RequestMapping("/sharePage")
	 public void editPage(HttpServletRequest request, String id) {
//	 request.setAttribute("resourceTypeList",resourceTypeService.getResourceTypeList());
//	 Resource r = resourceService.get(id);
//	 request.setAttribute("resource", r);
//	 return "/admin/resourceEdit";
	 }
	
	/**
	 * �༭��Դ
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
	// j.setMsg("�༭�ɹ���");
	// return j;
	// }

	/**
	 * �����Դ�б�
	 * 
	 * ͨ���û�ID�жϣ����ܿ�������Դ
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
	 * ɾ����Դ
	 * 
	 * @param id
	 * @return
	 */
	// @RequestMapping("/delete")
	// @ResponseBody
	// public Json delete(String id) {
	// Json j = new Json();
	// resourceService.delete(id);
	// j.setMsg("ɾ���ɹ���");
	// j.setSuccess(true);
	// return j;
	// }

}

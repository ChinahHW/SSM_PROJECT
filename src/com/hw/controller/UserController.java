package com.hw.controller;

import java.io.File;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.hw.pojo.User;
import com.hw.service.IUserService;



@Controller
@SessionAttributes(names = {"userid"})
public class UserController {

	@Autowired
	private IUserService userService;
    
    @RequestMapping("/login")
    public ModelAndView login(String name,String password,HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView();
    	User user = userService.login(name, password);
    	String code=request.getParameter("code");
    	HttpSession session = request.getSession();
    	if (!(code.equalsIgnoreCase(session.getAttribute("code").toString()))) {  //忽略验证码大小写  
    	        mv.setViewName("fail");
    	        return mv;  
    	}
    	if(user!=null) {
    		if(user.getIsAdmin().equals("true")) {
    			Integer userid = user.getId();
            	mv.addObject("userid", userid);
            	mv.setViewName("adminMain");
            	return mv;
    		}
    		Integer userid = user.getId();
        	mv.addObject("userid", userid);
        	mv.setViewName("index");
        	
    	}else {
    		mv.setViewName("fail");
    	}
    	return mv;
    }
    
    @RequestMapping("/getLogin")
    public String getLogin(@SessionAttribute(value="userid",required=false) Integer userid) {
    	if(userid==null) {
    		return "login";
    	}
    	return "userMain";
    }
    
    
    
    @RequestMapping("/userMain")
    public String userMain() {
    	return "userMain";
    }
    
    @RequestMapping("/getUserInfo")
    @ResponseBody
    public User getUserInfo(@SessionAttribute(value="userid",required=false) Integer userid) {
    	if(userid==null) {
    		return null;
    	}
    	return userService.getUserById(userid);
    }
    
    
    @RequestMapping("/getPhoto")
    @ResponseBody
    public User getPhoto(String name) {
    	return userService.getUserByName(name);
    }
    
    @RequestMapping("/registe")
    @ResponseBody
    public String registe(String name,Integer age,String password) {
    	User user = new User();
    	user.setAge(age);
    	user.setName(name);
    	user.setPassword(password);
    	return userService.addUser(user)>0?"success":"fail";
    }
    
    @RequestMapping("/changeInfo")
    public String changeInfo(String username,String oldPassword,String newPassword,Integer age,String sex,@SessionAttribute(value="userid",required=false) Integer userid) {
    	
    	if(oldPassword.equals(newPassword)) {
    		User user = userService.getUserById(userid);
    		user.setAge(age);
    		user.setName(username);
    		user.setPassword(newPassword);
    		user.setSex(sex);
    		user.setId(userid);
    		userService.updateUser(user);
    		return "userMain";
    	}
    	return "fail";
    }
    @RequestMapping("/upload")
    public String upload() {
    	return "upload";
    }
    
    @RequestMapping("/doUpload")
    public ModelAndView doUpload(MultipartFile file,@SessionAttribute(value="userid",required=false) Integer userid) {
    	ModelAndView mv = new ModelAndView();
    	mv.setView(new MappingJackson2JsonView());
    	String fileName = file.getOriginalFilename();
    	file.getContentType();
    	//目标文件
    	File dest = new File("F:\\eclipse-workspace\\SSM_Movie\\WebContent\\app\\style\\images\\"+fileName);
    	User user = userService.getUserById(userid);
		user.setPicture(fileName);
		userService.updateUser(user);
    	try {
			file.transferTo(dest);
			mv.addObject("success", true);
			mv.addObject("msg", "上传文件成功");
			mv.setViewName("upload");
		} catch (Exception e) {
			// TODO: handle exception
			mv.addObject("success", false);
			mv.addObject("msg", "上传文件失败");
			e.printStackTrace();
		}
    	return mv;
    }
    
    
    @RequestMapping("/adminMain")
    public String adminMain(@SessionAttribute(value="userid",required=false) Integer userid) {
    	if(userid==null) {
    		return "index";
    	}
    	User user = userService.getUserById(userid);
    	if(user.getIsAdmin().equals("true")) {
    		return "adminMain";
    	}else {
    		return "index";
    	}
    	
    }
    @RequestMapping("/welcome")
    public String welcome() {
    	return "welcome";
    }
    @RequestMapping("/article-list")
    public String article() {
    	return "article-list";
    }
    @RequestMapping("/feedback-list")
    public String feedback() {
    	return "feedback-list";
    }
    @RequestMapping("/member-changeInfo")
    public String changeInfo(@SessionAttribute(value="userid",required=false) Integer userid,Model model) {
    	User user = userService.getUserById(userid);
    	model.addAttribute("user", user);
    	return "member-changeInfo";
    }
    @RequestMapping("/member-changePassword")
    public String changePassword(@SessionAttribute(value="userid",required=false) Integer userid,Model model) {
    	User user = userService.getUserById(userid);
    	model.addAttribute("user", user);
    	return "member-changePassword";
    }
    
    @RequestMapping("/doChangeInfo")
    public ModelAndView doChangeInfo(MultipartFile file,@SessionAttribute(value="userid",required=false) Integer userid,String name,String sex,String age) {
    	ModelAndView mv = new ModelAndView();
    	mv.setView(new MappingJackson2JsonView());
    	String fileName = file.getOriginalFilename();
    	file.getContentType();
    	//目标文件
    	File dest = new File("F:\\eclipse-workspace\\SSM_Movie\\WebContent\\app\\style\\images\\"+fileName);
    	try {
			file.transferTo(dest);
			mv.addObject("success", true);
			mv.addObject("msg", "修改成功");
			User user = userService.getUserById(userid);
			user.setPicture(fileName);
			user.setAge(Integer.parseInt(age));
			user.setName(name);
			user.setSex(sex);
			userService.updateUser(user);
		} catch (Exception e) {
			// TODO: handle exception
			mv.addObject("success", false);
			mv.addObject("msg", "修改失败");
			e.printStackTrace();
		}
    	return mv;
    }
    
    @RequestMapping("/doChangePassword")
    public ModelAndView doChangePassword(@SessionAttribute(value="userid",required=false) Integer userid,String oldPassword,String newPassword,String snewPassword) {
    	ModelAndView mv = new ModelAndView();
    	User user = userService.getUserById(userid);
    	if(user.getPassword().equals(oldPassword) && newPassword.equals(snewPassword)) {
    		user.setPassword(snewPassword);
    		userService.updateUser(user);
    		mv.addObject("msg", "更改密码成功");
    		mv.setViewName("success");
    	}else {
    		mv.addObject("msg", "更改密码失败");
    		mv.setViewName("fail");
    	}
    	return mv;
    }
    
    
    @RequestMapping("/logOut")
    public String logOut(HttpServletRequest request,SessionStatus sessionStatus) {
    	HttpSession session = request.getSession();
    	session.invalidate();
    	sessionStatus.setComplete();//用SessionStatus来清除@SessionAttribute中的session
    	return "index";
    }
    
}

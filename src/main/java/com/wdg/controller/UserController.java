package com.wdg.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wdg.entity.User;
import com.wdg.service.UserService;


@Controller

public class UserController {

	@Autowired
	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@RequestMapping("/login")
	public String login(String userName,String password,HttpServletRequest request){
		String a="asd";
		if(userName.equals(a)==false){
			request.getSession().setAttribute("msg", "’À∫≈ªÚ√‹¬Î¥ÌŒÛ");
			return "login";
		}
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("username", userName);
		map.put("password", password);
		User u=userService.login(map);
		if(u != null) {
			return "main";
		}
		return "false";
	}
	@RequestMapping("/findAllUsers")
	public String findAllUsers(Model model) {

		List<User> users = userService.findAllUsers();
		
		model.addAttribute("users", users);
		
		return "showAllUsers";
		
	}
	@RequestMapping("/register")
	public String register(String userName,String password,String name,HttpServletRequest request){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("username", userName);
		map.put("password", password);
		map.put("name", name);
		int a=userService.insert(map);
		if(a== 1) {
			return "a_result";
		}
		return "false";
	}
	@RequestMapping("/a_login")
	public String a_login(String userName,String password,HttpServletRequest request){
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("username", userName);
		map.put("password", password);
		User u=userService.login(map);
		request.getSession().setAttribute("currentUser", u);
		if(u != null) {
			return "index";
		}
		return "false";
	}
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request){
		request.getSession().removeAttribute("currentUser");
		return "index";
	}
}

package com.jt.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jt.entity.Application;
import com.jt.entity.User;
import com.jt.service.ApplicationService;
import com.jt.service.UserService;

@Controller
public class MainController {

	@Autowired
	UserService uservice;
	
	@Autowired
	ApplicationService appservice;
	
	@RequestMapping(value = {"/", "/index.htm"}, method = RequestMethod.GET)
	public ModelAndView loginPage(HttpServletRequest request) {
		return new ModelAndView("index","credentials",new User());
	}
	
	@RequestMapping(value ="/verifyuser.htm", method = RequestMethod.POST)
	public ModelAndView verifyUser(@ModelAttribute User user, HttpServletRequest request) throws JSONException {
		ModelAndView modelAndView;
		
		Object response = uservice.validateUser(user.getUname(), user.getPwd());
		
		if(response.getClass().equals(User.class)){
			HttpSession session = request.getSession();
			
			user = (User) response;
			session.setAttribute("loggedInUser", user);

			modelAndView = new ModelAndView("landing","appres",appservice.fetchAllApps(user)).addObject("userDetails", user);
		}else{
			modelAndView = new ModelAndView("index", "credentials", new User());
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/add_pos.htm", method = RequestMethod.GET)
	public ModelAndView newPositionPage(HttpServletRequest request) {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("loggedInUser");
		
		Map<String, Object> models = new HashMap<String, Object>();
		
		models.put("resumes", uservice.getAllResumes(u));
		models.put("positionDetails", new Application());
		models.put("userinfo", u);
		
		return new ModelAndView("addpos").addAllObjects(models);
	}
	
}

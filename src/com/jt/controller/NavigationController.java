package com.jt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jt.entity.Resume;
import com.jt.entity.User;
import com.jt.service.ApplicationService;
import com.jt.service.JobService;
import com.jt.service.UserService;

/*
	All the end points which are used to just nevigate between different pages are defined here just to make code maintainable.
*/

@Controller
public class NavigationController {

	@Autowired
	UserService uservice;
	
	@Autowired
	ApplicationService appservice;
	
	@Autowired
	JobService jservice;
	
	public static void setSession(HttpServletRequest request, User user){
		HttpSession session = request.getSession();
		session.setAttribute("loggedInUser", user);
	}
	
	public static Object checkSession(HttpServletRequest request){
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loggedInUser")==null){
			return false;
		}return session.getAttribute("loggedInUser");
	}
	
	@RequestMapping(value = {"/", "/index.htm"}, method = RequestMethod.GET)
	public ModelAndView loginPage(HttpServletRequest request) {
		return new ModelAndView("index","credentials",new User());
	}
	
	@RequestMapping(value = "/homePage.htm", method = RequestMethod.GET)
	public ModelAndView navigateToHome(HttpServletRequest request) {
		Object res = checkSession(request);
		if(res.getClass()!=User.class){
			return new ModelAndView("index","credentials",new User()).addObject("sessionMessage","Session Timeout, please login again!");
		}
		User u = (User) res;
		
		return new ModelAndView("landing","appres",appservice.fetchAllApps(u)).addObject("userDetails", u);
	}
	
	@RequestMapping(value = "/personalDetail.htm", method = RequestMethod.GET)
	public ModelAndView personalDetailPage(HttpServletRequest request) {
		Object res = checkSession(request);
		if(res.getClass()!=User.class){
			return new ModelAndView("index","credentials",new User()).addObject("sessionMessage","Session Timeout, please login again!");
		}
		User u = (User) res;
		return new ModelAndView("personalDetails","userInfo",u);
	}
	
	@RequestMapping(value = "/manageResume.htm", method = RequestMethod.GET)
	public ModelAndView manageResumePage(HttpServletRequest request) {
		Object res = checkSession(request);
		if(res.getClass()!=User.class){
			return new ModelAndView("index","credentials",new User()).addObject("sessionMessage","Session Timeout, please login again!");
		}
		User u = (User) res;
		
		return new ModelAndView("manageResume","resumes",uservice.getAllResumes(u)).addObject("newResume", new Resume());
	}

	@RequestMapping(value = "/signup.htm", method = RequestMethod.GET)
	public ModelAndView signUpPage(HttpServletRequest request) {
		return new ModelAndView("signup","newuser",new User());
	}
	
}
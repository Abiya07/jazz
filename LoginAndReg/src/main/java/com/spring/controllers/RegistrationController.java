package com.spring.controllers;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.beans.User;
import com.spring.service.UserService;

@Controller
public class RegistrationController 
{
	@Autowired
    public UserService userservice;
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public ModelAndView showRegister(HttpServletRequest request, HttpServletResponse response)
	{
	    ModelAndView mav = new ModelAndView("register");
	    mav.addObject("user", new User());
	    return mav;
	  }
	@RequestMapping(value = "/registerProcess", method = RequestMethod.POST)
	public ModelAndView addUser(HttpServletRequest request, HttpServletResponse response,
	@ModelAttribute("user") User user) 
	{
		ModelAndView mav = null;
		
		User email = userservice.emailCheck(user);

		if(null!=email){
		mav = new ModelAndView("register");
		mav.addObject("exists"," *Email already exists");
		}

		else {
			 userservice.register(user);
			 mav=new ModelAndView("welcome","firstname",user.getFirstname());
			 mav.addObject("exists","");

		}
		return mav;
}  
	

}
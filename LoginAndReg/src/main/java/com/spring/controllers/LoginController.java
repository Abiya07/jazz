package com.spring.controllers;


import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.beans.Login;
import com.spring.beans.User;
import com.spring.service.UserService;

class CustomException extends Exception{
	
	private static final long serialVersionUID = 1L;
	
	String s;

	CustomException(String ss){
		s=ss;
	}
	public String toString() {
		return"CustomException["+s+"]";
	}
}
@Controller
public class LoginController 
{
	@Autowired
	public UserService userService;

	@RequestMapping(value="/login",method=RequestMethod.GET)
	public ModelAndView showLogin(HttpServletRequest request,HttpServletResponse response) 
	{
		ModelAndView mav=new ModelAndView("login");
		mav.addObject("login", new Login());
		return mav;
	}
	@RequestMapping(value = "/loginProcess", method = RequestMethod.POST)
	//@ExceptionHandler({CustomException.class})
	public ModelAndView loginProcess(String ss,HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("login") Login login)throws CustomException, IOException
	{
		ModelAndView mav = null;
		User user = userService.validateUser(login);
		if(null!=user)
		{			

			mav = new ModelAndView("welcome");
			mav.addObject("firstname", user.getFirstname());
			FileWriter fw = new FileWriter("c:\\testWorkspace\\.metadata\\.lock.txt"); 				
			fw.write("welcome ");fw.write("LoginController ");fw.write("loginProcess ");

			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
			LocalDateTime now = LocalDateTime.now();  
			System.out.println(dtf.format(now));
			fw.write(dtf.format(now));
			fw.close();
		}
		else {

			try{

				mav = new ModelAndView("error");					
				System.out.println("Starting of try block");
				throw new CustomException("CustomException Error Occured");	

			}
			catch(CustomException exp){
				System.out.println("Catch CustomException") ;
				System.out.println(exp) ;
				FileWriter fw = new FileWriter("c:\\testWorkspace\\.metadata\\.lock.txt"); 
				fw.write("CustomException ");fw.write("LoginController ");fw.write("loginProcess ");
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
				LocalDateTime now = LocalDateTime.now();  
				System.out.println(dtf.format(now));
				fw.write(dtf.format(now));
				fw.close();
			}
		}

		return mav;

	}

	@RequestMapping(value="/welcome", method=RequestMethod.GET)
	public ModelAndView showFile(HttpServletRequest request, HttpServletResponse response)
	{
		ModelAndView mav = new ModelAndView("welcome");
		mav.addObject("user", new User());
		return mav;
	}


}



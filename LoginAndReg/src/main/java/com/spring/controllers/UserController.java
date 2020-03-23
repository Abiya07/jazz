package com.spring.controllers;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.beans.User;
import com.spring.service.UserService;
@Controller
public class UserController {
	@Autowired
    public UserService userservice;
	@RequestMapping(value="/viewpage",method=RequestMethod.GET)  
    public ModelAndView viewpage(){  
		ModelAndView model=new ModelAndView();
		
        List<User> list=userservice.getUsers(); 
        model.addObject("list",list);
       return model;
       
       }  
	@RequestMapping(value="/edit/{id}")    
    public String edit(@PathVariable int id, Model m){    
        User user=userservice.getuserById(id);    
        m.addAttribute("user",user);  
        return "edit";    
    }    
	@RequestMapping(value="/edit/{id}/editsave",method=RequestMethod.GET)    
    public ModelAndView editsave(@ModelAttribute("user") User user){    
        userservice.editsave(user);    
        return new ModelAndView( "redirect:/viewpage");    
    }    
	
	@RequestMapping(value="/delete/{id}",method=RequestMethod.GET)  
    public String delete(@PathVariable int id){  
		
		userservice.delete(id);
        return  "redirect:/viewpage";
	
	}
	
	@RequestMapping(value="/edit/{id}/sush",method=RequestMethod.GET)  
    public String back(){ 
	
        return  "redirect:/viewpage";
	}
}   




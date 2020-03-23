package com.spring.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;


import com.spring.beans.User;
import com.spring.service.UserService;


@RestController

public class UserRestController {
	@Autowired
	public UserService userservice;
	@GetMapping("/viewpage/jdata")
	public ResponseEntity<List<User>> getUsers()
	{
		List<User> list =userservice.getUsers();
		return ResponseEntity.ok().body(list);
		
	}
	
	@GetMapping(value="/viewpage/jdata/{id}")    
    public  ResponseEntity<?> edit(@PathVariable("id") long id){  
        User user  =userservice.getuserById(id);    
    
        if (user == null) {
            
            return new ResponseEntity<User>(HttpStatus.NOT_FOUND);
        }

        
        return new ResponseEntity<User>(user, HttpStatus.OK);
     
    }    
	

}

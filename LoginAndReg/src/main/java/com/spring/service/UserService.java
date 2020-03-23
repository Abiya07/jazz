package com.spring.service;

import java.util.List;

import com.spring.beans.Login;
import com.spring.beans.User;


public interface UserService 
{
	void register(User user);
    
	User validateUser(Login login);
	
	List<User> getUsers();
	
	int editsave(User user);
	
	int delete(int id);
	
	User getuserById(int id);
	
	User getuserById(long id);
	
	User nameCheck(User user);
	
	User emailCheck(User user);

	
	//List<User> page(int pageid,int total);
}

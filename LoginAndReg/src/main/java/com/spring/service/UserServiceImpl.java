package com.spring.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;


import com.spring.beans.Login;
import com.spring.beans.User;
import com.spring.dao.UserDAO;


public class UserServiceImpl implements UserService
{
	  @Autowired
	  public UserDAO userDao;

	  public void register(User user) 
	  {
	    userDao.register(user);
	  }

	  public User validateUser(Login login) 
	  {
	    return userDao.validateUser(login);
	  }

	
	public List<User> getUsers() {
		
		return userDao.getUsers();
	}

	@Override
	public int editsave(User user) {
	
		return userDao.editsave(user);
	}

	@Override
	public int delete(int id) {
		return userDao.delete(id);
	}

	@Override
	public User getuserById(int id) {
		
		return userDao.getuserById(id);
	}

	@Override
	public User getuserById(long id) {
		
		return userDao.getuserById(id);
	}

	@Override
	public User nameCheck(User user) {

		 return userDao.nameCheck(user);
	}

	@Override
	public User emailCheck(User user) {
		
		 return userDao.emailCheck(user);
	}

	/*@Override
	public List<User> page(int pageid, int total) {
		
		return userDao.page(pageid,total);
	}*/
	  
}
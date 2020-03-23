package com.spring.dao;

import java.util.List;

import com.spring.beans.Login;
import com.spring.beans.User;

public interface UserDAO 
{
void register(User user);

User validateUser(Login login);

List<User> getUsers();

int delete(int id);

int editsave(User user);

User getuserById(int id);

User getuserById(long id);

User nameCheck(User user);

User emailCheck(User user);

//List<User> page(int pageid, int total);
}

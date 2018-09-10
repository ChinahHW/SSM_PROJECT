package com.hw.service;

import java.util.List;

import com.hw.pojo.User;



public interface IUserService {
	int updateUser(User user);
	int deleteUserById(Integer id);
	User getUserById(Integer id);
	List<User>getUsers();
	User login(String username,String password);
	User getUserByName(String name);
	int addUser(User user);
}

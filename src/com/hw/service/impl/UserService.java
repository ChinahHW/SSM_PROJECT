package com.hw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hw.dao.UserMapper;
import com.hw.pojo.User;
import com.hw.service.IUserService;
@Service
public class UserService implements IUserService {
	@Autowired
	UserMapper userMapper;
	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateUser(user);
	}

	@Override
	public int deleteUserById(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.deleteUserById(id);
	}

	@Override
	public User getUserById(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.getUserById(id);
	}

	@Override
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		return userMapper.getUsers();
	}

	@Override
	public User login(String username, String password) {
		// TODO Auto-generated method stub
		return userMapper.login(username, password);
	}

	@Override
	public User getUserByName(String name) {
		// TODO Auto-generated method stub
		return userMapper.getUserByName(name);
	}

	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.addUser(user);
	}

}

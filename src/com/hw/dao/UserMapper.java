package com.hw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hw.pojo.User;



public interface UserMapper {
	// 查询所有用户信息
	List<User> getUsers();
	// 查询某个用户
	User getUserById(Integer id);
	// 删除用户
	int deleteUserById(Integer id);
	// 修改
	int updateUser(User user);
	int addUser(User user);
	User login(@Param("username")String username,@Param("password")String password);
	User getUserByName(String name);
}

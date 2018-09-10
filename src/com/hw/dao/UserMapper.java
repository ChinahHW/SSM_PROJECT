package com.hw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hw.pojo.User;



public interface UserMapper {
	// ��ѯ�����û���Ϣ
	List<User> getUsers();
	// ��ѯĳ���û�
	User getUserById(Integer id);
	// ɾ���û�
	int deleteUserById(Integer id);
	// �޸�
	int updateUser(User user);
	int addUser(User user);
	User login(@Param("username")String username,@Param("password")String password);
	User getUserByName(String name);
}

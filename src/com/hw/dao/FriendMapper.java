package com.hw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FriendMapper {
	List<Integer> findFriend(Integer userid);
	String findGroup(Integer friendid);
	int add(@Param("userid")Integer userid,@Param("friendid")Integer friendid);
	int remove(@Param("userid")Integer userid,@Param("friendid")Integer friendid);
}

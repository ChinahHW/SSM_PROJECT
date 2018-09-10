package com.hw.service;

import java.util.List;

public interface IFriendService {
	List<Integer> findFriend(Integer userid);
	String findGroup(Integer friendid);
	int add(Integer userid,Integer friendid);
	int remove(Integer userid,Integer friendid);
}

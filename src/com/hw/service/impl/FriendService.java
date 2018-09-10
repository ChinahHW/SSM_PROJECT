package com.hw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hw.dao.FriendMapper;
import com.hw.service.IFriendService;
@Service
public class FriendService implements IFriendService{
	@Autowired
	private FriendMapper friendMapper;
	@Override
	public List<Integer> findFriend(Integer userid) {
		// TODO Auto-generated method stub
		return friendMapper.findFriend(userid);
	}

	@Override
	public String findGroup(Integer friendid) {
		// TODO Auto-generated method stub
		return friendMapper.findGroup(friendid);
	}

	@Override
	public int add(Integer userid, Integer friendid) {
		// TODO Auto-generated method stub
		return friendMapper.add(userid, friendid);
	}

	@Override
	public int remove(Integer userid, Integer friendid) {
		// TODO Auto-generated method stub
		return friendMapper.remove(userid, friendid);
	}

}

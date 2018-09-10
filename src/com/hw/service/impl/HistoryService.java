package com.hw.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hw.dao.HistoryMapper;
import com.hw.dao.UserMapper;
import com.hw.pojo.History;
import com.hw.pojo.Movie;
import com.hw.pojo.User;
import com.hw.service.IHistoryService;
@Service
public class HistoryService implements IHistoryService {
	@Autowired
	private HistoryMapper historyMapper;
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int add(Integer userid, Integer movieid) {
		// TODO Auto-generated method stub
		if(historyMapper.removesame(movieid, userid)!=null) {
			return -1;
		}
		return historyMapper.add(userid, movieid);
	}

	@Override
	public List<User> getHistoryUser(Integer movieid) {
		List<Integer> userid = historyMapper.getUserId(movieid);
		List<User> users = new ArrayList<>();
		for (Integer id : userid) {
			User user = userMapper.getUserById(id);
			users.add(user);
		}
		return users;
	}

	@Override
	public History removesame(Integer movieid, Integer userid) {
		return historyMapper.removesame(movieid, userid);
	}

	@Override
	public List<Integer> getMovieId(Integer userid) {
		return historyMapper.getMovieId(userid);
	}

	@Override
	public Integer getUserIdByListMovieId(List<Integer> movieids) {
		if(movieids==null) {
			return null;
		}
		return historyMapper.getUserIdByListMovieId(movieids);
	}

	@Override
	public List<Integer> push(List<Integer> movieids, Integer userid) {
		// TODO Auto-generated method stub
		return historyMapper.push(movieids, userid);
	}

}

package com.hw.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hw.pojo.History;
import com.hw.pojo.Movie;
import com.hw.pojo.User;

public interface IHistoryService {
	int add(Integer userid,Integer movieid);
	List<User> getHistoryUser(Integer movieid);
	History removesame(Integer movieid,Integer userid);
	List<Integer> getMovieId(Integer userid);
	//อฦหอนฆฤÜ
	Integer getUserIdByListMovieId(List<Integer> movieids);
	List<Integer> push(@Param("movieids")List<Integer> movieids,@Param("userid")Integer userid);
}

package com.hw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hw.pojo.History;
import com.hw.pojo.Movie;

public interface HistoryMapper {
	int add(@Param("userid") Integer userid,@Param("movieid") Integer movieid);
	List<Integer> getUserId(Integer movieid);
	History removesame(@Param("movieid")Integer movieid,@Param("userid")Integer userid);
	List<Integer> getMovieId(Integer userid);
	//ÍÆËÍ¹¦ÄÜ
		Integer getUserIdByListMovieId(@Param("movieids") List<Integer> movieids);
		List<Integer> push(@Param("movieids")List<Integer> movieids,@Param("userid")Integer userid);
}

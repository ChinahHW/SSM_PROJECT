package com.hw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hw.pojo.Movie;

public interface MovieMapper {
	//获得所有电影信息
	List<Movie> getAll(RowBounds rowBounds);
	//模糊查询电影
	List<Movie> findMovie(@Param("clazz")String clazz,RowBounds rowBounds);
	//精准查询电影
	Movie getMovieById(int id);
	int findMovieNumber(@Param("clazz")String clazz);
	
	int addMovie(Movie movie);
	
	int changeInfo(Movie movie);
	
	int delMovie(int movieid);
}

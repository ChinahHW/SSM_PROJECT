package com.hw.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hw.pojo.Movie;

public interface IMovieService {
	List<Movie> getAll(RowBounds rowBounds);
	List<Movie> findMovie(String clazz,RowBounds rowBounds);
	Movie getMovieById(int id);
	int findMovieNumber(String clazz);
	int addMovie(Movie movie);
	
	int changeInfo(Movie movie);
	
	int delMovie(int movieid);
}

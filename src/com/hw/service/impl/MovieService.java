package com.hw.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hw.dao.MovieMapper;
import com.hw.pojo.Movie;
import com.hw.service.IMovieService;

@Service
public class MovieService implements IMovieService{
	@Autowired
	MovieMapper movieMapper;
	
	public List<Movie> getAll(RowBounds rowBounds) {
		return movieMapper.getAll(rowBounds);
	}

	public List<Movie> findMovie(String clazz,RowBounds rowBounds) {
		return movieMapper.findMovie(clazz,rowBounds);
	}

	public Movie getMovieById(int id) {
		return movieMapper.getMovieById(id);
	}

	@Override
	public int findMovieNumber(String clazz) {
		// TODO Auto-generated method stub
		return movieMapper.findMovieNumber(clazz);
	}

	
	@Override
	@Transactional(propagation=Propagation.REQUIRES_NEW)
	public int addMovie(Movie movie) {
		// TODO Auto-generated method stub
		return movieMapper.addMovie(movie);
	}

	@Override
	public int changeInfo(Movie movie) {
		// TODO Auto-generated method stub
		return movieMapper.changeInfo(movie);
	}

	@Override
	public int delMovie(int movieid) {
		// TODO Auto-generated method stub
		return movieMapper.delMovie(movieid);
	}

}

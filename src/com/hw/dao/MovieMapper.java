package com.hw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.hw.pojo.Movie;

public interface MovieMapper {
	//������е�Ӱ��Ϣ
	List<Movie> getAll(RowBounds rowBounds);
	//ģ����ѯ��Ӱ
	List<Movie> findMovie(@Param("clazz")String clazz,RowBounds rowBounds);
	//��׼��ѯ��Ӱ
	Movie getMovieById(int id);
	int findMovieNumber(@Param("clazz")String clazz);
	
	int addMovie(Movie movie);
	
	int changeInfo(Movie movie);
	
	int delMovie(int movieid);
}

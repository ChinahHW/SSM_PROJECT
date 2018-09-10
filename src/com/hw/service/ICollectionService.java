package com.hw.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.hw.pojo.Collection;

public interface ICollectionService {
	int insertCollection(Integer movieId,Integer userId);
	Collection removesame(Integer movieId,Integer userId);
	List<Integer> getMovieId(Integer userid,RowBounds rowBounds);
}

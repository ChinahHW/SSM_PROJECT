package com.hw.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hw.dao.CollectionMapper;
import com.hw.pojo.Collection;
import com.hw.service.ICollectionService;
@Service
public class CollectionService implements ICollectionService {
	@Autowired
	private CollectionMapper collectionMapper;
	
	@Override
	public int insertCollection(Integer movieId, Integer userId) {
		// TODO Auto-generated method stub
		if(collectionMapper.removesame(movieId, userId)!=null) {
			return -1;
		}
		
		return collectionMapper.insertCollection(movieId, userId);
	}

	@Override
	public Collection removesame(Integer movieId, Integer userId) {
		// TODO Auto-generated method stub
		return collectionMapper.removesame(movieId, userId);
	}

	@Override
	public List<Integer> getMovieId(Integer userid,RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return collectionMapper.getMovieId(userid,rowBounds);
	}

}

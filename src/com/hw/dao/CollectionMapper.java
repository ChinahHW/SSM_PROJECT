package com.hw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.hw.pojo.Collection;

public interface CollectionMapper {
	//收藏电影
	int insertCollection(@Param("movieid")Integer movieId,@Param("userid")Integer userId);
	//查重
	Collection removesame(@Param("movieid")Integer movieId,@Param("userid")Integer userId);
	//根据用户id查询收藏的电影信息
	List<Integer> getMovieId(Integer userid,RowBounds rowBounds);
}

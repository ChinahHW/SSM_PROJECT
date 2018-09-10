package com.hw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.hw.pojo.Collection;

public interface CollectionMapper {
	//�ղص�Ӱ
	int insertCollection(@Param("movieid")Integer movieId,@Param("userid")Integer userId);
	//����
	Collection removesame(@Param("movieid")Integer movieId,@Param("userid")Integer userId);
	//�����û�id��ѯ�ղصĵ�Ӱ��Ϣ
	List<Integer> getMovieId(Integer userid,RowBounds rowBounds);
}

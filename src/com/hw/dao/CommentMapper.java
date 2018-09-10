package com.hw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.hw.pojo.Comment;

public interface CommentMapper {
	List<Comment> getAll();
	List<Comment> getByUserId(int userid,RowBounds rowBounds);
	List<Comment> getByMovieId(int movieid,RowBounds rowBounds);
	//ͨ����Ӱid��ѯ��������ߵ�����
	List<Comment> getMostPopular(int movieid,RowBounds rowBounds);
	//ͨ���û�id��ѯ��������ߵ�����
	List<Comment> getMostPopularByUserId(int userid,RowBounds rowBounds);
	int add(Comment comment);
	int del(@Param("userid") int userid,@Param("movieid") int movieid);
	int update(@Param("content")String content,@Param("userid")int userid,@Param("movieid")int movieid);
	int agree(int commentid);
	int disagree(int commentid);
} 

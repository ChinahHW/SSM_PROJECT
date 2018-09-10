package com.hw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.hw.pojo.Comment;

public interface CommentMapper {
	List<Comment> getAll();
	List<Comment> getByUserId(int userid,RowBounds rowBounds);
	List<Comment> getByMovieId(int movieid,RowBounds rowBounds);
	//通过电影id查询点赞数最高的评论
	List<Comment> getMostPopular(int movieid,RowBounds rowBounds);
	//通过用户id查询点赞数最高的评论
	List<Comment> getMostPopularByUserId(int userid,RowBounds rowBounds);
	int add(Comment comment);
	int del(@Param("userid") int userid,@Param("movieid") int movieid);
	int update(@Param("content")String content,@Param("userid")int userid,@Param("movieid")int movieid);
	int agree(int commentid);
	int disagree(int commentid);
} 

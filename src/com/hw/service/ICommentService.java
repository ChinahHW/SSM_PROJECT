package com.hw.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.hw.pojo.Comment;

public interface ICommentService {
	List<Comment> getAll();
	List<Comment> getByUserId(int userid,RowBounds rowBounds);
	List<Comment> getByMovieId(int movieid,RowBounds rowBounds);
	//通过电影id查询点赞数最高的评论
	List<Comment> getMostPopular(int movieid,RowBounds rowBounds);
	//通过用户id查询点赞数最高的评论
	List<Comment> getMostPopularByUserId(int userid,RowBounds rowBounds);
	int add(Comment comment);
	int del(int userid,int movieid);
	int update(String content,int userid,int movieid);
	int agree(int commentid);
	int disagree(int commentid);
}

package com.hw.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hw.dao.CommentMapper;
import com.hw.pojo.Comment;
import com.hw.service.ICommentService;
import com.sun.rowset.internal.Row;
@Service
public class CommentService implements ICommentService{
	@Autowired
	private CommentMapper commentMapper;
	@Override
	public List<Comment> getAll() {
		// TODO Auto-generated method stub
		return commentMapper.getAll();
	}

	@Override
	public List<Comment> getByUserId(int userid,RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return commentMapper.getByUserId(userid,rowBounds);
	}

	@Override
	public List<Comment> getByMovieId(int movieid,RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return commentMapper.getByMovieId(movieid,rowBounds);
	}

	@Override
	public List<Comment> getMostPopular(int movieid,RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return commentMapper.getMostPopular(movieid,rowBounds);
	}

	@Override
	public int add(Comment comment) {
		// TODO Auto-generated method stub
		return commentMapper.add(comment);
	}

	@Override
	public int del(int userid, int movieid) {
		// TODO Auto-generated method stub
		return commentMapper.del(userid, movieid);
	}

	@Override
	public int update(String content, int userid, int movieid) {
		// TODO Auto-generated method stub
		return commentMapper.update(content, userid, movieid);
	}

	@Override
	public int agree(int commentid) {
		// TODO Auto-generated method stub
		return commentMapper.agree(commentid);
	}

	@Override
	public int disagree(int commentid) {
		// TODO Auto-generated method stub
		return commentMapper.disagree(commentid);
	}

	@Override
	public List<Comment> getMostPopularByUserId(int userid, RowBounds rowBounds) {
		// TODO Auto-generated method stub
		return commentMapper.getMostPopularByUserId(userid, rowBounds);
	}

}

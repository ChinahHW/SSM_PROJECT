package com.hw.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hw.pojo.Comment;
import com.hw.pojo.User;
import com.hw.service.ICommentService;
import com.hw.service.IUserService;

@Controller
public class CommentController {
	@Autowired
	private ICommentService commentService;
	@Autowired
	private IUserService userService;
	
	private Map<Integer, List<Integer>> agreeHistory = new HashMap<>();
	
	@RequestMapping("/getComment")
	@ResponseBody
	public Map<String, List> getComment(Integer movieid){
		RowBounds rowBounds = new RowBounds(0,5);
		List<Comment> comments = commentService.getByMovieId(movieid,rowBounds);
		List<User> users = new ArrayList<>();
		Map<String, List> map = new HashMap<>();
		for (Comment comment : comments) {
			User user = userService.getUserById(comment.getUserid());
			users.add(user);
		}
		map.put("comments", comments);
		map.put("users", users);
		return map;
	}
	
	@RequestMapping("/getBest")
	@ResponseBody
	public Map<String,Object> getBest(Integer movieid,Integer limit){
		Map<String, Object> map = new HashMap<>();
		RowBounds rowBounds = new RowBounds(0,limit);
		List<Comment> comment = commentService.getMostPopular(movieid,rowBounds);
		List<User> users = new ArrayList<>();
		for (Comment comment2 : comment) {
			User user = userService.getUserById(comment2.getUserid());
			users.add(user);
		}
		map.put("comment", comment);
		map.put("users", users);
		return map;
	}
	
	@RequestMapping("/getBest2")
	@ResponseBody
	public Map<String,Object> getBest2(Integer movieid,Integer limit){
		Map<String, Object> map = new HashMap<>();
		RowBounds rowBounds = new RowBounds(1,limit);
		List<Comment> comment = commentService.getMostPopular(movieid,rowBounds);
		List<User> users = new ArrayList<>();
		for (Comment comment2 : comment) {
			User user = userService.getUserById(comment2.getUserid());
			users.add(user);
		}
		map.put("comment", comment);
		map.put("users", users);
		return map;
	}
	
	
	
	@RequestMapping("/getInfo")
	@ResponseBody
	public List<User> getInfo(Integer userid,@SessionAttribute(value="userid",required=false) Integer suserId) {
		if(suserId==null) {
			return null;
		}
		User ruser = userService.getUserById(userid);
		User suser = userService.getUserById(suserId);
		List<User> users = new ArrayList<>();
		users.add(suser);
		users.add(ruser);
		return users;
	}
	
	
	@RequestMapping("/sendMessage")
	@ResponseBody
	public String sendMessage(String EnterName,String Message,Integer movieId,@SessionAttribute(value="userid",required=false) Integer suserId) {
		Comment comment = new Comment();
		comment.setContent(EnterName+" : "+Message);
		comment.setMovieid(movieId);
		comment.setUserid(suserId);
		return commentService.add(comment)>0?"success":"fail";
	}
	
	
	@RequestMapping("/agree")
	@ResponseBody
	public String agree(String commentid,@SessionAttribute(value="userid",required=false) Integer userId) {
		if(userId==null) {
			return null;
		}
		int commentId = Integer.parseInt(commentid.replaceFirst("agree", ""));
		if(agreeHistory.containsKey(commentId)) {
			if(agreeHistory.get(commentId).contains(userId)) {
				agreeHistory.get(commentId).remove(userId);
				return commentService.disagree(commentId)>0?"del success":"del fail";
			}
			agreeHistory.get(commentId).add(userId);
		}else {
			List<Integer> userids = new ArrayList<>();
			userids.add(userId);
			agreeHistory.put(commentId,userids);
		}
		return commentService.agree(commentId)>0?"success":"fail";
	}
	
	@RequestMapping("getBestByUserId")
	@ResponseBody
	public Map<String,Object> getBestByUserId(@SessionAttribute(value="userid",required=false) Integer userId){
		if(userId==null) {
			return null;
		}
		RowBounds rowBounds = new RowBounds(0,5);
		List<Comment> comments = commentService.getMostPopularByUserId(userId, rowBounds);
		List<Comment> allcomments = commentService.getByUserId(userId, rowBounds);
		Map<String,Object> map = new HashMap<>();
		map.put("comments", comments);
		map.put("allcomments", allcomments);
		return map;
	}
	
}

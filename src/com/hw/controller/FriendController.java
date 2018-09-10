package com.hw.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hw.pojo.Comment;
import com.hw.pojo.Movie;
import com.hw.pojo.User;
import com.hw.service.ICollectionService;
import com.hw.service.ICommentService;
import com.hw.service.IFriendService;
import com.hw.service.IMovieService;
import com.hw.service.IUserService;
import com.hw.service.impl.UserService;

@Controller
public class FriendController {
	@Autowired
	private IFriendService friendService;
	@Autowired
	private IUserService userService;
	@Autowired
	private ICommentService commentService;
	@Autowired
	private ICollectionService collectionService;
	@Autowired
	private IMovieService movieService;
	@RequestMapping("/getFriend")
	@ResponseBody
	public List<User> getFriend(@SessionAttribute(value="userid",required=false) Integer userid){
		List<Integer> friendsid = friendService.findFriend(userid);
		List<User> friends = new ArrayList<>();
		for (Integer integer : friendsid) {
			User user = userService.getUserById(integer);
			friends.add(user);
		}
		return friends;
	}
	
	@RequestMapping("/friend")
    public String getFriend() {
    	return "friend";
    }
	
	@RequestMapping("/getFriendInfo")
	@ResponseBody
	public Map<String, Object> getFriendInfo(Integer friendid,@SessionAttribute(value="userid",required=false) Integer userid){
		List<Integer> friendsid = friendService.findFriend(userid);
		
		User user = userService.getUserById(friendid);
		
		RowBounds rowBounds = new RowBounds(0,5);
		List<Comment> comments = commentService.getByUserId(friendid, rowBounds);
		Map<String,Object> map = new HashMap<>();
		rowBounds = new RowBounds(0,3);
		List<Integer> moviesId = collectionService.getMovieId(friendid, rowBounds);
		List<Movie> movies = new ArrayList<>();
		for (Integer mid : moviesId) {
			Movie movie = movieService.getMovieById(mid);
			movies.add(movie);
		}
		map.put("info", user);
		map.put("comments", comments);
		map.put("movies", movies);
		if(friendsid.contains(friendid)) {
			map.put("isFriend", "取消关注");
		}else {
			map.put("isFriend", "关注");
		}
		return map;
	}
	
	
	@RequestMapping("/addFriend")
	@ResponseBody
	public String addFriend(Integer friendid,@SessionAttribute(value="userid",required=false) Integer userid){
		if(userid==null) {
			return "go to log";
		}
		List<Integer> friendsid = friendService.findFriend(userid);
		if(friendsid.contains(friendid)) {
			return friendService.remove(userid, friendid)>0?"delete success":"delete fail";
		}
		return friendService.add(userid, friendid)>0?"add success":"add fail";
	}
	
}

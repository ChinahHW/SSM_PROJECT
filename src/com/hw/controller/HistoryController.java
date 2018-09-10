package com.hw.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hw.pojo.Movie;
import com.hw.pojo.User;
import com.hw.service.impl.HistoryService;
import com.hw.service.impl.MovieService;

@Controller
public class HistoryController {
	@Autowired
	private HistoryService historyService;
	@Autowired
	private MovieService movieService;
	@RequestMapping("/video")
    public String video(String url,Integer movieid,@SessionAttribute(value="userid",required=false) Integer userid,Model model) {
    	model.addAttribute("url", url);
    	int i = 0;
    	if(userid!=null) {
    		i = historyService.add(userid,movieid);
		}
    	return "video";
    }
	
	@RequestMapping("/getHistory")
	@ResponseBody
	public List<User> getHistory(Integer movieid){
		return historyService.getHistoryUser(movieid);
	}
	
	
	@RequestMapping("/getLike")
	@ResponseBody
	public List<Movie> getLike(@SessionAttribute(value="userid",required=false) Integer userid){
		List<Movie> movies = new ArrayList<>();
		Movie movie = movieService.getMovieById(1);
		if(userid==null) {
			movies.add(movie);
			return movies;
		}
		List<Integer> movieids = historyService.getMovieId(userid);
		if(movieids==null) {
			movies.add(movie);
			return movies;
		}
		Integer puserid = historyService.getUserIdByListMovieId(movieids);
		List<Integer> pmovieids = historyService.push(movieids, puserid);
		if(pmovieids.size()==0) {
			movies.add(movie);
		}
		for (Integer integer : pmovieids) {
			movie = movieService.getMovieById(integer);
			movies.add(movie);
		}
		return movies;
	}
	
}

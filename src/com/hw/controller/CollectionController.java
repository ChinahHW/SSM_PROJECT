package com.hw.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.hw.pojo.Movie;
import com.hw.service.ICollectionService;
import com.hw.service.IMovieService;
import com.hw.service.impl.MovieService;
@Controller
public class CollectionController {
	@Autowired
	private ICollectionService collectionService;
	@Autowired
	private IMovieService movieService;
	
	@RequestMapping("/collect")
    @ResponseBody
    public String collect(Integer movieId,@SessionAttribute(value="userid",required=false) Integer userId) {
		
		if(userId==null) {
			return "go to login";
		}
    	int i = collectionService.insertCollection(movieId, userId);
    	if(i==-1) {
    		return "aleardy exit";
    	}
    	return i>0?"success":"fail";
    }
	
	@RequestMapping("/getCollctionByUserId")
    @ResponseBody
    public List<Movie> getCollctionByUserId(@SessionAttribute(value="userid",required=false) Integer userId) {
		RowBounds rowBounds = new RowBounds(0,3);
		List<Integer> movieid = collectionService.getMovieId(userId,rowBounds);
		List<Movie> movies = new ArrayList<>();
		for (Integer mid : movieid) {
			Movie movie = movieService.getMovieById(mid);
			movies.add(movie);
		}
    	return movies;
    }
	
}

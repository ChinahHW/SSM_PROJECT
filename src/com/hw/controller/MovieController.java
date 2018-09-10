package com.hw.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.hw.pojo.Movie;
import com.hw.pojo.User;
import com.hw.service.IMovieService;

@Controller
public class MovieController {
	@Autowired
	private IMovieService movieService;
	
	@Autowired
	PlatformTransactionManager transactinManager;
	@RequestMapping("/detail")
    public String detail(Integer id,Model model) {
		Movie movie = movieService.getMovieById(id);
		model.addAttribute("movie", movie);
    	return "detail";
    }
	
	@RequestMapping("/index")
    public String logIndex() {
    	return "index";
    }
	
	
	@RequestMapping("/getMovie")
	@ResponseBody
    public List getMovie(@RequestParam(required=false) Integer p,Model model) {
		if(p == null) {
    		p = 1;
    	}
		RowBounds rowBounds = new RowBounds((p-1)*7, 7);
		List<Movie> movies = movieService.getAll(rowBounds);
    	return movies;
    }
	
	
    /**
     * 如果是启动项目，则转发到list请求
     * 如果是项目，默认到首页的请求
     * @return
     */
    @RequestMapping("/")
    public String index(){
     return "forward:/index";
    }
    
    
    
    
    @RequestMapping("/review")
    public String review(@RequestParam(required=false) Integer p,Model model) {
    	if(p == null) {
    		p = 1;
    	}
    	int total = movieService.findMovieNumber(null);
    	List<Integer> page = new ArrayList<>();
    	if(total%5==0) {
    		for(Integer i=1;i<=total/5;i++) {
    			page.add(i);
    		}
    	}else {
    		for(Integer i=1;i<=total/5+1;i++) {
    			page.add(i);
    		}
    	}
    	model.addAttribute("page", page);
    	RowBounds rowBounds = new RowBounds((p-1)*5, 5);
    	List<Movie> movies = movieService.getAll(rowBounds);
    	model.addAttribute("movies", movies);
    	return "review";
    }
    
    @RequestMapping("/findMovie")
    public String findMovie(String condition,@RequestParam(required=false) Integer p,Model model) {
    	if(p == null) {
    		p = 1;
    	}
    	int total = movieService.findMovieNumber(condition);
    	List<Integer> page = new ArrayList<>();
    	if(total%5==0) {
    		for(Integer i=1;i<=total/5;i++) {
    			page.add(i);
    		}
    	}else {
    		for(Integer i=1;i<=total/5+1;i++) {
    			page.add(i);
    		}
    	}
    	model.addAttribute("page", page);
    	model.addAttribute("condition", condition);
    	RowBounds rowBounds = new RowBounds((p-1)*5, 5);
    	List<Movie> movies = movieService.findMovie(condition,rowBounds);
    	model.addAttribute("movies", movies);
    	return "findMovie";
    }
    
    
    @RequestMapping("/movie-list")
    public String getMovieInfo(@RequestParam(required=false) Integer p,Model model) {
    	if(p == null) {
    		p = 1;
    	}
    	int total = movieService.findMovieNumber(null);
    	List<Integer> page = new ArrayList<>();
    	if(total%5==0) {
    		for(Integer i=1;i<=total/5;i++) {
    			page.add(i);
    		}
    	}else {
    		for(Integer i=1;i<=total/5+1;i++) {
    			page.add(i);
    		}
    	}
    	model.addAttribute("page", page);
    	RowBounds rowBounds = new RowBounds((p-1)*5, 5);
    	List<Movie> movies = movieService.getAll(rowBounds);
    	model.addAttribute("movies", movies);
    	model.addAttribute("total", total);
    	return "movie-list";
    }
    
    
    @RequestMapping("/uploadMoviePicture")
    public ModelAndView uploadMoviePicture(MultipartFile file,String name,String content,String clazz,String url) {
    	ModelAndView mv = new ModelAndView();
    	mv.setView(new MappingJackson2JsonView());
    	String fileName = file.getOriginalFilename();
    	file.getContentType();
    	//目标文件
    	File dest = new File("F:\\eclipse-workspace\\SSM_Movie\\WebContent\\app\\style\\images\\"+fileName);
    	try {
			file.transferTo(dest);
			mv.addObject("success", true);
			mv.addObject("msg", "上传文件成功");
			Movie movie = new Movie();
	    	movie.setContent(content);
	    	movie.setClazz(clazz);
	    	movie.setName(name);
	    	movie.setPicture(fileName);
	    	movie.setUrl(url);
	    	movieService.addMovie(movie);
		} catch (Exception e) {
			// TODO: handle exception
			mv.addObject("success", false);
			mv.addObject("msg", "上传文件失败");
			e.printStackTrace();
		}
    	return mv;
    }
    
    @RequestMapping("/movie-add")
    public String pictureAdd() {
    	return "movie-add";
    }
    
    @RequestMapping("/changeMovie")
    public String changeInfo(Integer movieid,Model model) {
    	Movie movie = movieService.getMovieById(movieid);
    	model.addAttribute("movie", movie);
    	return "movieChange";
    }
    
    @RequestMapping("/doChangeMovie")
    public ModelAndView doChangeMovie(MultipartFile file,String name,String content,String clazz,String url,Integer movieid) {
    	ModelAndView mv = new ModelAndView();
    	mv.setView(new MappingJackson2JsonView());
    	String fileName = file.getOriginalFilename();
    	file.getContentType();
    	//目标文件
    	File dest = new File("F:\\eclipse-workspace\\SSM_Movie\\WebContent\\app\\style\\images\\"+fileName);
    	try {
			file.transferTo(dest);
			mv.addObject("success", true);
			mv.addObject("msg", "修改成功");
			Movie movie = new Movie();
	    	movie.setContent(content);
	    	movie.setClazz(clazz);
	    	movie.setName(name);
	    	movie.setPicture(fileName);
	    	movie.setUrl(url);
	    	movie.setId(movieid);
	    	movieService.changeInfo(movie);
		} catch (Exception e) {
			// TODO: handle exception
			mv.addObject("success", false);
			mv.addObject("msg", "修改失败");
			e.printStackTrace();
		}
    	return mv;
    }
    
    @RequestMapping("/delMovie")
    @ResponseBody
    public String delMovie(Integer movieid) {
    	return movieService.delMovie(movieid)>0?"del success":"del fail";
    }
    
}

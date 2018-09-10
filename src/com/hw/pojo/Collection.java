package com.hw.pojo;

public class Collection {
	private Integer id;
	private Integer userid;
	private Integer movieid;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getMovieid() {
		return movieid;
	}
	public void setMovieid(Integer movieid) {
		this.movieid = movieid;
	}
	@Override
	public String toString() {
		return "Collection [id=" + id + ", userid=" + userid + ", movieid=" + movieid + "]";
	}
	
}

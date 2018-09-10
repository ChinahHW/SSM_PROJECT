package com.hw.pojo;

public class Comment {
	private Integer id;
	private String content;
	private Integer userid;
	private Integer movieid;
	private Integer agree;
	private Integer disagree;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public Integer getAgree() {
		return agree;
	}
	public void setAgree(Integer agree) {
		this.agree = agree;
	}
	public Integer getDisagree() {
		return disagree;
	}
	public void setDisagree(Integer disagree) {
		this.disagree = disagree;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", content=" + content + ", userid=" + userid + ", movieid=" + movieid + ", agree="
				+ agree + ", disagree=" + disagree + "]";
	}
	
}

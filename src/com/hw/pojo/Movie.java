package com.hw.pojo;

public class Movie {
	private Integer id;
	private String name;
	private String content;
	private String url;
	private String picture;
	private String clazz;
	private String time;
	private String isDel;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getClazz() {
		return clazz;
	}
	public void setClazz(String clazz) {
		this.clazz = clazz;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getIsDel() {
		return isDel;
	}
	public void setIsDel(String isDel) {
		this.isDel = isDel;
	}
	@Override
	public String toString() {
		return "Movie [id=" + id + ", name=" + name + ", content=" + content + ", url=" + url + ", picture=" + picture
				+ ", clazz=" + clazz + ", time=" + time + ", isDel=" + isDel + "]";
	}
}

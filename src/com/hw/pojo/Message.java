package com.hw.pojo;

public class Message {
	private Integer id;
	private Integer senderId;
	private Integer receiverId;
	private String content;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getsenderId() {
		return senderId;
	}
	public void setsenderId(Integer senderId) {
		this.senderId = senderId;
	}
	public Integer getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(Integer receiverId) {
		this.receiverId = receiverId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Message [id=" + id + ", senderId=" + senderId + ", receiverId=" + receiverId + ", content=" + content + "]";
	}
	
}

package com.hw.pojo;

public class Friend {
	private Integer id;
	private Integer userid;
	private Integer friendid;
	private String groupname;
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
	public Integer getFriendid() {
		return friendid;
	}
	public void setFriendid(Integer friendid) {
		this.friendid = friendid;
	}
	public String getGroupname() {
		return groupname;
	}
	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	@Override
	public String toString() {
		return "Friend [id=" + id + ", userid=" + userid + ", friendid=" + friendid + ", groupname=" + groupname + "]";
	}
	
}

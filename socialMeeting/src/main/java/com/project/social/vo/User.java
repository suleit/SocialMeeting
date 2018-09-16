package com.project.social.vo;

import java.util.*;

public class User {
	private String user_id;// pk
	private String user_name;
	private String addr1;
	private String addr2;
	private String user_pwd;
	private List<String> interests;
	private String interest; //db 에서 읽어오는용
	private String roomName;
	private String introduce;
	
	public User() {
		super();
		this.roomName ="";
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public List<String> getInterests() {
		return interests;
	}
	public void setInterests(List<String> interests) {
		this.interests = interests;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_name=" + user_name + ", addr1=" + addr1 + ", addr2=" + addr2
				+ ", user_pwd=" + user_pwd + ", interests=" + interests + ", interest=" + interest + ", roomName="
				+ roomName + ", introduce=" + introduce + "]";
	}
	
	
	
}

package com.project.social.vo;

public class Participate {
	private String user_id;
	private String meetingname;
	private String joindate;
	private String participateNum;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMeetingname() {
		return meetingname;
	}
	public void setMeetingname(String meetingname) {
		this.meetingname = meetingname;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getParticipateNum() {
		return participateNum;
	}
	public void setParticipateNum(String participateNum) {
		this.participateNum = participateNum;
	}
	
	@Override
	public String toString() {
		return "Participate [user_id=" + user_id + ", meetingname=" + meetingname + ", joindate=" + joindate
				+ ", participateNum=" + participateNum + "]";
	}
	
	

}

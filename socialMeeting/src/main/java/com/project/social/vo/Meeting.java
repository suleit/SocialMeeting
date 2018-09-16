package com.project.social.vo;


public class Meeting {
	private String meetingname;
	private String dday; //모임 예정일
	private String enddate; //모집 종료일
	private String addr; //주소 
	private String creator; //채팅방 생성유저 id
	private String purpose; // 모임 생성 목적 - 라디오박스로 3자택1
	private String info; // 모임에 대한 간략한 설명 150 자 이내 
	private int peoplenum; // 목적 인원수 
	private String status;// 현재 모집여부 0 안모집은 1
	private int joinnum; // 현재 모임에 참여신청한 사람수 1명이 기본값 
	private String location_lat; //위도
	private String location_lng; // 경도 
	
	
	
	public String getLocation_lat() {
		return location_lat;
	}




	public void setLocation_lat(String location_lat) {
		this.location_lat = location_lat;
	}




	public String getLocation_lng() {
		return location_lng;
	}




	public void setLocation_lng(String location_lng) {
		this.location_lng = location_lng;
	}




	public String getMeetingname() {
		return meetingname;
	}




	public void setMeetingname(String meetingname) {
		this.meetingname = meetingname;
	}




	public String getDday() {
		return dday;
	}




	public void setDday(String dday) {
		this.dday = dday;
	}




	public String getEnddate() {
		return enddate;
	}




	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}




	public String getAddr() {
		return addr;
	}




	public void setAddr(String addr) {
		this.addr = addr;
	}




	public String getCreator() {
		return creator;
	}




	public void setCreator(String creator) {
		this.creator = creator;
	}




	public String getPurpose() {
		return purpose;
	}




	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}




	public String getInfo() {
		return info;
	}




	public void setInfo(String info) {
		this.info = info;
	}




	public int getPeoplenum() {
		return peoplenum;
	}




	public void setPeoplenum(int peoplenum) {
		this.peoplenum = peoplenum;
	}




	public String getStatus() {
		return status;
	}




	public void setStatus(String status) {
		this.status = status;
	}




	public int getJoinnum() {
		return joinnum;
	}




	public void setJoinnum(int joinnum) {
		this.joinnum = joinnum;
	}

	@Override
	public String toString() {
		return "Meeting [meetingname=" + meetingname + ", dday=" + dday + ", enddate=" + enddate + ", addr=" + addr
				+ ", creator=" + creator + ", purpose=" + purpose + ", info=" + info + ", peoplenum=" + peoplenum
				+ ", status=" + status + ", joinnum=" + joinnum + ", location_lat=" + location_lat + ", location_lng="
				+ location_lng + "]";
	}





	
	

}

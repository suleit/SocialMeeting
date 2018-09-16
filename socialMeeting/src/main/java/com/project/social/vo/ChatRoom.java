package com.project.social.vo;


import java.util.*;

import org.springframework.web.socket.WebSocketSession;

public class ChatRoom {
	private String roomName; //모임이름 =meetingName=roomName
	private String location_lat; //위도
	private String location_lng; // 경도 
	private String status; // 초기값 0- 채팅창으로 인원 모집중, 1-모집 종료/채팅창 닫음
	
	public ChatRoom() {
		super();
	
	}

	public ChatRoom(String roomName, String location_lat, String location_lng) {
		super();
		this.roomName = roomName;
		this.location_lat = location_lat;
		this.location_lng = location_lng;
		this.status = "0";
	}
	
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ChatRoom [roomName=" + roomName + ", location_lat=" + location_lat + ", location_lng=" + location_lng
				+ ", status=" + status + "]";
	}
	


}
package com.project.social.vo;

import org.springframework.web.socket.WebSocketSession;

public class ChatUser {
	// 에코핸들러용 방 값....
	private String roomName;
	private WebSocketSession session;
	private String id;
	private String userid;
	
	public ChatUser() {
		super();
	}

	public ChatUser(String roomName, WebSocketSession session, String id, String userid) {
		super();
		this.roomName = roomName;
		this.session = session;
		this.id = id;
		this.userid =userid;
	}

	
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	public WebSocketSession getSession() {
		return session;
	}

	public void setSession(WebSocketSession session) {
		this.session = session;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "ChatUser [roomName=" + roomName + ", session=" + session + ", id=" + id + ", userid=" + userid + "]";
	}

	
}

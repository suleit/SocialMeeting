package com.project.social.socket;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.social.vo.ChatUser;

public class EchoHandler extends TextWebSocketHandler {


	private static final Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	// private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();
	private List<ChatUser> userList= new ArrayList<>();
	// private List<WebSocketSession> sessionList = new
	// ArrayList<WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("{} 연결됨", session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		logger.info("{}로부터 {}받음", session.getId(), message.getPayload());
		
		String chatRoom;
		String talker = session.getId();
		String userid;
		String talkerRoom = null;

		for (ChatUser chat : userList) {
			if (chat.getId().equals(talker)) {
				talkerRoom = chat.getRoomName();
			}
		}

		try {
			chatRoom = message.getPayload().split("::::")[1];
			userid = message.getPayload().split("::::")[2];
		} catch (Exception e) {
			chatRoom = null;
			userid = null;
		}

		if (chatRoom != null) {
			ChatUser chat = new ChatUser(chatRoom, session, talker, userid);
			userList.add(chat);
			//System.out.println(chat);
			//System.out.println("챗유저 생성하여 list 에 넣어줌");
		}
		//System.out.println("토커룸:"+talkerRoom);
		String users ="유저목록";
		if (talkerRoom != null) {
			for (ChatUser chat : userList) {
				if (talkerRoom.equals(chat.getRoomName())) {
					users += "::"+chat.getUserid();
					chat.getSession().sendMessage(message);
					System.out.println(message.getPayload()+": 메세지전송됨");
				}
			}
		}
		
		System.out.println("if문 테스트:"+message.getPayload()+users);
		if(message.getPayload().contains("입장하였습니다.")) {
			//System.out.println("if문 안입니다.");
			CharSequence cs = users;
			for (ChatUser chat : userList) {
				if(talkerRoom.equals(chat.getRoomName())) {
					chat.getSession().sendMessage(new TextMessage(cs));
				}
			}
			System.out.println(users);
		
		}
//		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// sessionList.remove(session);
		// users.remove(session.getId());
		logger.info("{} 연결끊김", session.getId());
		Iterator<ChatUser> iter=userList.iterator();
		while(iter.hasNext()) {
			ChatUser cr=iter.next();
			if(cr.getId().equals(session.getId())) {
				iter.remove();
			}
		}
		// System.out.println("채팅방 퇴장자 :"+session.getPrincipal().getName());
	}
	
	

}

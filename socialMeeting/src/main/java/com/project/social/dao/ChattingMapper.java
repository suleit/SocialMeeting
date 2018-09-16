package com.project.social.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.project.social.vo.ChatRoom;
import com.project.social.vo.Meeting;
import com.project.social.vo.Participate;

public interface ChattingMapper {

	public int insertMeeting(Meeting vo); // 미팅 db에 넣기 
	public List<Meeting> selectAllMeeting(RowBounds rb, Map<String, Object> map);
	public Meeting findmeeting(String meetingname); // 특정 미팅만 가져오기 
	public int deleteMeeting(String meetingname);

	public List<ChatRoom> selectAllChatroom(); //현재 모집중인 챗룸만 싹다불러온다 
	public int insertChatRoom(ChatRoom cr); // 챗룸 db에 넣기
	public int deleteChatroom(String meetingname);
	
	public int insertParticipate(Participate vo); // 모임참여인원넣기염
	public int deletepart(Participate vo); // 참여취소 
	public int getTotal(Map<String, Object> map);
	public List<Participate> selectMemberList(String meetingname);
	
		
}

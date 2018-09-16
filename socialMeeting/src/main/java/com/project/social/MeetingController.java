package com.project.social;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.social.dao.ChattingMapper;
import com.project.social.dao.UserMapper;
import com.project.social.util.PageNavigator;
import com.project.social.vo.ChatRoom;
import com.project.social.vo.Meeting;
import com.project.social.vo.Participate;
import com.project.social.vo.User;



@Controller
public class MeetingController {

	private final int COUNTPAGE=10;
	private final int PAGEPERGROUP=5;
	
	@Autowired
	SqlSession sqlsession;
	
	
	
	@RequestMapping(value = "/makeChatRoom", method = RequestMethod.GET)
	public String makeChatRoom(HttpSession session, Model model, String lat, String lng, String addr) {		
		User user = (User) session.getAttribute("loginUser");	
		System.out.println(user);
		String roomName = user.getRoomName();
		System.out.println(user);
		
		if(!roomName.isEmpty()) {
			model.addAttribute("notice", "모임/채팅방은 이중으로 개설할 수 없습니다.");
			return "mypage";
		}
		
		System.out.println("lat"+lat);
		System.out.println("lng"+lng); // db에 넣기용 
		System.out.println(addr);
		
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);
		model.addAttribute("addr", addr);
		
		return "meeting/makeChatRoom";
	}
	
	@RequestMapping(value = "/meetinglist", method = {RequestMethod.GET, RequestMethod.POST})
	public String meetinglist(Model model,@RequestParam(value="page", defaultValue="1")int page,
			@RequestParam(value="search", defaultValue="meetingname")String search,
			@RequestParam(value="searchWord", defaultValue="")String searchWord) {	
		
		System.out.println(page+"+"+search + " + " + searchWord);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("searchWord", searchWord);

		ChattingMapper dao= sqlsession.getMapper(ChattingMapper.class);
		int total = dao.getTotal(map);
		
		PageNavigator navi = new PageNavigator(COUNTPAGE, PAGEPERGROUP, page, total);
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		
		List<Meeting> meetlist= dao.selectAllMeeting(rb,map);
		
//		System.out.println(chatlist.get(0).toString());
		System.out.println(meetlist.get(0).toString());
		
		model.addAttribute("meetlist", meetlist);
		
		model.addAttribute("navi", navi);
		model.addAttribute("searchWord", searchWord);
		model.addAttribute("search", search);
		
		return "meeting/chattingList";
	}
	
	//채팅/미팅객체 생성
	@RequestMapping(value = "/insertcnm", method = RequestMethod.POST)
	public String insertcnm(ChatRoom cr, Meeting m, Model model, HttpSession session) {		
		ChattingMapper dao= sqlsession.getMapper(ChattingMapper.class);
		System.out.println(m);
		System.out.println(cr);
			int cnt1= dao.insertMeeting(m);
		cr.setRoomName(m.getMeetingname());
		int cnt2= dao.insertChatRoom(cr); //이름 넣어주기 
		System.out.println("미팅:챗룸="+cnt1+":"+cnt2);
		if(cnt1>0&&cnt2>0) {
			User vo= new User();
			vo.setUser_id(m.getCreator());
			vo.setRoomName(m.getMeetingname());
			UserMapper userdao= sqlsession.getMapper(UserMapper.class);
			System.out.println(vo);			
			
			userdao.updateUser(vo, null); //룸네임 업데이트해주기
			
			User user = userdao.findUser(vo); //세션에 업데이트하기위해서
			if(user!=null) {
				System.out.println(user);
				session.removeAttribute("loginUser");
				session.setAttribute("loginUser", user);
			}
		}
		
		return "redirect:meetinglist"; // 리스트로 보낼것인가 
	}
	
	
	@RequestMapping(value = "/meetingdetail", method = RequestMethod.GET)
	public String meetingdetail(String meetingname,Model model) {		
		ChattingMapper dao= sqlsession.getMapper(ChattingMapper.class);
		Meeting meeting = dao.findmeeting(meetingname);
		if(meeting!=null) {
			model.addAttribute("meeting", meeting);
		}
		return "meeting/meetingdetail"; // 리스트로 보낼것인가 
	}
	
	@RequestMapping(value = "/checkmeetingname", method = RequestMethod.POST)
	public @ResponseBody String checkmeetingname(String roomname, Model model) {
		ChattingMapper dao= sqlsession.getMapper(ChattingMapper.class);
		System.out.println(roomname);
		Meeting meet = dao.findmeeting(roomname);
		System.out.println(meet);
		if(meet!=null) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value = "/deletemeeting", method = RequestMethod.GET)
	public String deletemeeting(String meetingname,HttpSession session) {		
		ChattingMapper dao= sqlsession.getMapper(ChattingMapper.class);
		Participate p= new Participate();
		p.setMeetingname(meetingname);
		int partcnt = dao.deletepart(p);
		int cnt = dao.deleteMeeting(meetingname);
		int cnt1 = dao.deleteChatroom(meetingname);
		
		UserMapper userdao = sqlsession.getMapper(UserMapper.class);
		User user = (User) session.getAttribute("loginUser");
		user.setRoomName("");
		
		session.removeAttribute("loginUser");
		session.setAttribute("loginUser", user);
		
		userdao.updateUser(user, null);
		return "redirect:meetinglist"; // 리스트로 보낼것인가 
	}
	
	@RequestMapping(value = "/unjoinmeeting", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String unjoinmeeting(Participate vo) {		
		ChattingMapper dao= sqlsession.getMapper(ChattingMapper.class);
		int cnt = dao.deletepart(vo);
		String msg="";
		if(cnt>0) {
			msg ="모임신청 취소가 완료되었습니다.";
		}else {
			msg ="모임신청취소 실패하였습니다.";
		}
		
		return msg; // 리스트로 보낼것인가 
	}
	
	@RequestMapping(value = "/joinmeeting", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	public @ResponseBody String joinmeeting(Participate vo) {		
		ChattingMapper dao= sqlsession.getMapper(ChattingMapper.class);
		System.out.println(vo);
		int cnt = dao.insertParticipate(vo);
		String msg="";
		if(cnt>0) {
			msg ="모임참여신청이 완료되었습니다.";
		}else {
			msg ="모임참여신청이 되지 않았습니다.";
		}
		
		return msg; // 리스트로 보낼것인가 
	}
	@RequestMapping(value = "/callingMemberlist", method = RequestMethod.POST)
	public @ResponseBody List<Participate> joinmeeting(String meetingname) {		
		ChattingMapper dao= sqlsession.getMapper(ChattingMapper.class);

		List<Participate> members= dao.selectMemberList(meetingname);
		
		return members;
	}
	
	
}

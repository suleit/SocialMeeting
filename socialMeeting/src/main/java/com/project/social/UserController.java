package com.project.social;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.social.dao.UserMapper;
import com.project.social.vo.User;

@Controller
public class UserController {

	@Autowired
	SqlSession sqlsession;

	@RequestMapping(value = "/join", method = { RequestMethod.POST, RequestMethod.GET })
	public String home(User user, Model model) {
		System.out.println(user);
		UserMapper dao = sqlsession.getMapper(UserMapper.class);
		String interest = "";

		List<String> inter = user.getInterests();
		for (String s : inter) {
			interest += s + "::";
		}

		int cnt = dao.insertUser(user, interest);
		if (cnt > 0) {
			model.addAttribute("result", true);
			return "home";
		} else {
			model.addAttribute("result", false);
			return "join";
		}
	}

	@RequestMapping(value = "/login", method = { RequestMethod.POST, RequestMethod.GET })
	public String logout(HttpSession session, Model model, User user) {
		boolean result =settingUser(session, user);
		
		if(result==true) {
			return "redirect:/gotohome";
		} else {
			model.addAttribute("result", false);
			return "login";
		}
	}

	@RequestMapping(value = "/logout", method = { RequestMethod.POST, RequestMethod.GET })
	public String logout(HttpSession session) {
		System.out.println("in logout");
		session.invalidate();
		return "redirect:/gotohome";
	}

	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public @ResponseBody boolean idCheck(String userid) {
		System.out.println(userid);
		boolean result = false;
		UserMapper dao = sqlsession.getMapper(UserMapper.class);
		User user = new User();
		user.setUser_id(userid);
		// System.out.println(user);
		User m = dao.findUser(user);
		// System.out.println("findm:"+m);

		if (m != null) {
			result = true; // 사용 불가
		}
		return result; // 사용 가능
	}

	@RequestMapping(value = "/pwcheck", method = RequestMethod.POST)
	public @ResponseBody boolean pwCheck(User user) {
		System.out.println("pwcheck:"+user);
		boolean result = false;
		UserMapper dao = sqlsession.getMapper(UserMapper.class);
		
		User vo =dao.findUser(user);
		if(vo!=null) {
			result=true;
		}
		return result;
	}

	public boolean settingUser(HttpSession session, User user) {
		UserMapper dao = sqlsession.getMapper(UserMapper.class);

		User vo = dao.findUser(user);
		System.out.println(vo);
		if (vo != null) {
			String[] sss = vo.getInterest().split("::");
			List<String> intst = new ArrayList<>();

			for (String s : sss) {
				if (s.equals("busking")) {
					intst.add("버스킹");
					continue;
				} else if (s.equals("SocialDining")) {
					intst.add("소셜다이닝");
					continue;
				} else {
					intst.add("농구/축구/등 운동모임");
				}
			}
			session.setAttribute("loginUser", vo);
			session.setAttribute("interests", intst);
			return true;
		} else {
			return false;
		}
	}

	@RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
	public String updateInfo(HttpSession session, User user) {
		System.out.println("updateInfo"+user);
		UserMapper dao = sqlsession.getMapper(UserMapper.class);
		
		String interest = null;
		List<String> inter = user.getInterests();
		if(inter!=null) {
			interest="";
			for (String s : inter) {
				interest += s + "::";
			}
		}
		int cnt= dao.updateUser(user, interest);
		
		boolean result =settingUser(session, user);
		if(result==true) {
			return "redirect:/gotoMypage";
		}else {
			return "redirect:/goUpdateMyp";	
		}
	}
	

}

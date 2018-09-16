package com.project.social;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {		
		return "home";
	}
	
	@RequestMapping(value = "/gotohome", method = RequestMethod.GET)
	public String gotohome() {		
		return "home";
	}
	
	@RequestMapping(value = "/gotologin", method = RequestMethod.GET)
	public String gotologin() {		
		return "login";
	}

	@RequestMapping(value = "/gotoinfo", method = RequestMethod.GET)
	public String gotoinfo() {		
		return "Info";
	}
	
	@RequestMapping(value = "/gotoMypage", method = RequestMethod.GET)
	public String gotoMypage() {		
		return "mypage";
	}
	
	@RequestMapping(value = "/gotojoin", method = RequestMethod.GET)
	public String gotojoin() {		
		return "join";
	}
	
	@RequestMapping(value = "/goidCheck", method = RequestMethod.GET)
	public String goidCheck() {		
		return "idCheck";
	}
	
	@RequestMapping(value = "/goUpdateMyp", method = RequestMethod.GET)
	public String goUpdateMyp() {		
		return "updateMypage";
	}

	@RequestMapping(value = "/gotoCreate", method = RequestMethod.GET)
	public String gotoCreate() {		
		return "meeting/createchat";
	}
	
	@RequestMapping(value = "/gotochatting", method = RequestMethod.GET)
	public String gochatting(String roomname,Model model) {		
		
		model.addAttribute("roomname", roomname);
		return "meeting/chattingPage"; // 리스트로 보낼것인가 
	}

	


}

package camping.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class chat_controller {
	//채팅방
	@RequestMapping("chatlist.do")
	public String chatlist(HttpSession session,Model model) {
		String id = (String)session.getAttribute("id");
		model.addAttribute("id",id);
		return "chat/chatlist";
	}	
	@RequestMapping("chat.do")
	public String chat(String loc,HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		
		model.addAttribute("loc", loc);
		model.addAttribute("id",id);
		return "chat/chat";
	}
}

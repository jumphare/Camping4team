package camping.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class chat_controller {
	//채팅방
	@RequestMapping("chat.do")
	public String home(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		//DB연결
		
		model.addAttribute("id",id);
		return "chat/chat";
	}	
}

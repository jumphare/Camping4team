package camping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import camping.model.review;
import camping.model.review_reply;
import camping.service.replyService;

@Controller
public class replyController {

	@Autowired
	private replyService service;

	//후기 조회 
			@RequestMapping("readreview.do")
			public String read(review review, int re_no, Model model) {
				
				List<review_reply> replylist = service.readreply(re_no);
				
				model.addAttribute("replylist",replylist);
				
				return "reply/replylist";
			}

}

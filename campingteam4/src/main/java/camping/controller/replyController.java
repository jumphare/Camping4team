package camping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

	// 후기 조회
	@RequestMapping("readreview.do")
	public String read(review review, int re_no, Model model) {

		List<review_reply> replylist = service.readreply(re_no);

		model.addAttribute("replylist", replylist);

		return "reviewdetail.do";
	}

	// 댓글 작성
	@RequestMapping("replywrite.do")
	public String replywrite(review_reply re, int page, int res_no, 
			HttpSession session, Model model) {

		String id = (String) session.getAttribute("id");
		System.out.println("id=" + id);
		
		int result = 0;
		
		if (id == null) {
			result = 2;
			return "reply/replyresult";
		}else {
			
			re.setId(id);
			 
			result = service.insert(re);
			System.out.println("result :" + result);

			model.addAttribute("id", id);
			model.addAttribute("re", re);
			model.addAttribute("page", page);
			model.addAttribute("res_no", res_no);
			model.addAttribute("result", result);

			return "reply/replyresult";
		}
	}
		
		//댓글 삭제
		@RequestMapping("replydelete.do")
		public String replydelete(review_reply re,int reply_no, int page, Model model) {
			System.out.println(1111);
			
//			review_reply rere = service.select(reply_no);
			int result = service.delete(reply_no);
			System.out.println("result :" + result);

			model.addAttribute("re", re);
			model.addAttribute("page", page);
			model.addAttribute("reply_no", re.getReply_no());
//			model.addAttribute("reply_no", rere.getReply_no());
			model.addAttribute("result", result);

			return "reply/replydeleteresult";
			
		}
}

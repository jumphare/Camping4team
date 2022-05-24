package camping.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import camping.model.revlike;
import camping.service.revlikeService;

@Controller
public class revlikeController {

	@Autowired
	private revlikeService service;

	// 게시물 좋아요 추가
	@RequestMapping("reviewlike.do")
	public String reviewlike(int re_no, int page, HttpSession session, Model model) {

		String id = (String) session.getAttribute("id");

		revlike rl = new revlike();
 
		rl.setId(id);
		rl.setRe_no(re_no);

		service.insert(rl);

		model.addAttribute("re_no", re_no);
		model.addAttribute("page", page);

		return "redirect:reviewdetail.do";
	}

	// 좋아요 취소
	@RequestMapping("reviewdelete.do")
	public String reviewdelete(int re_no, int page, HttpSession session, Model model) {

		String id = (String) session.getAttribute("id");

		revlike rl = new revlike();

		rl.setId(id);
		rl.setRe_no(re_no);
		
		service.delete(rl);
		
		model.addAttribute("re_no", re_no);
		model.addAttribute("page", page);

		return "redirect:reviewdetail.do";
	}
}

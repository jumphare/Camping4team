package camping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import camping.model.review;

@Controller
public class mainController {
	@Autowired
	private camping.service.ReviewService service;
	
	@RequestMapping("/layout.do")
	public String layout(Model model) {
		return "/main/layout";
	}
	@RequestMapping("/layout2.do")
	public String layout2(Model model) {
		
		//메인에 후기 2개 출력
		review rv1 = new review();
		rv1 = service.toplist1();
		
		review rv2 = new review();
		rv2 = service.toplist2();
		
		model.addAttribute("rv1", rv1);
		model.addAttribute("rv2", rv2);
		return "/main/layout2";
	}

}

package camping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mainController {

	@RequestMapping("/layout.do")
	public String layout(Model model) {
		return "/main/layout";
	}
	@RequestMapping("/layout2.do")
	public String layout2(Model model) {
		return "/main/layout2";
	}
}

package camping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class smartEditorController {

	@Autowired
	private camping.service.ReviewService service;

	//
	@RequestMapping("/smarteditor")
	public String smarteditor() {

		return "review/reviewinsertform";
	}
	
}

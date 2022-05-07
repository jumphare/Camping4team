package camping.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import camping.service.memberService;

@Controller
public class memberController {
	@Autowired
	private memberService service;

}

package camping.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import camping.model.camp_select;
import camping.model.spot;
import camping.service.camp_service;



@Controller
public class camp_Controller {
	@Autowired
	private camp_service camp_service;
	
	@RequestMapping("date_sel.do")
	public String date_sel(){
		System.out.println("컨트롤러 들어옴");
		
		return "camp_loc/date_sel";
	}
	
	@RequestMapping("camp_sel.do")
	public String camp_sel(String startDate, String endDate,String memcount, Model model){
		
		System.out.println("컨트롤러 들어옴");

//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		LocalDate startDate =LocalDate.parse(startdate,formatter);
//		LocalDate endDate =LocalDate.parse(enddate,formatter);
		
		
		System.out.println("stday : "+startDate);
		System.out.println("enday : "+endDate);
		System.out.println("memcount : "+memcount);
		
	
		model.addAttribute("memcount",memcount);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
		return "camp_loc/camp_loc_sel";
	}
	
	@RequestMapping("loc_check.do")
	public String loc_check(String loc, String startDate, String endDate,String memcount, Model model){
		System.out.println("loc : " + loc);
		System.out.println("stday : "+startDate);
		System.out.println("enday : "+endDate);
		System.out.println("memcount : "+memcount);
	
		model.addAttribute("loc", loc);
		model.addAttribute("memcount",memcount);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
		return "camp_loc/camp_type";
	}
	
	
	@RequestMapping("type_list.do")
	public String type_list(String loc, String type, String startDate, String endDate,String memcount, Model model){	
		
	    	camp_select camsel = new camp_select();
	    	camsel.setStartDate(startDate);
	    	camsel.setEndDate(endDate);
			camsel.setLoc(loc);
			camsel.setMemcount(Integer.parseInt(memcount));
			camsel.setType(type);
			System.out.println("loc : " + camsel.getLoc());
			System.out.println("type : " + camsel.getType());
			System.out.println("stday : "+camsel.getStartDate());
			System.out.println("enday : "+camsel.getEndDate());
			System.out.println("memcount : "+camsel.getMemcount());
			
			camp_service.resetcheck();	//체크 초기화 작업
			System.out.println("초기화 실행");
			camp_service.resevcheck(camsel);//장소가 같은 예약에서 날짜가 겹치는 날짜가 있을 시 값 1 대입
			System.out.println("1 대입");
			
			List<spot> spotlist = camp_service.camplist(camsel);
			System.out.println("spotlist"+spotlist);
			
			model.addAttribute("memcount",memcount);
			model.addAttribute("spotlist", spotlist);
			model.addAttribute("loc", loc);
			model.addAttribute("type", type);
			
	     return "camp_loc/camp_list";
		
	}
	//글작성 폼
	@RequestMapping("spotwriteform.do")
	public String spotwriteform() {
		return "camp_loc/spot_write";	//이렇게만 작성해도 넘어간다~
	}
	
	//글작성
	@RequestMapping("spotwrite.do")
	public String spotwrite(spot spot, Model model) {
		
		int result = camp_service.insert(spot);
		System.out.println("result :"+result);
	
		
		model.addAttribute("result",result);
		
		return "camp_loc/insert_result";
	}
	
}

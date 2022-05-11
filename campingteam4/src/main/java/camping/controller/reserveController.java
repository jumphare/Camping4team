package camping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import camping.model.camp_loc;
import camping.model.equipment;
import camping.model.reservation;
import camping.model.spot;
import camping.service.reserveService;

@Controller
public class reserveController {
	@Autowired
	private reserveService sv;
	
	//임의 메인 페이지 - 로그인 세션 공유 위해 생성
	@RequestMapping("/resmain.do")
	public String resmain(HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		session.setAttribute("id", "test");
		return "/reservation/resmain";
	}
	
	//임의 장소, 자리 페이지 - DB값 받아서 예약 페이지로 넘기는 과정 위해 생성
	@RequestMapping("/reservePage.do")
	public String loc(int camp_no, int sp_no, Model model) {
		//장소 DB
		camp_loc loc=sv.loc(camp_no);  //임의의 1번 장소 DB 불러오기
		//자리 DB
		spot spot=sv.spot(sp_no);
		//옵션 DB
		List<equipment> list=sv.eqm(camp_no);
		
		model.addAttribute("loc", loc);
		model.addAttribute("spot", spot);
		model.addAttribute("list", list);
		
		return "/reservation/reservePage";
	}
		
	  //저장 - 예약내역에서 '결제 대기' 상태로 확인 가능  
	  @RequestMapping("/res_save.do")
	  public String res_save(reservation res, String[] eqm_no, String[] eqm_num, Model model) throws Exception {
		  String eq_no=String.join("-",eqm_no);
		  String eq_num=String.join("-",eqm_num);

		  int result=0;
		  res.setEq_no(eq_no);
		  res.setEq_num(eq_num);
		  res.setPayment(0);
		  res.setState(0);
		
		  System.out.println(res.getEq_no());
		  System.out.println(res.getEq_num());
		  System.out.println(res.getCamp_no());
		  System.out.println(res.getSp_no());
		  System.out.println(res.getNum());
		  System.out.println(res.getPrice());
		  System.out.println(res.getId());
		  
		  result=sv.res_save(res);
		  
		  model.addAttribute("result", result);
		   
		  return "/reservation/save_result"; 

	  }
	 
	
}

package camping.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import camping.model.member;
import camping.model.reservation;
import camping.model.spot;
import camping.service.reserveService;

@Controller
public class reserveController {
	@Autowired
	private reserveService sv;

	// 임의 메인 페이지 - 로그인 세션 공유 위해 생성
	@RequestMapping("/resmain.do")
	public String resmain(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.setAttribute("id", "test");
		return "/reservation/resmain";
	}

	// 임의 장소, 자리 페이지 - DB값 받아서 예약 페이지로 넘기는 과정 위해 생성
	@RequestMapping("/reservePage.do")
	public String loc(int camp_no, int sp_no, Model model) {
		// 장소 DB
		camp_loc loc = sv.loc(camp_no); // 임의의 1번 장소 DB 불러오기
		// 자리 DB
		spot spot = sv.spot(sp_no);
		// 옵션 DB
		List<equipment> list = sv.eqm(camp_no);

		model.addAttribute("loc", loc);
		model.addAttribute("spot", spot);
		model.addAttribute("list", list);

		return "/reservation/reservePage";
	}

	// 저장 - 예약내역에서 '결제 대기' 상태로 확인 가능
	@RequestMapping("/res_save.do")
	public String res_save(reservation res, String[] eqm_no, String[] eqm_num, Model model) throws Exception {
		String eq_no = String.join("-", eqm_no);
		String eq_num = String.join("-", eqm_num);

		int result = 0;
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

		result = sv.res_save(res);

		model.addAttribute("result", result);

		return "/reservation/save_result";
	}

	// 예약내역 페이지
	@RequestMapping("/reserveList.do")
	public String reserveList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int i = 0;
		Date date=new Date();
		// id의 예약내역
		List<reservation> reslist = sv.reslist(id);
		// 리스트 크기만큼 배열 생성
		String[] cname = new String[reslist.size()];
		String[] sname = new String[reslist.size()];
		// 예약마다 장소, 자리명 불러와서 배열 저장
		for (reservation res : reslist) {
			camp_loc loc = sv.loc(res.getCamp_no());
			spot spot = sv.spot(res.getSp_no());
			cname[i] = loc.getName();
			sname[i] = spot.getType();
			System.out.println(res.getRes_date());
		}
		System.out.println(reslist);
		System.out.println(cname);
		System.out.println(sname);
		System.out.println(date);
		model.addAttribute("date", date);
		model.addAttribute("rlist", reslist);
		model.addAttribute("cname", cname);
		model.addAttribute("sname", sname);

		return "/reservation/reserveList";
	}

	// 예약 상세페이지
	@RequestMapping("/reserveView.do")
	public String reserveView(HttpServletRequest request, int res_no, Model model) {
		System.out.println(res_no);
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		//예약자(id) DB
		member mem=sv.memdetail(id);
		// 예약 DB
		reservation res = sv.resdetail(res_no);
		camp_loc loc = sv.loc(res.getCamp_no());
		spot spot = sv.spot(res.getSp_no());
		// 장비 옵션
		String[] eqm_no=res.getEq_no().split("-");
		String[] eqm_num=res.getEq_num().split("-");
		List<equipment> eqlist = sv.eqm(res.getCamp_no());
		
		model.addAttribute("mem", mem);
		model.addAttribute("camp", loc);
		model.addAttribute("spot", spot);
		model.addAttribute("res", res);
		model.addAttribute("eqm_no", eqm_no);
		model.addAttribute("eqm_num", eqm_num);
		model.addAttribute("eqlist", eqlist);

		return "/reservation/reserveView";
	}

}

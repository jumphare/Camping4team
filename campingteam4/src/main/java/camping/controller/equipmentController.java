package camping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import camping.model.equipment;
import camping.model.notice;
import camping.service.equipmentService;


@Controller
public class equipmentController {
	
	@Autowired
	private equipmentService sv;
	
	/*
	 * //장비 관리 페이지
	 * 
	 * @RequestMapping("/eq_admin.do") public String eq_admin(HttpServletRequest
	 * request, Model model, String camp_no) { int num=1; if(camp_no!=null)
	 * num=Integer.parseInt(camp_no);
	 * 
	 * model.addAttribute("camp_no", num);
	 * 
	 * return "/equipment/eq_admin"; }
	 */
	
	//장비 테이블 + 페이징 추가 - 검색 아직
	@RequestMapping("/eq_table.do")
	public String eq_table(equipment eqm, String pnum, Model model) {
		int num=1;
		if(eqm.getCamp_no()!=0)
			num=eqm.getCamp_no();
		eqm.setCamp_no(num);
		
		int page = 1;
		if (pnum != null) 
			page=Integer.parseInt(pnum);
		
		int startRow=(page-1)*20+1;
		int endRow=startRow+20-1;
		
		eqm.setStartRow(startRow);
		eqm.setEndRow(endRow);
		
		if(eqm.getType()==null)
			eqm.setType("all");
		System.out.println(eqm.getType());
		System.out.println(eqm.getCamp_no());
		int cnt=sv.eqcnt(eqm);
		List<equipment> list = sv.eqlist(eqm);
	
		// 총페이지수 (페이지 당 20개씩)
		int pageCount = cnt / 20 + ((cnt % 20 == 0) ? 0 : 1);

		int startPage = ((page - 1) / 10) * 20 + 1; 
		int endPage = startPage + 20 - 1; 

		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("eqm",eqm);
		model.addAttribute("cnt", cnt);
		model.addAttribute("list", list);
		
		model.addAttribute("page", page);
		model.addAttribute("pcnt", pageCount);
		model.addAttribute("spage", startPage);
		model.addAttribute("epage", endPage);
		
		return "/equipment/eq_table";
	}
	
	//장비 추가 페이지
	@RequestMapping("/eq_insertform.do")
	public String eq_insertform(Model model) {
		return "/equipment/eq_insert";
	}
	
	//장비 추가
	@RequestMapping("/eq_insert.do")
	public String eq_insert(RedirectAttributes redirect, equipment eq, String[] typechk, Model model) {
		System.out.println(eq.getCamp_no());
		System.out.println(typechk);
		String type = String.join("-", typechk);
		eq.setType(type);
		
		sv.eq_insert(eq);
		redirect.addAttribute("camp_no", eq.getCamp_no());
		return "redirect:/eq_table.do";
	}
	
	//수정폼
	@RequestMapping("eq_updateform.do")
	public String eq_updateform(int eq_no, Model model) {
		//해당 장비 정보 가져오고 type은 나눠서 배열로 저장
		equipment eq=sv.eqdetail(eq_no);
		String[] type=eq.getType().split("-");
		System.out.println(type);
		//타입은 캠프넘버로 가져와서 따로 공유
		List<equipment> eq_op=sv.eq_option(eq.getCamp_no());
		model.addAttribute("eq_op", eq_op);
		model.addAttribute("eqm", eq);
		model.addAttribute("type", type);
		return "/equipment/eq_update";
	}
	
	//장비 수정
	@RequestMapping("/eq_update.do")
	public String eq_update(RedirectAttributes redirect, equipment eq, String[] typechk, Model model) {
		System.out.println(typechk);
		String type = String.join("-", typechk);
		eq.setType(type);
		equipment eqm=sv.eqdetail(eq.getEq_no());
		//수정한 수량이 여분 수량보다 작으면 같게
		if(eq.getNum()<eqm.getRm_num()) {
			eq.setRm_num(eq.getNum());
		} else if(eq.getNum()>eqm.getNum()) { //기존 수량보다 수정 수량이 크면
			int n=eq.getNum()-eqm.getNum(); //추가분만큼
			eq.setRm_num(eqm.getRm_num()+n); //기존 여분수량에 추가
		}
		sv.eq_update(eq);
		redirect.addAttribute("camp_no", eq.getCamp_no());
		return "redirect:/eq_table.do";
	}
	
	//장비 삭제
	@RequestMapping("/eq_delete.do")
	public String eq_delete(RedirectAttributes redirect, String[] chk, String camp_no, Model model) {
		for(int i=0; i<chk.length; i++)
			sv.eq_delete(chk[i]);
		redirect.addAttribute("camp_no", camp_no);
		return "redirect:/eq_table.do";
	}
	
	//자리 옵션
	@RequestMapping("/eq_option.do")
	public String eq_option(int camp_no, Model model) {
		System.out.println(camp_no);
		List<equipment> eq_op=sv.eq_option(camp_no);
		System.out.println(eq_op);
		model.addAttribute("eq_op", eq_op);
		return "/equipment/eq_option";
	}

	
}

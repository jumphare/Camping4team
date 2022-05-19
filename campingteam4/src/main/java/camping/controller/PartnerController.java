package camping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import camping.model.partner;
import camping.service.PartnerService;


@Controller
public class PartnerController {
	
	@Autowired
	private PartnerService PBService;
	
	@RequestMapping("pbWrite.do")
	public String pbWrite() {
		return "partner/pbWrite";
	}
	
	@RequestMapping("pbresult.do")
	public String pbresult(partner partner, Model model) {
		int result = PBService.insert(partner);
		System.out.println("result:" + result);
		model.addAttribute("result", result);
		return "partner/pbWriteResult";
	}
	
	@RequestMapping("pbList.do")
	public String pbList(HttpServletRequest request, Model model) {
		int page = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;
		
		int listcount = PBService.getCount();
		System.out.println("listcount:" + listcount);
		
		List<partner> pbList = PBService.getPBList(page);
		System.out.println("pbList:" + pbList);
		
		int pageCount = listcount / limit + ((listcount%limit==0) ? 0:1);
		int startPage = ((page - 1) / 10) * limit + 1;
		int endPage = startPage + 10 - 1;
		
		if(endPage > pageCount)
			endPage = pageCount;
		
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("pbList", pbList);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		
		return "partner/pbList";
	}
	
	@RequestMapping("pbView.do")
	public String pbView(int par_no, int page, Model model) {
		PBService.updatecount(par_no);
		System.out.println("par_no:"+par_no);
		partner partner = PBService.getBoard(par_no);
		String content = partner.getContent().replace("\n", "<br>");
		
		model.addAttribute("partner", partner);
		model.addAttribute("content", content);
		model.addAttribute("page", page);
		
		return "partner/pbView";
				
	}
	
	// 수정 폼
	@RequestMapping("pbUpdate.do")
	public String pbUpdate(int par_no, int page, Model model) {
		
		partner partner = PBService.getBoard(par_no); 	//상세 정보 구하기
		
		model.addAttribute("partner", partner);
		model.addAttribute("page", page);
		
		return "partner/pbUpdate";
	}
	
	// 글수정
	@RequestMapping("pbUpdateResult.do")
	public String pbUpdateResult(partner partner, int page, Model model) {
		int result = 0;
		partner old = PBService.getBoard(partner.getNo());
		if(old.getPasswd().equals(partner.getPasswd())) {  // 비번 일치시
			result = PBService.update(partner);
		}else {											 // 비번 불일치시
			result = -1;
		}
		
		model.addAttribute("result", result);
		model.addAttribute("partner", partner);
		model.addAttribute("page", page);
		
		return "partner/pbUpdateResult";
	}
	
	// 삭제 폼
		@RequestMapping("pbDelete.do")
		public String pbDelete() {
			return "partner/pbDelete";
		}
	
	// 글삭제
	@RequestMapping("pbDeleteResult.do")
	public String pbDeleteResult(partner partner, int page, Model model) {
		int result = 0;
		partner old = PBService.getBoard(partner.getNo());
		if(old.getPasswd().equals(partner.getPasswd())) {  // 비번 일치시
			result = PBService.delete(partner.getNo());
		}else {											 // 비번 불일치시
			result = -1;
		}
		
		model.addAttribute("result", result);
		model.addAttribute("page", page);
		
		return "partner/pbDeleteResult";
	}
	
}

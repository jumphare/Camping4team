package camping.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import camping.model.msg;
import camping.service.MemberServiceImpl;
import camping.service.msgService;

@Controller
public class msgController {
	@Autowired
	private msgService sv;
	@Autowired
	private MemberServiceImpl msv;
	//레이아웃 연습
	@RequestMapping("/layout.do")
	public String layout() {
		return "/main/layout";
	}
	//임의의 로그인 메인
	@RequestMapping("/msglogin.do")
	public String msglogin(HttpSession session, String id, Model model) {
		System.out.println(id);
		session.setAttribute("id", id);
		//안 읽은 쪽지 카운트
		int cnt=sv.msgcnt(id);
		model.addAttribute("cnt", cnt);
		return "/msg/msgmain";
	}
	//쪽지 작성창으로
	@RequestMapping("/writemsg.do")
	public String writemsg(String recv_id, Model model) {
		model.addAttribute("recv_id", recv_id);
		return "/msg/writemsg";
	}
	//쪽지 전송
	@RequestMapping("/sendmsg.do")
	public String sendmsg(HttpSession session, msg msg, Model model) {
		System.out.println("전송 진입:"+msg.getRecv_id());
		String id=(String)session.getAttribute("id");
		msg.setId(id);
		sv.sendmsg(msg);
		return "/msg/result";
	}

	//받은 쪽지함
	@RequestMapping("/recvlist.do")
	public String recvlist(@RequestParam("recv_id") String recv_id, String page, Model model) {
		int pnum = 1;
		if (page!=null) 
			pnum=Integer.parseInt(page);	
		int startRow=(pnum-1)*10+1;
		int endRow=startRow+10-1;
		msg mg=new msg();
		mg.setRecv_id(recv_id);
		mg.setStartRow(startRow);
		mg.setEndRow(endRow);
		List<msg> msg=sv.recvlist(mg);
		int cnt=sv.allcnt_rd(recv_id);
		
		// 총페이지수 (페이지 당 10개씩)
		int pageCount = cnt / 10 + ((cnt % 10 == 0) ? 0 : 1);
		int startPage = ((pnum - 1) / 10) * 10 + 1; 
		int endPage = startPage + 10 - 1; 
		if (endPage > pageCount)
				endPage = pageCount;
		
		model.addAttribute("pcnt", pageCount);
		model.addAttribute("spage", startPage);
		model.addAttribute("epage", endPage);
		model.addAttribute("page", pnum);
		model.addAttribute("cnt", cnt);
		model.addAttribute("msg", msg);
		return "/msg/recvlist";
	}
	//보낸 쪽지함
	@RequestMapping("/sendlist.do")
	public String sendlist(@RequestParam("id") String id, String page, Model model) {
		int pnum = 1;
		if (page!=null) 
			pnum=Integer.parseInt(page);	
		int startRow=(pnum-1)*10+1;
		int endRow=startRow+10-1;
		msg mg=new msg();
		mg.setId(id);
		mg.setStartRow(startRow);
		mg.setEndRow(endRow);
		List<msg> msg=sv.sendlist(mg);
		int cnt=sv.allcnt_sd(id);
		
		// 총페이지수 (페이지 당 10개씩)
		int pageCount = cnt / 10 + ((cnt % 10 == 0) ? 0 : 1);
		int startPage = ((pnum - 1) / 10) * 10 + 1; 
		int endPage = startPage + 10 - 1; 
		if (endPage > pageCount)
				endPage = pageCount;
		
		model.addAttribute("pcnt", pageCount);
		model.addAttribute("spage", startPage);
		model.addAttribute("epage", endPage);
		model.addAttribute("page", pnum);
		model.addAttribute("cnt", cnt);
		model.addAttribute("msg", msg);
		return "/msg/sendlist";
	}
	//쪽지 내용 보기
	@RequestMapping("/readmsg.do")
	public String msgdetail(HttpSession session, int msg_no, String page, Model model) {
		String id=(String)session.getAttribute("id");
		msg msg=sv.msgdetail(msg_no);
		//안 읽은 쪽지 읽음 표시
		if(msg.getRecv_id().equals(id)&&msg.getMsg_check()==0)
			sv.msgchk(msg_no);
		model.addAttribute("id", id);
		model.addAttribute("page", page);
		model.addAttribute("msg", msg);
		return "/msg/readmsg";
	}
	//탈퇴 회원 확인
	@ResponseBody 
	@RequestMapping(value="/mb_chk.do", method = RequestMethod.POST)
	public String mb_chk(HttpServletResponse response, @RequestParam("id") String id) throws Exception {
		int data=msv.checkMemberId(id);
		PrintWriter out = response.getWriter();
		out.print(data);
		return null;
	}
	//쪽지 개별 삭제
	@ResponseBody 
	@RequestMapping(value="/delmsg.do", method = RequestMethod.POST)
	public String delmsg(HttpServletResponse response, HttpSession session, @RequestParam("msg_no") int msg_no, Model model) throws Exception {
		/*
		 * 1 받은 사람이 삭제하면 read_st=0 이고 받은쪽지함에서 제외하고 출력 - update 
		 * 2 보낸 사람이 삭제하면 recv_st=0 이고 보낸쪽지함에서 제외하고 출력 - update
		 * 3 보낸 사람이 ck=0인 쪽지를 삭제하는 경우 완전 삭제 가능(id=자기id인 경우만) - delete
		 */
		String id=(String)session.getAttribute("id");
		int data=sv.delmsg(msg_no,id);
		PrintWriter out = response.getWriter();
		out.print(data);
		
		return null;
	}
	//안읽은 쪽지 일괄 읽음 처리 (msgchk())
	@RequestMapping("/msgchk.do")
	public String msgchk(HttpSession session, RedirectAttributes redirect, String page, int[] chk, Model model) {
		String id=(String)session.getAttribute("id");
		for(int i=0; i<chk.length; i++)
			sv.msgchk(chk[i]);
		redirect.addAttribute("recv_id", id);
		redirect.addAttribute("page", page);
		return "redirect:/recvlist.do";
	}
	//다중 삭제
	@RequestMapping("/muldel.do")
	public String mulddel(HttpSession session, RedirectAttributes redirect, String page, @RequestParam("num") int num, int[] chk, Model model) {
		String id=(String)session.getAttribute("id");
		for(int i=0; i<chk.length; i++)
			sv.delmsg(chk[i], id);
		String result="";
		if(num==1) {
			redirect.addAttribute("page", page);
			redirect.addAttribute("recv_id", id);
			result="redirect:/recvlist.do";
		}
		if(num==0) {
			redirect.addAttribute("page", page);
			redirect.addAttribute("id", id);
			result="redirect:/sendlist.do";
		}
		return result;
	}

}

package camping.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import camping.model.camp_loc;
import camping.model.equipment;
import camping.model.member;
import camping.model.reservation;
import camping.model.spot;
import camping.service.equipmentService;
import camping.service.reserveService;
import camping.model.pay;

@Controller
public class reserveController {
	@Autowired
	private reserveService sv;
	@Autowired
	private equipmentService eqv;
	
	private IamportClient api;

    public reserveController() {
        // REST API 키와 REST API secret 를 아래처럼 순서대로 입력한다.
        this.api = new IamportClient("1805390383174152","936358a44a352394888a377a92dbcfd64cc7ac63162eb1d8ce0ff197f01a54fe70d1a0d732e32c3b");
    }
	
	
	// 임의 메인 페이지 - 로그인 세션 공유 위해 생성
	@RequestMapping("/resmain.do")
	public String resmain(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.setAttribute("id", "test");
		return "/reservation/resmain";
	}

	// 임의 장소, 자리 페이지 - DB값 받아서 예약 페이지로 넘기는 과정 위해 생성
	@RequestMapping("/reservePage.do")
	public String loc(reservation res, Model model) {
		// 장소 DB
		camp_loc loc = sv.loc(res.getCamp_no()); // 임의의 1번 장소 DB 불러오기
		// 자리 DB
		spot spot = sv.spot(res.getSp_no());
		// 옵션 DB
		List<equipment> list = sv.eqm(res.getCamp_no());

		model.addAttribute("res", res);
		model.addAttribute("loc", loc);
		model.addAttribute("spot", spot);
		model.addAttribute("list", list);

		return "/reservation/reservePage";
	}

	// 저장 - 예약내역에서 '결제 대기' 상태로 확인 가능
	@RequestMapping("/res_save.do")
	public String res_save(reservation res, String[] eqm_no, String[] eqm_num, Model model) throws Exception {
		int result = 0;
		String eq_no;
		String eq_num;
		if(eqm_no!=null) {
			eq_no = String.join("-", eqm_no);
			eq_num = String.join("-", eqm_num);
		} else {
			eq_no="0";
			eq_num="0";
		}
		res.setEq_no(eq_no);
		res.setEq_num(eq_num);
		res.setPayment(0);   //결제 안 함
		res.setState(0);  //결제대기상태

		System.out.println(res.getEq_no());
		System.out.println(res.getEq_num());

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
			i++;
		}
		System.out.println(reslist);
		System.out.println(cname);
		System.out.println(sname);
		System.out.println(reslist.size());
		
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
		
		String[] eqm_no;
		String[] eqm_num;
		// 장비 옵션
		if(res.getEq_no().equals("0")) {
			eqm_no=null;
			eqm_num=null;
		} else {
			eqm_no=res.getEq_no().split("-");
			eqm_num=res.getEq_num().split("-");
		}

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
	
	//결제페이지로
	@RequestMapping("/res_pay.do")
	public String res_pay(HttpServletRequest request, reservation res, String[] eqm_no, String[] eqm_num, Model model)  throws Exception{
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		//회원 정보 가져옴
		member mem=sv.memdetail(id);
		String eq_no;
		String eq_num;
		if(eqm_no!=null) {
			eq_no = String.join("-", eqm_no);
			eq_num = String.join("-", eqm_num);
		} else {
			eq_no="0";
			eq_num="0";
		}
		res.setEq_no(eq_no);
		res.setEq_num(eq_num);
		res.setPayment(0);   //결제 안 함
		res.setState(0);  //결제대기상태
		System.out.println(res.getRes_no());
		//일단 예약 테이블에 저장 (결제대기 상태로)
		if(res.getRes_no()==0)
			sv.res_save(res);
		//장소,자리,장비 정보 가져옴
		camp_loc loc = sv.loc(res.getCamp_no());
		spot spot = sv.spot(res.getSp_no());
		List<equipment> eqlist = sv.eqm(res.getCamp_no());
		
		
		model.addAttribute("mem", mem);
		model.addAttribute("camp", loc);
		model.addAttribute("spot", spot);
		model.addAttribute("res", res);
		model.addAttribute("eqm_no", eqm_no);
		model.addAttribute("eqm_num", eqm_num);
		model.addAttribute("eqlist", eqlist);
		
		return "/reservation/payPage";
	}
	
	//결제 검증(결제된 가격과 실제 가격이 맞는지 확인)
	@ResponseBody 
	@RequestMapping(value="/verifyIamport.do" , method = RequestMethod.POST)
	public IamportResponse<Payment> paymentByImpUid( Model model, @RequestParam("imp_uid") String imp_uid) throws IamportResponseException, IOException{	
			System.out.println("imp_uid:"+imp_uid);
			IamportResponse<Payment> resp = api.paymentByImpUid(imp_uid);
			System.out.println(resp.getResponse().getAmount());
			return resp;
	}
	
	//결제완료 페이지로
	@RequestMapping("/pay_result.do")
	public String pay_result(HttpSession session, @RequestParam(value= "imp_uid") String imp_uid, Locale locale, Model model) throws IamportResponseException, IOException{
		String id = (String) session.getAttribute("id");
	System.out.println("결제완료 페이지로 넘어감"+id);
		member mem=sv.memdetail(id);
		//id로 저장된 가장 최근 예약내역 가져오기
		reservation res=sv.recentone(id);
		IamportResponse<Payment> resp=api.paymentByImpUid(imp_uid);
	System.out.println(resp.getResponse().getMerchantUid());
		//payment 테이블 저장
		pay pay=new pay();
			pay.setImp_uid(imp_uid);
			pay.setMerchant_uid(resp.getResponse().getMerchantUid());
			pay.setPay_method(resp.getResponse().getPayMethod());
			pay.setAmount(resp.getResponse().getAmount().intValue());
			pay.setPay_date(resp.getResponse().getPaidAt());
		sv.payinsert(pay);
	System.out.println("payment 테이블 저장됨");
		//예약테이블 값 변경
			res.setImp_uid(imp_uid);
			res.setPayment(1);
			res.setState(1);
	System.out.println(res.getRes_no());
		sv.resUpdate(res);
	System.out.println("res 업데이트됨");
		//장비 여분수량 변경
		String[] eqm_no;
		String[] eqm_num;
		// 장비 옵션
		if(res.getEq_no().equals("0")) {
			eqm_no=null;
			eqm_num=null;
		} else {
			eqm_no=res.getEq_no().split("-");
			eqm_num=res.getEq_num().split("-");
		}
		if(eqm_no!=null) {
			for(int i=0; i<eqm_no.length; i++) {
				equipment eqm=new equipment();
				equipment eq= eqv.eqdetail(Integer.parseInt(eqm_no[i]));
				eqm.setEq_no(Integer.parseInt(eqm_no[i]));
				//기존 여분수량에서 예약한 수량만큼 빼서 rm_num에 저장
				eqm.setRm_num(eq.getRm_num()-Integer.parseInt(eqm_num[i]));
				eqv.eq_rm(eqm);
			}
	System.out.println("장비 수량 수정됨");
		}
		
		model.addAttribute("res", res);
		model.addAttribute("mem", mem);
		
		return "/reservation/pay_result";
	}
	
	//예약삭제(저장된 내역 삭제)
	@RequestMapping("/res_del.do")
	public String res_del(int res_no, Model model) {
	System.out.println("삭제 진입");
		//예약테이블에서 내역 삭제
		sv.res_del(res_no);
		return "redirect:/reserveList.do";
	}
	
	//환불
	@ResponseBody
	@RequestMapping("/imp_cancel.do")
	public String imp_cancel (Model model, @RequestParam("imp_uid") String imp_uid, @RequestParam("price") int price) throws IamportResponseException, IOException{
		System.out.println("imp_uid="+imp_uid+"  price="+price);
		BigDecimal allsum=new BigDecimal(price);
		
		CancelData cancelData=new CancelData(imp_uid, true, allsum);
		IamportResponse<Payment> resp=api.cancelPaymentByImpUid(cancelData);
		String msg=resp.getMessage();
		
		return msg;
	}
	
	//예약취소
	@RequestMapping("/res_cancel.do")
	public String res_cancel(int res_no, Model model) {
		System.out.println("환불 진입");
		reservation res=sv.resdetail(res_no);
		//예약테이블 상태 변경
		sv.res_cancel(res_no);
		//취소날짜 업데이트
		sv.pay_cancel(res.getImp_uid());
		//장비 빌린거 돌려놓기
		String[] eqm_no;
		String[] eqm_num;
		// 장비 옵션
		if(res.getEq_no().equals("0")) {
			eqm_no=null;
			eqm_num=null;
		} else {
			eqm_no=res.getEq_no().split("-");
			eqm_num=res.getEq_num().split("-");
		}
		if(eqm_no!=null) {
			for(int i=0; i<eqm_no.length; i++) {
				equipment eqm=new equipment();
				equipment eq= eqv.eqdetail(Integer.parseInt(eqm_no[i]));
				eqm.setEq_no(Integer.parseInt(eqm_no[i]));
				//기존 여분수량에서 예약한 수량만큼 다시 rm_num에 저장
				eqm.setRm_num(eq.getRm_num()+Integer.parseInt(eqm_num[i]));
				eqv.eq_rm(eqm);
			}
		}
		return "redirect:/reserveList.do";
	}
	
	///////////예약관리(admin)
	//예약관리 페이지로(기본: 현재예약)
	@RequestMapping("/res_admin.do")
	public String res_admin(RedirectAttributes redirect, Model model) {
		redirect.addAttribute("page", 1);
		redirect.addAttribute("sort", "res_date");
		return "redirect:/res_cur.do";
	}
	
	//현재예약 페이지로
	@RequestMapping("/res_cur.do")
	public String res_cur(@RequestParam("page") int page, String sort, Model model) {
		int startRow=(page-1)*20+1;
		int endRow=startRow+20-1;
		
		reservation res=new reservation();
		res.setStartRow(startRow);
		res.setEndRow(endRow);
		res.setSort(sort);
		int cnt=sv.curcnt(sort);
		List<reservation> list = sv.curlist(res);
	
		// 총페이지수 (페이지 당 20개씩)
		int pageCount = cnt / 20 + ((cnt % 20 == 0) ? 0 : 1);

		int startPage = ((page - 1) / 10) * 20 + 1; 
		int endPage = startPage + 20 - 1; 

		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("sort",sort);
		model.addAttribute("cnt", cnt);
//		model.addAttribute("list", list);
		
		model.addAttribute("pcnt", pageCount);
		model.addAttribute("spage", startPage);
		model.addAttribute("epage", endPage);
		model.addAttribute("page", page);
		return "/reservation/res_cur";
	}
	//지난예약 페이지로
	
	//예약 상세정보(관리자)
	
	//장비 건별반납
	
	//장비 일괄반납
	
}//ctrler

package camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import camping.dao.reserveDAO;
import camping.model.camp_loc;
import camping.model.equipment;
import camping.model.member;
import camping.model.pay;
import camping.model.reservation;
import camping.model.spot;

@Service
public class reserveService {
	@Autowired
	private reserveDAO dao;
	
	//장소 DB
	public camp_loc loc(int camp_no) {
		return dao.loc(camp_no);
	}
	//자리 DB
	public spot spot(int sp_no) {
		return dao.spot(sp_no);
	}
	//장비 DB
	public List<equipment> eqm(int camp_no){
		return dao.eqm(camp_no);
	}
	//저장(결제대기)
	public int res_save(reservation res) throws Exception {
		return dao.res_save(res);
	}
	//예약목록
	public List<reservation> reslist(String id){
		return dao.reslist(id);
	}
	//예약상세
	public reservation resdetail(int res_no) {
		return dao.resdetail(res_no);
	}
	//멤버 DB
	public member memdetail(String id) {
		return dao.memdetail(id);
	}
	//id로 예약테이블 검색
	public reservation recentone(String id) {
		return dao.recentone(id);
	}
	//예약테이블 수정
	public void resUpdate(reservation res) {
		dao.resUpdate(res);
	}
	//결제 테이블 저장
	public void payinsert(pay pay) {
		dao.payinsert(pay);
	}
	//예약테이블 삭제
	public void res_del(int res_no) {
		dao.res_del(res_no);
	}
	//예약취소 상태변경
	public void res_cancel(int res_no) {
		dao.res_cancel(res_no);
	}
	//결제테이블 날짜변경
	public void pay_cancel(String imp_uid) {
		dao.pay_cancel(imp_uid);
	}
}

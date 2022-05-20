package camping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import camping.model.camp_loc;
import camping.model.equipment;
import camping.model.member;
import camping.model.pay;
import camping.model.reservation;
import camping.model.spot;

@Repository
public class reserveDAO {
	@Autowired
	private SqlSession session;
	
	//장소 DB
	public camp_loc loc(int camp_no) {
		return session.selectOne("reserve.loc_sel",camp_no);
	}
	//자리 DB
	public spot spot(int sp_no) {
		return session.selectOne("reserve.sp_sel",sp_no);
	}
	//장비 DB
	public List<equipment> eqm(int camp_no){
		return session.selectList("reserve.eqm_sel", camp_no);
	}
	//저장 (결제대기)
	public int res_save(reservation res) {
		return session.insert("reserve.res_save", res);
	}
	//예약목록
	public List<reservation> reslist(String id){
		return session.selectList("reserve.reslist", id);
	}
	//예약상세
	public reservation resdetail(int res_no) {
		return session.selectOne("reserve.resdetail", res_no);
	}
	//멤버 DB
	public member memdetail(String id) {
		return session.selectOne("reserve.memdetail",id);
	}
	//id로 예약테이블 검색
	public reservation recentone(String id) {
		return session.selectOne("reserve.recentone", id);
	}
	//예약테이블 수정
	public void resUpdate(reservation res) {
		session.update("reserve.resupdate", res);
	}
	//결제 테이블 저장
	public void payinsert(pay pay) {
		session.insert("reserve.payinsert", pay);
	}
	//예약 테이블 삭제
	public void res_del(int res_no) {
		session.delete("reserve.res_del", res_no);
	}
	//예약취소로 변경
	public void res_cancel(int res_no) {
		session.update("reserve.res_cancel", res_no);
	}
	//결제취소날짜 변경
	public void pay_cancel(String imp_uid) {
		session.update("reserve.pay_cancel", imp_uid);
	}
	//현재 예약 카운트
	public int curcnt(String sort) {
		return session.selectOne("reserve.curcnt", sort);
	}
	
	public List<reservation> curlist(reservation res) {
		return session.selectList("reserve.curlist", res);
	}
}

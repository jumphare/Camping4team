package camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import camping.dao.reserveDAO;
import camping.model.camp_loc;
import camping.model.equipment;
import camping.model.member;
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
}

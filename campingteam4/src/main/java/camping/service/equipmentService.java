package camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import camping.dao.equipmentDAO;
import camping.model.equipment;

@Service
public class equipmentService {
	@Autowired
	private equipmentDAO dao;
	
	//장비목록
	public List<equipment> eqlist (equipment eqm){
		return dao.eqlist(eqm);
	}
	//장비 카운트
	public int eqcnt(equipment eqm) {
		return dao.eqcnt(eqm); 
	}
	//장소타입
	public List<equipment> eq_option(int camp_no) {
		return dao.eq_option(camp_no);
	}
	//장비추가
	public void eq_insert(equipment eq) {
		dao.eq_insert(eq);
	}
	//장비상세
	public equipment eqdetail(int eq_no) {
		return dao.eqdetail(eq_no);
	}
	//장비수정
	public void eq_update(equipment eq) {
		dao.eq_update(eq);
	}
	//장비삭제
	public void eq_delete(String chk) {
		dao.eq_delete(chk); 
	}
	//여분수량 변경
	public void eq_rm(equipment eqm) {
		dao.eq_rm(eqm);
	}
}

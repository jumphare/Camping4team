package camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import camping.dao.campDAO;
import camping.model.camp_select;
import camping.model.spot;



@Service
public class camp_service {
	
	@Autowired
	private campDAO campdao;


	//리스트 출력
	public  List<spot> camplist(camp_select camsel){
		return campdao.camplist(camsel);
	}
	//글작성
	public int insert(spot spot) {
		return campdao.insert(spot);
	}
	
	//예약체크
	public int resevcheck(camp_select camsel) {
		return campdao.resevcheck(camsel);
	}
	//예약초기화
	public int resetcheck() {
		return campdao.resetcheck();
	}
	//상세페이지
	public spot getspot(int sp_no) {
		return campdao.getspot(sp_no);
	}
	//관리자 리스트 출력
	public  List<spot> admin_camplist(){
		return campdao.admin_camplist();
	}
	//장소 수정
	public int modify(spot spot) {
		return campdao.modify(spot);
	}
	//장소 삭제
	public int delete(int sp_no) {
		return campdao.delete(sp_no);
	}
	
	
}



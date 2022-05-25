package camping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import camping.model.camp_select;
import camping.model.spot;



@Repository
public class campDAO {
	@Autowired
	private SqlSession session;
	
	//리스트 출력
	public  List<spot> camplist(camp_select camsel){
		return session.selectList("campns.list", camsel);
	}
	//글작성
	public int insert(spot spot) {
		return session.insert("campns.insert", spot);
	}
	//예약체크
		public int resevcheck(camp_select camsel) {
			return session.update("campns.resevcheck",camsel);
		}
	//예약초기화
		public int resetcheck() {
			return session.update("campns.resetcheck");
		}
	//상세
		public spot getspot(int sp_no) {
			return session.selectOne("campns.getspot",sp_no);
		}
	//관리자 캠프리스트
		public  List<spot> admin_camplist(){
			return session.selectList("campns.admin_list");
		}
	//관리자 수정
		public int modify(spot spot) {
			return session.update("campns.update",spot);
		}
	//장소 삭제
		public int delete(int sp_no) {
			return session.delete("campns.delete",sp_no);
		}
		public int staravg() {
			// TODO Auto-generated method stub
			return session.update("campns.staravg");
		}
		
}

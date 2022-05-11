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
}

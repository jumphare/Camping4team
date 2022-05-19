package camping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import camping.model.partner;

@Repository
public class PartnerDAO {

	@Autowired
	private SqlSession session;
	
	public int insert(partner partner) {
		return session.insert("partnerns.insert", partner);
	}
	
	public int getCount() {
		return session.selectOne("partnerns.count");
	}
	
	public List<partner> getPBList(int page){
		return session.selectList("partnerns.pbList", page);
	}
	
	public void updatecount(int par_no) {
		session.update("partnerns.hit", par_no);
	}
	
	public partner getBoard(int par_no) {
		return session.selectOne("partnerns.content", par_no);
	}
	
	
	
	
	
	
	
}

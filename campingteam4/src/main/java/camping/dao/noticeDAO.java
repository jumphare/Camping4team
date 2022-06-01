package camping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import camping.model.notice;

@Repository
public class noticeDAO {

	@Autowired
	private SqlSession session;
	
	public int insert(notice not) {
		return session.insert("noticens.insert", not);
	}
	
	public int getCount() {
		return session.selectOne("noticens.count");
	}
	
	public List<notice> getBoardList(int page) {
		return session.selectList("noticens.list", page);
	}
	
	
	public List<notice> getBoardNotiList(int page) {
		return session.selectList("noticens.nlist", page);
	}
	
	
	public notice getBoard(int not_no) {
		return session.selectOne("noticens.content", not_no);
	}
	
	public int update(notice board) {
		return session.update("noticens.update", board);
	}
	
	public int delete(int not_no) {
		return session.delete("noticens.delete", not_no);
	}
	
}

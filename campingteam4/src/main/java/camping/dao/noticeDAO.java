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
		return session.insert("insert", not);
	}
	
	public int getCount() {
		return session.selectOne("count");
	}
	
	public List<notice> getBoardList(int page) {
		return session.selectList("list", page);
	}
	
	public notice getBoard(int not_no) {
		return session.selectOne("content", not_no);
	}
	
	public int update(notice board) {
		return session.update("update", board);
	}
	
	public int delete(int not_no) {
		return session.delete("delete", not_no);
	}
	
}

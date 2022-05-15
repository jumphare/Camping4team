package camping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import camping.model.review_reply;

public class replyDAO {

	@Autowired
	private SqlSession session;

	// 댓글 리스트
	public List<review_reply> readreply(int re_no){
		return session.selectList("replyns.list", re_no);
		
	}
}

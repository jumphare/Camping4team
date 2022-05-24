package camping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import camping.model.review_reply;
@Repository
public class replyDAO {

	@Autowired
	private SqlSession session;

	// 댓글 리스트
	public List<review_reply> readreply(int re_no){
		return session.selectList("replyns.list", re_no);
	} 
	//댓글 작성
	public int insert(review_reply re) {
		return session.insert("replyns.insert", re);
	}
	//댓글 삭제
	public int delete(int reply_no) {
		return session.delete("replyns.delete", reply_no);
	}
	public review_reply select(int reply_no) {
		return session.selectOne("replyns.select", reply_no);
	}
}

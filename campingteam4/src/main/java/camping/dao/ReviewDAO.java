package camping.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import camping.model.review;

@Repository
public class ReviewDAO {

	@Autowired
	private SqlSession session;
	
	//글작성
	public int insert(review review) {
		return session.insert("reviewns.insert", review);
	}
	//글 총개수
		public int getCount() {
			return session.selectOne("reviewns.count");
		}
		//글 리스트
		public List<review> reList(int page){
			return session.selectList("reviewns.list", page);
		}
		//장소출력
		public List<review> splist(){
			return session.selectList("reviewns.splist");
		}
		//조회수증가
		public void updatecount(int re_no) {
			session.update("reviewns.updatecount", re_no);
		}
		//보드 상세
		public review reviewdetail(int re_no) {
			return session.selectOne("reviewns.reviewdetail", re_no);
		}
		public String spname(int res_no) {
			return session.selectOne("reviewns.spname", res_no);
			
		}
		//보드 수정
		public int update(review review) {
			return session.update("reviewns.update",review);
		}
}

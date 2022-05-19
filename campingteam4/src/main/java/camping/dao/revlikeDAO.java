package camping.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import camping.model.revlike;

@Repository
public class revlikeDAO {

	@Autowired 
	private SqlSession session;

	// 좋아요 추가
	public int insert(revlike rl) {
		return session.insert("revlikens.insert", rl);
	}

	// 좋아요 삭제
	public int delete(revlike rl) {
		return session.delete("revlikens.delete", rl);
	}

}

package camping.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import camping.model.member;

@Repository
public class MemberDAOImpl {
	
	@Autowired
	private SqlSession sqlSession;	


	/***** 아이디 중복 체크 *****/
//	@Transactional
	public int checkMemberId(String id) throws Exception {
//		getSession();
		int re = -1;	// 사용 가능한 ID
		camping.model.member mb = sqlSession.selectOne("login_check", id);
		if (mb != null)
			re = 1; 	// 중복id
		return re;
	}
	

	/* 비번 검색 */
//	@Transactional
	public camping.model.member findpwd(camping.model.member pm) throws Exception {
//		getSession();
		return sqlSession.selectOne("pwd_find", pm);
	}

	/* 회원저장 */
//	@Transactional
	public void insertMember(camping.model.member m) throws Exception {
//		getSession();
		sqlSession.insert("member_join", m);
	}

	/* 로그인 인증 체크 */
//	@Transactional
	public camping.model.member userCheck(String id) throws Exception {
//		getSession();
		return sqlSession.selectOne("login_check", id);
	}

	/* 회원수정 */
//	@Transactional
	public void updateMember(camping.model.member member) throws Exception {
//		getSession();
		sqlSession.update("member_edit", member);
	}

	/* 회원삭제 */
//	@Transactional
	public void deleteMember(camping.model.member delm) throws Exception {
//		getSession();
		sqlSession.update("member_delete", delm);
	}
}






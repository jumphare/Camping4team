package member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.model.MemberBean;

@Repository
public class MemberDAOImpl {
	
	@Autowired
	private SqlSession sqlSession;	


	/***** 아이디 중복 체크 *****/
//	@Transactional
	public int checkMemberId(String id) throws Exception {
//		getSession();
		int re = -1;	// 사용 가능한 ID
		member.model.MemberBean mb = sqlSession.selectOne("login_check", id);
		if (mb != null)
			re = 1; 	// 중복id
		return re;
	}
	

	/* 비번 검색 */
//	@Transactional
	public member.model.MemberBean findpwd(member.model.MemberBean pm) throws Exception {
//		getSession();
		return sqlSession.selectOne("pwd_find", pm);
	}

	/* 회원저장 */
//	@Transactional
	public void insertMember(member.model.MemberBean m) throws Exception {
//		getSession();
		sqlSession.insert("member_join", m);
	}

	/* 로그인 인증 체크 */
//	@Transactional
	public member.model.MemberBean userCheck(String id) throws Exception {
//		getSession();
		return sqlSession.selectOne("login_check", id);
	}

	/* 회원수정 */
//	@Transactional
	public void updateMember(member.model.MemberBean member) throws Exception {
//		getSession();
		sqlSession.update("member_edit", member);
	}

	/* 회원삭제 */
//	@Transactional
	public void deleteMember(member.model.MemberBean delm) throws Exception {
//		getSession();
		sqlSession.update("member_delete", delm);
	}
}






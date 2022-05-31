package camping.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import camping.dao.MemberDAOImpl;
import camping.model.member;

@Service
public class MemberServiceImpl {
	@Autowired
	private camping.dao.MemberDAOImpl memberDao;
	
	public int checkMemberId(String id) throws Exception{
		return memberDao.checkMemberId(id);
	}
	
	public camping.model.member findpwd(camping.model.member m)throws Exception {
		return memberDao.findpwd(m);
	}
	
	public void insertMember(camping.model.member member) throws Exception{
		memberDao.insertMember(member);
	}
	
	public camping.model.member userCheck(String id) throws Exception{
		return memberDao.userCheck(id);		
	}
	
	public void updateMember(camping.model.member member) throws Exception{
		memberDao.updateMember(member);
	}
	
	public void deleteMember(camping.model.member member) throws Exception{
		memberDao.deleteMember(member);
	}

	public List<member> memberlist(member m) {
		// TODO Auto-generated method stub
		return memberDao.memberlist(m);
	}
}

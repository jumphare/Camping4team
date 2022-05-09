package member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.dao.MemberDAOImpl;
import member.model.MemberBean;

@Service
public class MemberServiceImpl {
	@Autowired
	private member.dao.MemberDAOImpl memberDao;
	
	public int checkMemberId(String id) throws Exception{
		return memberDao.checkMemberId(id);
	}
	
	public member.model.MemberBean findpwd(member.model.MemberBean m)throws Exception {
		return memberDao.findpwd(m);
	}
	
	public void insertMember(member.model.MemberBean member) throws Exception{
		memberDao.insertMember(member);
	}
	
	public member.model.MemberBean userCheck(String id) throws Exception{
		return memberDao.userCheck(id);		
	}
	
	public void updateMember(member.model.MemberBean member) throws Exception{
		memberDao.updateMember(member);
	}
	
	public void deleteMember(member.model.MemberBean member) throws Exception{
		memberDao.deleteMember(member);
	}
}

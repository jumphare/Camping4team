package camping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import camping.model.msg;
import camping.model.partner;
import camping.model.partner_comment;
import camping.model.pb_join;

@Repository
public class PartnerDAO {

	@Autowired
	private SqlSession session;
	
	public int insert(partner partner) {
		return session.insert("partnerns.insert", partner);
	}
	
	public int getCount() {
		return session.selectOne("partnerns.count");
	}
	
	public List<partner> getPBList(int page){
		return session.selectList("partnerns.pbList", page);
	}
	
	public void updatecount(int par_no) {
		session.update("partnerns.hit", par_no);
	}
	
	public partner getBoard(int par_no) {
		return session.selectOne("partnerns.content", par_no);
	}
	
	public int delete(int par_no) {
		return session.delete("partnerns.delete", par_no);
	}
	
	public int update(partner partner) {
		return session.update("partnerns.update", partner);
	}

	public int join(pb_join pb_join) {
		return session.insert("partnerns.join", pb_join);
	}

	public int cancel(pb_join pb_join) {
		return session.delete("partnerns.cancel", pb_join);
	}
	
	public int pb_count(int par_no) {
		return session.update("partnerns.pb_count", par_no);
	}

	public int chkID(pb_join pb_join) {
		return session.selectOne("partnerns.chkID", pb_join);
	}
	
	public int pb_discount(int par_no) {
		return session.update("partnerns.pb_discount", par_no);
	}

	public List<pb_join> getJoinList(int par_no) {
		return session.selectList("partnerns.getJoinList", par_no);
	}
	
	public void sendJmsg(msg msg) {
		session.insert("partnerns.sendJmsg", msg);
	}

	public List<partner_comment> getPcList(int par_no) {
		return session.selectList("partnerns.getPcList", par_no);
	}

	public int pcinsert(partner_comment pc) {
		// TODO Auto-generated method stub
		return session.insert("partnerns.pcinsert", pc);
	}

	public int pcdelete(int com_no) {
		return session.delete("partnerns.pcdelete", com_no);
	}
	
}

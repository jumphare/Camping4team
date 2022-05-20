package camping.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import camping.model.msg;

@Repository
public class msgDAO {
	@Autowired
	private SqlSession session;
	
	public void sendmsg(msg msg) {
		session.insert("msgns.sendmsg", msg);
	}
	public List<msg> recvlist(msg msg){
		return session.selectList("msgns.recvlist", msg);
	}
	public List<msg> sendlist(msg msg){
		return session.selectList("msgns.sendlist", msg);
	}
	public int allcnt_rd(String recv_id) {
		return session.selectOne("msgns.allcnt_rd", recv_id);
	}
	public int allcnt_sd(String id) {
		return session.selectOne("msgns.allcnt_sd", id);
	}
	public int msgcnt(String id) {
		return session.selectOne("msgns.msgcnt", id);
	}
	public msg msgdetail(int msg_no) {
		return session.selectOne("msgns.msgdetail", msg_no);
	}
	public void msgchk(int msg_no) {
		session.update("msgns.msgchk", msg_no);
	}
	public int delmsg_rd(int msg_no) {
		return session.update("msgns.del_rd", msg_no);
	}
	public int delmsg_sd(int msg_no) {
		return session.update("msgns.del_sd", msg_no);
	}
	public int delmsg(int msg_no) {
		return session.delete("msgns.delmsg", msg_no);
	}
}


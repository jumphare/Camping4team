package camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import camping.dao.msgDAO;
import camping.model.msg;

@Service
public class msgService {
	@Autowired
	private msgDAO dao;
	
	//전송
	public void sendmsg(msg msg) {
		dao.sendmsg(msg);
	}
	//받은 쪽지 목록
	public List<msg> recvlist(msg msg){
		return dao.recvlist(msg);
	}
	//보낸 쪽지 목록
	public List<msg> sendlist(msg msg){
		return dao.sendlist(msg);
	}
	//받은 쪽지 카운트
	public int allcnt_rd(String recv_id) {
		return dao.allcnt_rd(recv_id);
	}
	//보낸 쪽지 카운트
	public int allcnt_sd(String id) {
		return dao.allcnt_sd(id);
	}
	//미열람 쪽지 카운트
	public int msgcnt(String id) {
		return dao.msgcnt(id);
	}
	//쪽지 정보
	public msg msgdetail(int msg_no) {
		return dao.msgdetail(msg_no);
	}
	//읽음 체크
	public void msgchk(int msg_no) {
		dao.msgchk(msg_no);
	}
	//쪽지 삭제
	public int delmsg(int msg_no, String id) {
		int result=0;
		msg msg=dao.msgdetail(msg_no);
		String recv_id=msg.getRecv_id();
		//1. 받은 메시지 삭제 (recv_id=본인)
		if(recv_id.equals(id))
			result=dao.delmsg_rd(msg_no);
		//2. 보낸 메시지 삭제 (id=본인 && 읽은 메시지)
		else if(msg.getMsg_check()==1)
			result=dao.delmsg_sd(msg_no);
		//(id=본인 && 상대가 읽지 않은 메시지)
		else
			result=dao.delmsg(msg_no);
		return result;
	}
	public int checkId(String id) {
		return dao.checkId(id);
	}
}

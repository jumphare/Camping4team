package camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import camping.dao.PartnerDAO;
import camping.model.partner;
import camping.model.pb_join;

@Service
public class PartnerService {

	@Autowired
	private PartnerDAO PBdao;
	
	public int insert(partner partner) {
		return PBdao.insert(partner);
	}
	
	public int getCount() {
		return PBdao.getCount();
	}
	
	public List<partner> getPBList(int page){
		return PBdao.getPBList(page);
	}
	
	public void updatecount(int par_no) {
		PBdao.updatecount(par_no);
	}
	
	public partner getBoard(int par_no) {
		return PBdao.getBoard(par_no);
	}
	
	public int delete(int par_no) {
		return PBdao.delete(par_no);
	}
	
	public int update(partner partner) {
		return PBdao.update(partner);
	}

	public int join(pb_join pb_join) {
		return PBdao.join(pb_join);
	}
	
	public int pb_count(int par_no) {
		return PBdao.pb_count(par_no);
	}

	public void cancel(int par_no) {
		PBdao.cancel(par_no);
	}

	public int chkID(pb_join pb_join) {
		return PBdao.chkID(pb_join);
	}
}

package camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import camping.dao.PartnerDAO;
import camping.model.partner;

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
}

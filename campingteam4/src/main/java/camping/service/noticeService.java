package camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import camping.dao.noticeDAO;
import camping.model.notice;

@Service
public class noticeService {

	@Autowired
	private noticeDAO dao;
	
	public int insert(notice not) {
		return dao.insert(not);
	}
	
	public int getCount() {
		return dao.getCount();
	}
	
	public List<notice> getBoardList(int page) {
		return dao.getBoardList(page);
	}
	
	public List<notice> getBoardNotiList(int page) {
		return dao.getBoardNotiList(page);
	}
	
	
	public notice getBoard(int not_no) {
		return dao.getBoard(not_no);
	}
	
	public int update(notice board) {
		return dao.update(board);
	}
	
	public int delete(int not_no) {
		return dao.delete(not_no);
	}
	

}

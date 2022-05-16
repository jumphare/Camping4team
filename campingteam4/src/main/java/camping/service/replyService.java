package camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import camping.dao.replyDAO;
import camping.model.review_reply;
@Service
public class replyService {
	@Autowired
	private replyDAO dao;
	
	// 리스트 출력
		public List<review_reply> readreply(int re_no) {
			return dao.readreply(re_no);
		}

}

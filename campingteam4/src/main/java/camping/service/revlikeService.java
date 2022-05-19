package camping.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import camping.dao.revlikeDAO;
import camping.model.revlike;

@Service
public class revlikeService {
	@Autowired
	private revlikeDAO dao;

		//좋아요 추가
		public int insert(revlike rl) {
			return dao.insert(rl);
		}
		
		//좋아요 삭제
		public int delete(revlike rl) {
			return dao.delete(rl);
		}
		

}

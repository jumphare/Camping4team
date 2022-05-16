package camping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import camping.dao.ReviewDAO;
import camping.model.review;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO dao;

	// 글작성
	public int insert(review review) {
		return dao.insert(review);
	}

	// 글 총개수
	public int getCount() {
		return dao.getCount();
	}

	// 리스트 출력
	public List<review> reList(int page) {
		return dao.reList(page);
	}

	// 장소출력
	public List<review> splist() {
		return dao.splist();
	}

	// 조회수 증가(값을 돌려주지 않기 때문에 void로 반환)
	public void updatecount(int re_no) {
		dao.updatecount(re_no);
	}

	// 보드 상세
	public review reviewdetail(int re_no) {
		return dao.reviewdetail(re_no);
	}

	public String spname(int res_no) {
			return dao.spname(res_no);
			
		}
	//보드수정
	public int update(review review) {
		return dao.update(review);
	}
}
package camping.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.validator.constraints.ParameterScriptAssert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import camping.model.review;
import camping.model.review_reply;
import camping.model.revlike;

@Controller
public class reviewController {

	@Autowired
	private camping.service.ReviewService service;
 
	// 글작성 폼
	@RequestMapping("re_insertform.do")
	public String re_insertform(int res_no,int sp_no, Model model) {
		

		String sp_name=service.getspname(sp_no);
		model.addAttribute("sp_name", sp_name);
		model.addAttribute("res_no", res_no);
		return "review/reviewinsertform";
	}

	// 글작성
	@RequestMapping("re_insert.do")
	public String re_insert(@RequestParam("re_file1") MultipartFile mf, review review, 
			HttpServletRequest request, HttpSession session, Model model) {
		int score = review.getScore();
		System.out.println("score"+score);
		String id = (String) session.getAttribute("id");

		System.out.println("content"+review.getContent());
		//대표이미지
		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize();
		String path = request.getRealPath("reviewupload");
		String file[] = new String[2];
		
		int result = 0;
		//이미지 등록
		String newfilename = "";
		if (filename != null) { // 첨부파일이 전송된 경우

			// 파일 중복문제 해결
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			System.out.println("extension:" + extension);

			UUID uuid = UUID.randomUUID();

			newfilename = uuid.toString() + extension;
			System.out.println("newfilename:" + newfilename);

			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken(); // 파일명 Koala
			file[1] = st.nextToken(); // 확장자 jpg

			if (size > 1000000) { // 1000KB
				result = 1;
				model.addAttribute("result", result);

				return "review/fileresult";

			} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {

				result = 2;
				model.addAttribute("result", result);

				return "review/fileresult";
			}
		}
		if (size > 0) { // 첨부파일이 전송된 경우
		
				try {
					mf.transferTo(new File(path + "/" + newfilename));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		//-----------------------------
		review.setRe_file(newfilename);
		//임시 dto 저장
		review.setRe_file2("22");
		
		if (id == null) {

			result = 2;
			return "review/reviewinsert";

		} else {
			review.setId(id);

			result = service.insert(review);
			System.out.println("result :" + result);

			model.addAttribute("result", result);

			return "review/reviewinsert";
		}
	}

	// 글목록
	@RequestMapping("reviewlist.do")
	public String reviewlist(HttpServletRequest request, HttpSession session, Model model) {

		String id = (String) session.getAttribute("id");

		System.out.println("id" + id);
		
		//리스트에 좋아요 수 출력
		service.getlike();
		

		int page = 1; // 페이지 초기값
		int limit = 10; // 한화면에 나올 데이터 개수 정의
 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		// int startRow = (page - 1)*limit +1;
		// int endRow = page * limit;

		int listcount = service.getCount();
		System.out.println("총 개수 : " + listcount);

		List<review> relist = service.reList(page); // Dao까지 두개의 값을 전달할 수 있지만 mybatise는 한개만 전달가능
		System.out.println("relist : " + relist);

		

		// 총 페이지 수
		int pageCount = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

		int startPage = ((page - 1) / 10) * limit + 1; // 1, 11, 21....
		int endPage = startPage + 10 - 1; // 10,20,30.......

		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("page", page);
		model.addAttribute("relist", relist);
		model.addAttribute("listcount", listcount);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		return "review/reviewlist";
	}

	// 상세 페이지 : 조회수 1 증가 + 상세정보 구하기
	@RequestMapping("reviewdetail.do")
	public String reviewdetail(@RequestParam int re_no, @RequestParam int page, String ch, HttpSession session, Model model) {

		String id = (String) session.getAttribute("id");
		System.out.println("id=" + id);

		if(ch != null) {
			service.updatecount(re_no); // 조회수 1 증가
		}

		review review = service.reviewdetail(re_no); // 상세정보 구하기
		
		int res_no = review.getRes_no();

		List<review_reply> list = service.replylist(re_no);

		String spname = service.spname(res_no);
		
		int likecount = service.likecount(re_no);
		System.out.println("likecount"+likecount);

		revlike rl = new revlike();
		
		rl.setId(id);
		rl.setRe_no(re_no);
		
		int likecheck = service.likecheck(rl);
		
		model.addAttribute("likecheck", likecheck);
		model.addAttribute("likecount", likecount);
		model.addAttribute("id", id);
		model.addAttribute("re_no", re_no);
		model.addAttribute("list", list);
		model.addAttribute("review", review);
		model.addAttribute("spname", spname);
		model.addAttribute("page", page);

		return "review/reviewdetail";
	}

	// 수정 폼
	@RequestMapping("reviewupdateform.do")
	public String reviewupdateform(int re_no, int page, Model model) {
		review review = service.reviewdetail(re_no);

		model.addAttribute("review", review);
		model.addAttribute("page", page);

		return "review/reviewupdateform";
	}

	// 수정
	@RequestMapping("reviewupdate.do")
	public String reviewupdate(@RequestParam("re_file1") MultipartFile mf, review review, 
			HttpServletRequest request, int page, Model model) {
//				review old = service.getBoard(board.getNo());
//				if(old.getPasswd().equals(board.getPasswd())) {
//					result = service.update(board);
//				}else {
//					result = -1;
//				}
		//대표이미지
				String filename = mf.getOriginalFilename();
				int size = (int) mf.getSize();
				String path = request.getRealPath("reviewupload");
				String file[] = new String[2];
				
				int result = 0;
				//이미지 등록
				String newfilename = "";
				if (filename != null) { // 첨부파일이 전송된 경우

					// 파일 중복문제 해결
					String extension = filename.substring(filename.lastIndexOf("."), filename.length());
					System.out.println("extension:" + extension);

					UUID uuid = UUID.randomUUID();

					newfilename = uuid.toString() + extension;
					System.out.println("newfilename:" + newfilename);

					StringTokenizer st = new StringTokenizer(filename, ".");
					file[0] = st.nextToken(); // 파일명 Koala
					file[1] = st.nextToken(); // 확장자 jpg

					if (size > 1000000) { // 1000KB
						result = 1;
						model.addAttribute("result", result);

						return "review/fileresult";

					} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {
 
						result = 2;
						model.addAttribute("result", result);

						return "review/fileresult";
					}
				}
				if (size > 0) { // 첨부파일이 전송된 경우
				
						try {
							mf.transferTo(new File(path + "/" + newfilename));
						} catch (IllegalStateException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
				}
				
				review.setRe_file(newfilename);
				//임시 dto 저장
				review.setRes_no(0);
				review.setRe_file2("22");
				
		System.out.println("reno" + review.getRe_no());
		System.out.println("sub" + review.getSubject());
		System.out.println("con" + review.getContent());
		System.out.println("scor" + review.getScore());
		System.out.println("c첨" + review.getRe_file());
//		System.out.println("c첨2" + review.getRe_file2());

		result = service.update(review);

		model.addAttribute("result", result);
		model.addAttribute("review", review);
		model.addAttribute("page", page);

		return "review/updateresult";
	}

	// 글삭제

	@RequestMapping("reviewdeleteform.do")
	public String reviewdelete(int re_no, int page, Model model) {
		
		int result = service.delete(re_no);
		
		model.addAttribute("result", result);
		model.addAttribute("page", page);
		
		return "review/reviewdelete";
		
	}
	
	//내 리뷰 목록
	@RequestMapping("myreviewlist.do") 
	public String myreviewlist(HttpServletRequest request, HttpSession session, Model model) {

		String id = (String) session.getAttribute("id");

		System.out.println("id" + id);
		
		//리스트에 좋아요 수 출력
		service.getlike();
		
        review rv = new review();
        
		int page = 1; // 페이지 초기값
		int limit = 10; // 한화면에 나올 데이터 개수 정의
 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		// int startRow = (page - 1)*limit +1;
		// int endRow = page * limit;

		rv.setPage(page);
		rv.setId(id);
		
		int listcount = service.getCount();
		System.out.println("총 개수 : " + listcount);

		List<review> mylist = service.myList(rv); // Dao까지 두개의 값을 전달할 수 있지만 mybatise는 한개만 전달가능
		System.out.println("mylist : " + mylist);

		// 총 페이지 수
		int pageCount = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

		int startPage = ((page - 1) / 10) * limit + 1; // 1, 11, 21....
		int endPage = startPage + 10 - 1; // 10,20,30.......

		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("rv", rv);
		model.addAttribute("page", page);
		model.addAttribute("mylist", mylist);
		model.addAttribute("listcount", listcount);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		return "review/myreviewlist";
	}

}

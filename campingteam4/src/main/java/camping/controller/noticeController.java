package camping.controller;

import java.io.File;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import camping.model.notice;
import camping.service.noticeService;

@Controller
public class noticeController {
	@Autowired
	private noticeService service;

	@RequestMapping("noticeform.do")
	public String noticeform() {
		return "notice/noticeform";
	}

	@RequestMapping("noticeInsert.do")
	public String noticeInsert(@RequestParam("not_file1") MultipartFile mf, notice not, HttpServletRequest request,
			Model model) throws Exception {

		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize(); // 첨부파일의 크기 (단위:Byte)

		String path = request.getRealPath("upload");
		System.out.println("path:" + path);

		String file[] = new String[2];
		String newfilename = "";
		int result = 0;

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

			if (size > 100000) { // 100KB
				result = 1;
				model.addAttribute("result", result);

				return "notice/uploadResult";

			} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {

				result = 2;
				model.addAttribute("result", result);

				return "notice/uploadResult";
			}
		}

		if (size > 0) { // 첨부파일이 전송된 경우

			mf.transferTo(new File(path + "/" + newfilename));

		}

		not.setNot_file(newfilename);

		int result1 = service.insert(not);

		model.addAttribute("result", result1);

		return "notice/insertResult";
	}

	@RequestMapping("noticelist.do")
	public String noticelist(HttpServletRequest request, Model model) {

		
		 /*  User user = (User) authentication.getPrincipal();

		/*
		HttpSession session = request.getSession();
		session.setAttribute("sessionId",session.getId());
		*/
	

		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startRow = (page - 1) * limit + 1;
		int endRow = page * limit;

		int listcount = service.getCount();
		System.out.println("listcount:" + listcount);

		List<notice> noticelist = service.getBoardList(page);
		List<notice> notiList = service.getBoardNotiList(page);
		
		System.out.println("notiList===>" + notiList);

		// 총페이지수
		int pageCount = listcount / limit + ((listcount % limit == 0) ? 0 : 1);

		int startPage = ((page - 1) / 10) * limit + 1; // 1, 11, 21...
		int endPage = startPage + 10 - 1; // 10, 20, 30..

		if (endPage > pageCount)
			endPage = pageCount;

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("notiList", notiList);		
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);

		return "notice/noticelist";
		
	}

	// 상세 페이지 : 조회수 1증가 + 상세 정보 구하기
	@RequestMapping("noticecontent.do")
	public String noticecontent(int not_no, int page, Model model) {

		notice board = service.getBoard(not_no); // 상세 정보 구하기
		String content = board.getContent().replace("\n", "<br>");
		
		String noti_flag = board.getNoti_flag();		
		
		
		System.out.println("board===>" + board);
		
		System.out.println("noti_flag===>" + noti_flag);

		model.addAttribute("board", board);
		model.addAttribute("content", content);
		model.addAttribute("page", page);

		return "notice/noticecontent";
	}

	// 수정 폼
	@RequestMapping("noticeupdateform.do")
	public String noticeupdateform(int not_no, int page, Model model) {

		notice board = service.getBoard(not_no); // 상세 정보 구하기
		System.out.println("상세정보:" + board);

		model.addAttribute("board", board);
		model.addAttribute("page", page);

		return "notice/noticeupdateform";
	}

	// 글수정
	@RequestMapping("noticeupdate.do")
	public String noticeupdate(@RequestParam("not_file1") MultipartFile mf, 
						       notice not, 
						       int page,
						       HttpServletRequest request,
						       Model model) throws Exception {

		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize(); // 첨부파일의 크기 (단위:Byte)

		String path = request.getRealPath("upload");
		System.out.println("path:" + path);

		String file[] = new String[2];
		String newfilename = "";
		int result = 0;

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

			if (size > 100000) { // 100KB
				result = 1;
				model.addAttribute("result", result);

				return "notice/uploadResult";

			} else if (!file[1].equals("jpg") && !file[1].equals("gif") && !file[1].equals("png")) {

				result = 2;
				model.addAttribute("result", result);

				return "notice/uploadResult";
			}
		}

		if (size > 0) { // 첨부파일이 전송된 경우
			mf.transferTo(new File(path + "/" + newfilename));
		}

		notice board = service.getBoard(not.getNot_no()); // 상세 정보 구하기
		
		if(filename != "") {		// 첨부파일 수정한 경우
			not.setNot_file(newfilename);
		}else {						// 첨부파일 수정하지 않은 경우
			not.setNot_file(board.getNot_file());
		}

		int result1 = service.update(not);

		model.addAttribute("result", result1);
		model.addAttribute("board", not);
		model.addAttribute("page", page);
		
		return "notice/updateResult";
	}

	// 삭제 
	@RequestMapping("noticedeleteform.do")
	public String noticedeleteform(int not_no, int page, Model model) {
		
		int result = service.delete(not_no);
		model.addAttribute("result", result);
		model.addAttribute("page", page);
		
		return "notice/deleteResult";
	}

}

package camping.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



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
	//다중 파일 업로드!
	// 글작성 폼
		@RequestMapping("/smart_img.do")
		public String smart_img(HttpServletResponse response,HttpServletRequest request, Model model) {
			
			//--다중이미지 업로드!!!!!!!!!!!!!!
			try {
				 //파일정보
				 String sFileInfo = "";
				 //파일명을 받는다 - 일반 원본파일명
				 String filename = request.getHeader("file-name");
				 //파일 확장자
				 String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
				 //확장자를소문자로 변경
				 filename_ext = filename_ext.toLowerCase();
				 	
				 //이미지 검증 배열변수
				 String[] allow_file = {"jpg","png","bmp","gif"};

				 //돌리면서 확장자가 이미지인지 
				 int cnt = 0;
				 for(int i=0; i<allow_file.length; i++) {
				 	if(filename_ext.equals(allow_file[i])){
				 		cnt++;
				 	}
				 }

				 //이미지가 아님
				 if(cnt == 0) {
					 PrintWriter print = response.getWriter();
					 print.print("NOTALLOW_"+filename);
					 print.flush();
					 print.close();
				 } else {
				 //이미지이므로 신규 파일로 디렉토리 설정 및 업로드	
				 //파일 기본경로
				 //파일 기본경로 _ 상세경로
				 String filePath = request.getRealPath("reviewupload");
				 System.out.println("filepath"+filePath);
				 String path = filePath;
				 System.out.println("path"+path);
				 
				 File file = new File(path);
				 if(!file.exists()) {
				 	file.mkdirs();
				 }
				 String realFileNm = "";
				 SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				 String today= formatter.format(new java.util.Date());
				 realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
				 String rlFileNm = filePath +"/"+ realFileNm;
				 ///////////////// 서버에 파일쓰기 ///////////////// 
				 InputStream is = request.getInputStream();
				 OutputStream os=new FileOutputStream(rlFileNm);
				 int numRead;
				 byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
				 while((numRead = is.read(b,0,b.length)) != -1){
				 	os.write(b,0,numRead);
				 }
				 if(is != null) {
				 	is.close();
				 }
				 os.flush();
				 os.close();
				 ///////////////// 서버에 파일쓰기 /////////////////

				 // 정보 출력
				 sFileInfo += "&bNewLine=true";
				 // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
				 sFileInfo += "&sFileName="+ filename;;
				 sFileInfo += "&sFileURL="+"/reviewupload/"+realFileNm;
				 PrintWriter print = response.getWriter();
				 print.print(sFileInfo);
				 print.flush();
				 print.close();
				 }	
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
	 }
			
			
//			String path = request.getRealPath("reviewupload");
//			List<MultipartFile> imagelist = mf2.getFiles("Filedata");
//			String newfilename2 = "";
//			String spot_image2 = "";
//			 for (MultipartFile mf1 : imagelist) {
//		            newfilename2 = mf1.getOriginalFilename(); // 원본 파일 명
//		            long fileSize = mf1.getSize(); // 파일 사이즈
//
//		            System.out.println("originFileName : " + newfilename2);
//		            System.out.println("fileSize : " + fileSize);
//		            
//		            
//		            String safeFile2 = System.currentTimeMillis() + newfilename2;
//		            spot_image2 += safeFile2 + "-";
//		            
//		            try {
//		                mf1.transferTo(new File(path + "/" + safeFile2));
//		            } catch (IllegalStateException e) {
//		                // TODO Auto-generated catch block
//		                e.printStackTrace();
//		            } catch (IOException e) {
//		                // TODO Auto-generated catch block
//		                e.printStackTrace();
//		            }
//		        }
//			
//			//-----------------------------
//			
//			return "review/reviewinsertform";
//		}
	// 글작성
	@RequestMapping("re_insert.do")
	public String re_insert(@RequestParam("re_file1") MultipartFile mf,review review, 
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

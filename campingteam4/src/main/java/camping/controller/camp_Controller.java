package camping.controller;


import java.io.File;
import java.io.IOException;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import camping.model.camp_select;
import camping.model.spot;
import camping.service.camp_service;





@Controller
public class camp_Controller {
	@Autowired
	private camp_service camp_service;
	
	//임의 메인 페이지 - 로그인 세션 공유 위해 생성
	@RequestMapping("date_sel.do")
	public String date_sel(HttpServletRequest request, Model model){
		System.out.println("컨트롤러 들어옴");
		HttpSession session=request.getSession();
		session.setAttribute("id", "test");
		return "camp_loc/date_sel";
	}
	//날짜, 인원선택
	@RequestMapping("camp_sel.do")
	public String camp_sel(String startDate, String endDate,String memcount, Model model){
		
		System.out.println("컨트롤러 들어옴");

//		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//		LocalDate startDate =LocalDate.parse(startdate,formatter);
//		LocalDate endDate =LocalDate.parse(enddate,formatter);
		
		
		System.out.println("stday : "+startDate);
		System.out.println("enday : "+endDate);
		System.out.println("memcount : "+memcount);
		
	
		model.addAttribute("memcount",memcount);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
		return "camp_loc/camp_loc_sel";
	}
	//(날짜, 인원선택)+ 지역선택
	@RequestMapping("loc_check.do")
	public String loc_check(String loc, String startDate, String endDate,String memcount, Model model){
		System.out.println("loc : " + loc);
		System.out.println("stday : "+startDate);
		System.out.println("enday : "+endDate);
		System.out.println("memcount : "+memcount);
	
		model.addAttribute("loc", loc);
		model.addAttribute("memcount",memcount);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
		return "camp_loc/camp_type";
	}
	
	//(날짜, 인원선택, 지역선택)+캠핑타입선택 후 그에 맞는 리스트 출력
	@RequestMapping("type_list.do")
	public String type_list(String loc, String type, String startDate, String endDate,String memcount, Model model){	
		
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar cal = Calendar.getInstance(); 
		if(loc==null) {
			loc="서울";
		}
		if(memcount == null) {
			memcount = "2";
		}
		if(startDate == null) {
			cal.add(cal.DATE, +1); //기본으로 내일날짜
			startDate = sf.format(cal.getTime());
			System.out.println("st"+startDate);
		}
		if(endDate == null) {
			cal.add(cal.DATE, +2); //기본으로 내일모레날짜
			endDate = sf.format(cal.getTime());
			System.out.println("et"+endDate);
		}
		
		//장소별 별점 평균값 계산
		 camp_service.staravg();
		
		
	    	camp_select camsel = new camp_select();
	    	camsel.setStartDate(startDate);
	    	camsel.setEndDate(endDate);
			camsel.setLoc(loc);
			camsel.setMemcount(Integer.parseInt(memcount));
			camsel.setType(type);
			System.out.println("loc : " + camsel.getLoc());
			System.out.println("type : " + camsel.getType());
			System.out.println("stday : "+camsel.getStartDate());
			System.out.println("enday : "+camsel.getEndDate());
			System.out.println("memcount : "+camsel.getMemcount());
			
			camp_service.resetcheck();	//체크 초기화 작업
			System.out.println("초기화 실행");
			camp_service.resevcheck(camsel);//장소가 같은 예약에서 날짜가 겹치는 날짜가 있을 시 값 1 대입
			System.out.println("1 대입");
			
			List<spot> spotlist = camp_service.camplist(camsel);
			System.out.println("spotlist"+spotlist);
			
			model.addAttribute("camsel", camsel);
			model.addAttribute("memcount",memcount);
			model.addAttribute("spotlist", spotlist);
			model.addAttribute("loc", loc);
			model.addAttribute("type", type);
			
	     return "camp_loc/camp_list";
		
	}
	//관리자 캠핑장 리스트
		@RequestMapping("admin_camp_list.do")
		public String admin_camp_list(Model model){	
			
		 
				List<spot> spotlist = camp_service.admin_camplist();
				System.out.println("spotlist"+spotlist);
				
			
				model.addAttribute("spotlist", spotlist);

		     return "camp_loc/admin_camp_list";
			
		}
	//캠핑스팟 등록 폼
	@RequestMapping("spotwriteform.do")
	public String spotwriteform() {
		return "camp_loc/spot_write";	//이렇게만 작성해도 넘어간다~
	}
	
	//캠핑스팟 등록
	@RequestMapping("spotwrite.do")
	public String spotwrite(@RequestParam("image1") MultipartFile mf1,
							MultipartHttpServletRequest mf2,
							spot spot,
							HttpServletRequest request,
							Model model) {
		//--------대표이미지
		String filename1 = mf1.getOriginalFilename();
		int size = (int)mf1.getSize();
		//--------추가 이미지
		List<MultipartFile> imagelist = mf2.getFiles("imagelist");
		
		String path = request.getRealPath("campupload");
		int result = 0;

		String file1[] = new String[2];
//		file = filename.split(".");
//		System.out.println(file.length);
//		System.out.println("file0="+file[0]);
//		System.out.println("file1="+file[1]);
//-------------대표이미지
		String newfilename1 = "";
		if (filename1 != null) { // 첨부파일이 전송된 경우

			// 파일 중복문제 해결
			String extension = filename1.substring(filename1.lastIndexOf("."), filename1.length());
			System.out.println("extension:" + extension);

			UUID uuid = UUID.randomUUID();

			newfilename1 = uuid.toString() + extension;
			System.out.println("newfilename:" + newfilename1);

			StringTokenizer st = new StringTokenizer(filename1, ".");
			file1[0] = st.nextToken(); // 파일명 Koala
			file1[1] = st.nextToken(); // 확장자 jpg

			if (size > 1000000) { // 1000KB
				result = 1;
				model.addAttribute("result", result);

				return "camp_loc/updateResult";

			} else if (!file1[1].equals("jpg") && !file1[1].equals("gif") && !file1[1].equals("png")) {

				result = 2;
				model.addAttribute("result", result);

				return "camp_loc/updateResult";
			}
		}
		if (size > 0) { // 첨부파일이 전송된 경우
		
				try {
					mf1.transferTo(new File(path + "/" + newfilename1));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
//----------추가 이미지
		String newfilename2 = "";
		String spot_image2 = "";
		 for (MultipartFile mf : imagelist) {
	            newfilename2 = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈

	            System.out.println("originFileName : " + newfilename2);
	            System.out.println("fileSize : " + fileSize);
	            
	            
	            String safeFile2 = System.currentTimeMillis() + newfilename2;
	            spot_image2 += safeFile2 + "-";
	            
	            try {
	                mf.transferTo(new File(path + "/" + safeFile2));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }
		spot.setImagedetail(spot_image2);
		spot.setImage(newfilename1);
		
		int insertresult = camp_service.insert(spot);
		System.out.println("result :"+ insertresult);
		
		System.out.println("mf1=" + mf1);
		System.out.println("mf2=" + mf2);
		System.out.println("filename1=" + newfilename1);
		System.out.println("filename2=" + newfilename2);
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		model.addAttribute("result",insertresult);
		
		return "camp_loc/insert_result";
	}
	//캠프 상세
	@RequestMapping("spotview.do")
	public String spotview(String loc, String type, String startDate, String endDate,String memcount, int sp_no, Model model) {
		if(loc == null && type==null) {
			spot spot = camp_service.getspot(sp_no);
			
			String imagedetail = spot.getImagedetail();
			String[] i = imagedetail.split("-");
			
			model.addAttribute("spot",spot);
			model.addAttribute("i", i);
			return "camp_loc/admin_spot_view";
		}else {
		
		camp_select camsel = new camp_select();
    	camsel.setStartDate(startDate);
    	camsel.setEndDate(endDate);
		camsel.setLoc(loc);
		camsel.setMemcount(Integer.parseInt(memcount));
		camsel.setType(type);
		
		spot spot = camp_service.getspot(sp_no);
		String imagedetail = spot.getImagedetail();
		String[] i = imagedetail.split("-");
		
		model.addAttribute("memcount", memcount);
		model.addAttribute("i", i);
		model.addAttribute("camsel",camsel);
		model.addAttribute("spot",spot);
		
		return "camp_loc/spot_view";	//이렇게만 작성해도 넘어간다~
		}
	}
	
	//캠프 수정 폼
	@RequestMapping("spotupdateform.do")
	public String boardupdateform(int sp_no, Model model) {
		spot spot = camp_service.getspot(sp_no);
		
		model.addAttribute("spot",spot);
	
		
		return "camp_loc/spot_update";
	}
	
	//수정
	@RequestMapping("spotupdate.do")
	public String boardupdate(spot spot, Model model) {
		int result = 0;

			result = camp_service.modify(spot);
	
		model.addAttribute("result", result);
		model.addAttribute("spot", spot);
		
		return "camp_loc/modifyresult";
	}
	
	//삭제
			@RequestMapping("spotdelete.do")
			public String spotdeleteform(int sp_no) {
			
				camp_service.delete(sp_no);
				
				
			return "redirect:/admin_camp_list.do";
			}
			
	
}

package camping.model;

import java.util.Date;

public class review {
	private int re_no;/* 글번호 */
	private int res_no; /* 예약번호 */
	private int camp_no; /* 장소번호 */
	private String subject;/* 제목 */
	private String content; /* 내용 */
	private int readcount;/* 조회수 */
	private Date r_date;/* 작성일 */
	private String re_file; /* 첨부 */
	private int score;/* 별점 */
	private int rev_like;/* 좋아요 */
	private String id;/* 아이디 */
	private int del; /* 삭제 */
	
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public int getRes_no() {
		return res_no;
	}
	public void setRes_no(int res_no) {
		this.res_no = res_no;
	}
	public int getCamp_no() {
		return camp_no;
	}
	public void setCamp_no(int camp_no) {
		this.camp_no = camp_no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public String getRe_file() {
		return re_file;
	}
	public void setRe_file(String re_file) {
		this.re_file = re_file;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getRev_like() {
		return rev_like;
	}
	public void setRev_like(int rev_like) {
		this.rev_like = rev_like;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
}

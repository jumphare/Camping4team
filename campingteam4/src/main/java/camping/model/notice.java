package camping.model;

import java.util.Date;

public class notice{
	private String board;     /* 게시판 */
	private String subject;   /* 제목 */
	private String content;   /* 내용 */
	private Date no_date;     /* 날짜 */
	private String not_file;  /* 첨부 */
	private String noti_flag; /* 공지구분 */	
	private int not_no;       /* 글번호 */
	
	public int getNot_no() {
		return not_no;
	}
	public void setNot_no(int not_no) {
		this.not_no = not_no;
	}
	public String getBoard() {
		return board;
	}
	public void setBoard(String board) {
		this.board = board;
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
	public Date getNo_date() {
		return no_date;
	}
	public void setNo_date(Date no_date) {
		this.no_date = no_date;
	}
	public String getNot_file() {
		return not_file;
	}
	public void setNot_file(String not_file) {
		this.not_file = not_file;
	}
	public String getNoti_flag() {
		return noti_flag;
	}
	public void setNoti_flag(String noti_flag) {
		this.noti_flag = noti_flag;
	}
	
	
	

}

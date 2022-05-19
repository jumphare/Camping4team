package camping.model;

import java.util.Date;

public class partner {
		public int getPar_no() {
		return par_no;
	}
	public void setPar_no(int par_no) {
		this.par_no = par_no;
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
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getCamp_area() {
		return camp_area;
	}
	public void setCamp_area(String camp_area) {
		this.camp_area = camp_area;
	}
	public String getCamp_type() {
		return camp_type;
	}
	public void setCamp_type(String camp_type) {
		this.camp_type = camp_type;
	}
	public int getWant_num() {
		return want_num;
	}
	public void setWant_num(int want_num) {
		this.want_num = want_num;
	}
	public int getNow_num() {
		return now_num;
	}
	public void setNow_num(int now_num) {
		this.now_num = now_num;
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
		private int par_no; /* 글번호 */
	    private String subject; /* 제목 */
	    private String content; /* 내용 */
	    private int readcount; /* 조회수*/
	    private Date p_date; /* 작성일 */
	    private Date start_date; /* 시작일 */
	    private Date end_date; /* 종료일 */
	    private String camp_area; /* 캠핑지역 */
	    private String camp_type; /* 캠핑종류 */
	    private int want_num; /* 동행인원 */
	    private int now_num; /* 현재인원  */
	    private String id; /* 아이디 */
	    private int del; /* 삭제 */
}

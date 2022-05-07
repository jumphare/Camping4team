package camping.model;

import java.util.Date;

public class partner_comment {
	public int getCom_no() {
		return com_no;
	}
	public void setCom_no(int com_no) {
		this.com_no = com_no;
	}
	public int getPar_no() {
		return par_no;
	}
	public void setPar_no(int par_no) {
		this.par_no = par_no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getC_date() {
		return c_date;
	}
	public void setC_date(Date c_date) {
		this.c_date = c_date;
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
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	private int com_no;/* 댓글번호 */
	private int par_no;/* 글번호 */
	private String content;/* 댓글내용 */
	private Date c_date; /* 작성일 */
	private String id; /* 아이디 */
	private int del; /* 삭제 */
	private int ref;/* REF */
}

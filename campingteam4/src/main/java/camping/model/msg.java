package camping.model;

import java.util.Date;

public class msg {
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRecv_id() {
		return recv_id;
	}
	public void setRecv_id(String recv_id) {
		this.recv_id = recv_id;
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
	public Date getMsg_date() {
		return msg_date;
	}
	public void setMsg_date(Date msg_date) {
		this.msg_date = msg_date;
	}
	public int getMsg_check() {
		return msg_check;
	}
	public void setMsg_check(int msg_check) {
		this.msg_check = msg_check;
	}
	private String id; /* 발신자 */
	private String recv_id; /* 수신자 */
	private String subject;/* 제목 */
	private String content; /* 내용 */
	private Date msg_date; /* 날짜 */
	private int msg_check; /* 쪽지 확인 */
}

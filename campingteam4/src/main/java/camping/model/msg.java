package camping.model;

import java.util.Date;

public class msg {
	private String id; /* 발신자 */
	private String recv_id; /* 수신자 */
	private String content; /* 내용 */
	private Date msg_date; /* 날짜 */
	private int msg_check; /* 쪽지 확인 */
	private int read_st;   /*받은쪽지 상태 */
	private int recv_st;  /*보낸쪽지 상태*/
	private int msg_no;  /*PK*/
	
	private int startRow;
	private int endRow;
	
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
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
	public int getRead_st() {
		return read_st;
	}
	public void setRead_st(int read_st) {
		this.read_st = read_st;
	}
	public int getRecv_st() {
		return recv_st;
	}
	public void setRecv_st(int recv_st) {
		this.recv_st = recv_st;
	}
	public int getMsg_no() {
		return msg_no;
	}
	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}

}

package camping.model;

import java.util.Date;

public class chat {
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
	public Date getChat_date() {
		return chat_date;
	}
	public void setChat_date(Date chat_date) {
		this.chat_date = chat_date;
	}
	private String id; /* 발신자 */
	private String recv_id; /* 수신자 */
	private String content; /* 내용 */
	private Date chat_date; /* 날짜 */
}

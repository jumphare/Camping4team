package camping.model;

import java.util.Date;

public class reservation {
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
	public int getSp_no() {
		return sp_no;
	}
	public void setSp_no(int sp_no) {
		this.sp_no = sp_no;
	}
	public int getEq_no() {
		return eq_no;
	}
	public void setEq_no(int eq_no) {
		this.eq_no = eq_no;
	}
	public Date getRes_date() {
		return res_date;
	}
	public void setRes_date(Date res_date) {
		this.res_date = res_date;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	private int res_no; /* 예약번호 */
	private int camp_no; /* 장소번호 */
	private int sp_no; /* 자리번호 */
	private int eq_no; /* 장비번호 */
	private Date res_date; /* 예약일 */
	private Date start_date; /* 시작일 */
	private Date end_date; /* 종료일 */
	private int num; /* 인원 */
	private int price; /* 총가격 */
	private int payment; /* 결제여부 */
	private int state; /* 예약상태 */
	private String id; /* 아이디 */
}

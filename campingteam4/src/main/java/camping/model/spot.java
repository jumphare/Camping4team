package camping.model;

public class spot {
	public int getSp_no() {
		return sp_no;
	}
	public void setSp_no(int sp_no) {
		this.sp_no = sp_no;
	}
	public int getCamp_no() {
		return camp_no;
	}
	public void setCamp_no(int camp_no) {
		this.camp_no = camp_no;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getStandard_num() {
		return standard_num;
	}
	public void setStandard_num(int standard_num) {
		this.standard_num = standard_num;
	}
	public int getMax_num() {
		return max_num;
	}
	public void setMax_num(int max_num) {
		this.max_num = max_num;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	private int sp_no; /* 자리번호 */
	private int camp_no; /* 장소번호 */
	private String type; /* 종류 */
	private int standard_num;/* 기준인원 */
	private int max_num; /* 최대인원 */
	private int price; /* 가격 */
	private String memo; /* 소개 */
}

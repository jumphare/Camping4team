package camping.model;

public class equipment {
	public int getEq_no() {
		return eq_no;
	}
	public void setEq_no(int eq_no) {
		this.eq_no = eq_no;
	}
	public int getCamp_no() {
		return camp_no;
	}
	public void setCamp_no(int camp_no) {
		this.camp_no = camp_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	private int eq_no; /* 장비번호 */
	private int camp_no; /* 장소번호 */
	private String name;/* 장비명 */
	private int price; /* 가격 */
	private int num; /* 개수 */
}

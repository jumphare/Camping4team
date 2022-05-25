package camping.model;

public class camp_loc {
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
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getLoc_lat() {
		return loc_lat;
	}
	public void setLoc_lat(int loc_lat) {
		this.loc_lat = loc_lat;
	}
	public int getLoc_long() {
		return loc_long;
	}
	public void setLoc_long(int loc_long) {
		this.loc_long = loc_long;
	}
	public String getContact() {
		return Contact;
	}
	public void setContact(String contact) {
		Contact = contact;
	}
	public String getCamp_file() {
		return camp_file;
	}
	public void setCamp_file(String camp_file) {
		this.camp_file = camp_file;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}

	private int camp_no; /* 장소번호 */
	private String name; /* 이름 */
	private String area; /* 지역 */
	private String address; /* 주소 */
	private int loc_lat; /* 위도 */
	private int loc_long; /* 경도 */
	private String Contact;/* 연락처 */
	private String camp_file;/* 첨부 */
	private String memo; /* 소개 */
}

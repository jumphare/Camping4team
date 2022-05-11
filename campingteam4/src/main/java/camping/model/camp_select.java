package camping.model;

import java.util.Date;

public class camp_select {
	private String loc;
	private String type;
	private String startDate; 
	private String endDate;
	private int memcount;
	private int sp_no;
	public int getSp_no() {
		return sp_no;
	}
	public void setSp_no(int sp_no) {
		this.sp_no = sp_no;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getMemcount() {
		return memcount;
	}
	public void setMemcount(int memcount) {
		this.memcount = memcount;
	}
}

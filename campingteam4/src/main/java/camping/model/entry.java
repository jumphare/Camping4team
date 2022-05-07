package camping.model;

public class entry {
	public int getPar_no() {
		return par_no;
	}
	public void setPar_no(int par_no) {
		this.par_no = par_no;
	}
	public int getEntry() {
		return entry;
	}
	public void setEntry(int entry) {
		this.entry = entry;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	private int par_no; /* 글번호 */
	private int entry; /* 참가여부 */
	private String id;/* 신청자 */
}

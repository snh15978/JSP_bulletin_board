package set;

import java.sql.Timestamp;

public class SetDTO {
	
	private int idx;
	private String src;
	private String fixed;
	private String userfixed;
	private String userList;
	private String division;
	private Timestamp fixedTime;
	private String lastFixer;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getFixed() {
		return fixed;
	}
	public void setFixed(String fixed) {
		this.fixed = fixed;
	}
	public String getUserFixed() {
		return userfixed;
	}
	public void setUserFixed(String fixed) {
		this.userfixed = fixed;
	}
	public String getUserList() {
		return userList;
	}
	public void setUserList(String userList) {
		this.userList = userList;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	
	public Timestamp getFixedTime() {
		return fixedTime;
	}
	public void setFixedTime(Timestamp fixedTime) {
		this.fixedTime = fixedTime;
	}
	
	public SetDTO() {
		
	}
	
	public SetDTO(int idx, String src, String fixed, String userfixed, String userList, String division, Timestamp fixedTime, String lastFixer) {
		super();
		this.idx = idx;
		this.src = src;
		this.fixed = fixed;
		this.userfixed = userfixed;
		this.userList = userList;
		this.division = division;
		this.fixedTime = fixedTime;
		this.lastFixer = lastFixer;
	}
	public String getLastFixer() {
		return lastFixer;
	}
	public void setLastFixer(String lastFixer) {
		this.lastFixer = lastFixer;
	}

	
}

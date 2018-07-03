package page;

public class PageDTO {
	private String division;
	private int totalPageCnt;
	
	
	public String getDivision() {
		return division;
	}
	
	public void setDivision(String division) {
		this.division = division;
	}
	
	public int getTotalPageCnt() {
		return totalPageCnt;
	}
	
	public void setTotalPageCnt(int totalPageCnt) {
		this.totalPageCnt = totalPageCnt;
	}
	
	public PageDTO(String division, int totalPageCnt) {
		super();
		this.division = division;
		this.totalPageCnt = totalPageCnt;
	}
	
	public PageDTO() {
		
	}
}

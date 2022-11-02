package dto;

public class HouseDeal {
	// xml item 한개가 거래 한개에 해당
	// item 항목 전체중에 필요한 항목만 sax로 걸러냄
	
	// 법정동
	private String dong;
	
	// 아파트 이름
	private String aptName;
	
	// 거래 금액
	private String dealAmount;
	
	// 층
	private int floor;
	
	// 면적
	private String area;
	
	// 법정동시군구코드
	private String bjdsgg;
	
	// 법정동읍면동코드
	private String bjdumd;
	
	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getAptName() {
		return aptName;
	}

	public void setAptName(String aptName) {
		this.aptName = aptName;
	}

	public String getDealAmount() {
		return dealAmount;
	}

	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}

	public String getBjdsgg() {
		return bjdsgg;
	}

	public void setBjdsgg(String bjdsgg) {
		this.bjdsgg = bjdsgg;
	}

	public String getBjdumd() {
		return bjdumd;
	}

	public void setBjdumd(String bjdumd) {
		this.bjdumd = bjdumd;
	}

	@Override
	public String toString() {
		return "HouseDeal [dong=" + dong + ", aptName=" + aptName + ", dealAmount=" + dealAmount + ", floor=" + floor
				+ ", area=" + area + ", bjdsgg=" + bjdsgg + ", bjdumd=" + bjdumd + "]";
	}

}

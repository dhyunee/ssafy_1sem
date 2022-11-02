package dto;

public class AptInfoDto {
	private String num;
	private String aptName;
	private String floor;
	private String area;
	private String dong;
	private String dealAmount;
	private float lat;
	private float lng;
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getAptName() {
		return aptName;
	}
	public void setAptName(String aptName) {
		this.aptName = aptName;
	}
	public String getFloor() {
		return floor;
	}
	public void setFloor(String floor) {
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
	public String getDealAmount() {
		return dealAmount;
	}
	public void setDealAmount(String dealAmount) {
		this.dealAmount = dealAmount;
	}
	public float getLat() {
		return lat;
	}
	public void setLat(float lat) {
		this.lat = lat;
	}
	public float getLng() {
		return lng;
	}
	public void setLng(float lng) {
		this.lng = lng;
	}
	public AptInfoDto(String num, String aptName, String floor, String area, String dong, String dealAmount) {
		super();
		this.num = num;
		this.aptName = aptName;
		this.floor = floor;
		this.area = area;
		this.dong = dong;
		this.dealAmount = dealAmount;
	}
	@Override
	public String toString() {
		return "AptInfoDto [num=" + num + ", aptName=" + aptName + ", floor=" + floor + ", area=" + area + ", dong="
				+ dong + ", dealAmount=" + dealAmount + ", lat=" + lat + ", lng=" + lng + "]";
	}
	
	
	
	
	

}

package com.mycom.myhouse.house.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class HouseDto {
	
	private String no;
	private String aptName;
	private String floor;
	private String area;
	private String dong;
	private String dealAmount;
	private float lat;
	private float lng;

}

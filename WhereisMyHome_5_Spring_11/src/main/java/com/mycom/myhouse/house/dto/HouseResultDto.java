package com.mycom.myhouse.house.dto;

import java.util.List;

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
public class HouseResultDto {
	
	private int result;
	private HouseDto house;
	private List<HouseDto> houseList;

}

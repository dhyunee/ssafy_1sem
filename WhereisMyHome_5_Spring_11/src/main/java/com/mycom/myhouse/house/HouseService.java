package com.mycom.myhouse.house;

import java.util.List;

import com.mycom.myhouse.house.dto.HouseResultDto;
import com.mycom.myhouse.house.dto.PlaceDto;

public interface HouseService {
	
	List<PlaceDto> getSido();
	List<PlaceDto> getGugun(String sido);
	List<PlaceDto> getDong(String gugun);

	// HouseResultDto getHouse(int houseId);
	HouseResultDto getHouseList(String dong);
	
}

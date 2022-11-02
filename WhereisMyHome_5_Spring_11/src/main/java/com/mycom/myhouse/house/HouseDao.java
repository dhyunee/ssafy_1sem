package com.mycom.myhouse.house;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycom.myhouse.house.dto.HouseDto;
import com.mycom.myhouse.house.dto.PlaceDto;

@Mapper
public interface HouseDao {
	
	List<PlaceDto> getSido();
	List<PlaceDto> getGugun(String sido);
	List<PlaceDto> getDong(String gugun);
	
	// HouseDto getHouse(int houseId);
	List<HouseDto> getHouseList(String dong);
	
}

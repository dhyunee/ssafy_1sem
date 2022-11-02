package com.mycom.myhouse.house;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.myhouse.house.dto.HouseDto;
import com.mycom.myhouse.house.dto.HouseResultDto;
import com.mycom.myhouse.house.dto.PlaceDto;

@Service
public class HouseServiceImpl implements HouseService {

	@Autowired
	HouseDao houseDao;
	
	private final int SUCCESS = 1;
	private final int FAIL = -1;

	@Override
	public List<PlaceDto> getSido() {
		return houseDao.getSido();
	}
	
	@Override
	public List<PlaceDto> getGugun(String sido) {
		return houseDao.getGugun(sido);
	}
	
	@Override
	public List<PlaceDto> getDong(String gugun) {
		return houseDao.getDong(gugun);
	}
	
//	@Override
//	public HouseResultDto getHouse(int houseId) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public HouseResultDto getHouseList(String dong) {
		HouseResultDto houseResultDto = new HouseResultDto();
		
		try {
			List<HouseDto> houseList = houseDao.getHouseList(dong);
			houseResultDto.setHouseList(houseList);
			houseResultDto.setResult(SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			houseResultDto.setResult(FAIL);
		}
		
		return houseResultDto;
	}
	
	
}

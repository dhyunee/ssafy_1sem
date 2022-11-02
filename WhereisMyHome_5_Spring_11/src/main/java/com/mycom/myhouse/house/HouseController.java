package com.mycom.myhouse.house;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mycom.myhouse.house.dto.HouseResultDto;
import com.mycom.myhouse.house.dto.PlaceDto;

@RestController
public class HouseController {

	@Autowired
	HouseService houseService;
	
	@GetMapping("/sidoList")
	public List<PlaceDto> getSidoList() {
		return houseService.getSido();
	}
	
	@GetMapping("/gugunList")
	public List<PlaceDto> getGugunList(@RequestParam String sido) {
		return houseService.getGugun(sido);
	}
	
	@GetMapping("/dongList")
	public List<PlaceDto> getDongList(@RequestParam String gugun) {
		return houseService.getDong(gugun);
	}
	
	@GetMapping("/houseList")
	public HouseResultDto getHouseList(@RequestParam String dong) {
		return houseService.getHouseList(dong);
	}
	
	
}

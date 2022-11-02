package service;

import java.util.List;

import dto.AptInfoDto;
import dto.PlaceDto;

public interface MainListService {
	List<PlaceDto> getSido();
	List<PlaceDto> getGugun(String sido);
	List<PlaceDto> getDong(String sido, String gugun);
	List<AptInfoDto> getList(String sido, String gugun,String dong);
}

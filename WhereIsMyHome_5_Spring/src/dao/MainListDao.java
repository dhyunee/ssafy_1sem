package dao;

import java.util.List;

import dto.AptInfoDto;
import dto.PlaceDto;

public interface MainListDao {
	List<PlaceDto> getSido();
	List<PlaceDto> getGugun(String sido);
	List<PlaceDto> getDong(String sido,String gugun);
	List<AptInfoDto> getList(String sido, String gugun, String dong);
}

package service;

import java.util.List;

import dao.MainListDao;
import dao.MainListDaoImpl;
import dto.AptInfoDto;
import dto.PlaceDto;

public class MainListServiceImpl implements MainListService{
	
	private static MainListService instance = new MainListServiceImpl();
	private MainListServiceImpl() {};
	public static MainListService getInstance() {
		return instance;
	}
	
	MainListDao dao = MainListDaoImpl.getInstance();

	@Override
	public List<PlaceDto> getSido() {
		return dao.getSido();
	}

	@Override
	public List<PlaceDto> getGugun(String sido) {
		return dao.getGugun(sido);
	}

	@Override
	public List<PlaceDto> getDong(String sido, String gugun) {
		return dao.getDong(sido, gugun);
	}
	
	@Override
	public List<AptInfoDto> getList(String sido, String gugun,String dong) {
		// TODO Auto-generated method stub
		return dao.getList(sido, gugun,dong);
	}

}

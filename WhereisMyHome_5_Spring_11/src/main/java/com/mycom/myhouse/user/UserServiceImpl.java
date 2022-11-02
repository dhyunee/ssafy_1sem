package com.mycom.myhouse.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycom.myhouse.user.dto.UserDto;
import com.mycom.myhouse.user.dto.UserResultDto;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserDao userDao;

	private final int SUCCESS = 1;
	private final int FAIL = -1;
	
	@Override
	public UserResultDto insertUser(UserDto userDto) {
		UserResultDto userResultDto = new UserResultDto();
		if (userDao.insertUser(userDto) == 1) {
			userResultDto.setResult(SUCCESS);
		} else {
			userResultDto.setResult(FAIL);
		}
		return userResultDto;
	}

	@Override
	public UserResultDto updateUser(UserDto userDto) {
		UserResultDto userResultDto = new UserResultDto();
		if (userDao.updateUser(userDto) == 1) {
			userResultDto.setResult(SUCCESS);
		} else {
			userResultDto.setResult(FAIL);
		}
		return userResultDto;
	}

	@Override
	public UserResultDto deleteUser(String userEmail) {
		UserResultDto userResultDto = new UserResultDto();
		if (userDao.deleteUser(userEmail) == 1) {
			userResultDto.setResult(SUCCESS);
		} else {
			userResultDto.setResult(FAIL);
		}
		return userResultDto;
	}

	@Override
	public UserDto loginUser(UserDto dto) {
		UserDto userDto = userDao.loginUser(dto.getUserEmail());
		if (userDto != null && userDto.getUserPassword().equals(dto.getUserPassword())) {
			return userDto;
		}
		return null;
	}
	
	
}

package com.mycom.myhouse.user;

import com.mycom.myhouse.user.dto.UserDto;
import com.mycom.myhouse.user.dto.UserResultDto;

public interface UserService {
	UserResultDto insertUser(UserDto userDto);
	UserResultDto updateUser(UserDto userDto);
	UserResultDto deleteUser(String userEmail);
	UserDto loginUser(UserDto dto);
}

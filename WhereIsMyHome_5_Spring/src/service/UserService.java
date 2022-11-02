package service;

import dto.UserDto;

public interface UserService {
	public int register(UserDto userDto);
	public int update(UserDto userDto);
	public int delete(UserDto userDto);

}

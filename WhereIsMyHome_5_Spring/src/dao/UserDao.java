package dao;

import dto.UserDto;

public interface UserDao {
	public int userRegister(UserDto userdto);
	public int userUpdate(UserDto userDto);
	public int userDelete(UserDto userDto);

}

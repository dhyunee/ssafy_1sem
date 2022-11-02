package com.mycom.myhouse.user;

import org.apache.ibatis.annotations.Mapper;

import com.mycom.myhouse.user.dto.UserDto;

@Mapper
public interface UserDao {
	public int insertUser(UserDto userdto);
	public int updateUser(UserDto userDto);
	public int deleteUser(String userEmail);
	public UserDto loginUser(String userEmail);
	public UserDto getUser(String userEmail);
}

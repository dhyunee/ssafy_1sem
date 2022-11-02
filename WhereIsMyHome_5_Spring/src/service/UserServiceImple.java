package service;

import dao.UserDao;
import dao.UserDaoImpl;
import dto.UserDto;

public class UserServiceImple implements UserService {

	private static UserServiceImple instance = new UserServiceImple();

	private UserServiceImple() {
	};

	public static UserServiceImple getInstance() {
		return instance;
	}

	UserDao userDao = UserDaoImpl.getInstance();

	@Override
	public int register(UserDto userDto) {
		return userDao.userRegister(userDto);
	}

	@Override
	public int update(UserDto userDto) {
		return userDao.userUpdate(userDto);
	}

	@Override
	public int delete(UserDto userDto) {
		return userDao.userDelete(userDto);
	}

}

package service;

import dao.LoginDaoImple;
import dto.UserDto;

public class LoginServiceImple implements LoginService {

	private static LoginServiceImple instance = new LoginServiceImple();

	private LoginServiceImple() {
	};

	public static LoginServiceImple getInstance() {
		return instance;
	}

	@Override
	public UserDto login(String userEmail, String userPassword) {

		UserDto userDto = LoginDaoImple.getInstance().login(userEmail);

		if (userDto != null && userDto.getUserPassword().equals(userPassword)) {
			return userDto;
		}

		return null;
	}

}

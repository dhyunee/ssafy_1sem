package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DBManager;
import dto.UserDto;

public class LoginDaoImple implements LoginDao {

	private static LoginDaoImple instance = new LoginDaoImple();

	private LoginDaoImple() {
	}

	public static LoginDaoImple getInstance() {
		return instance;
	}

	@Override
	public UserDto login(String userEmail) {
		UserDto userDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = DBManager.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select USER_SEQ, USER_NAME, USER_PASSWORD, USER_EMAIL, USER_REGISTER_DATE, USER_CLSF \n");
			sql.append("from users where USER_EMAIL=?");

			System.out.println(sql.toString());

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userEmail);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				userDto = new UserDto();
				userDto.setUserSeq(rs.getInt("USER_SEQ"));
				userDto.setUserName(rs.getString("USER_NAME"));
				userDto.setUserPassword(rs.getString("USER_PASSWORD"));
				userDto.setUserEmail(rs.getString("USER_EMAIL"));
				userDto.setUserRegistDate(rs.getTimestamp("USER_REGISTER_DATE").toLocalDateTime());
				userDto.setUserClsf(rs.getString("USER_CLSF"));

				System.out.println(userDto.getUserName());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, conn);
		}

		return userDto;
	}

}

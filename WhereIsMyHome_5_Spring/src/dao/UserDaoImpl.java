package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.DBManager;
import dto.UserDto;

public class UserDaoImpl implements UserDao {

	private static UserDaoImpl instance = new UserDaoImpl();

	private UserDaoImpl() {
	}

	public static UserDaoImpl getInstance() {
		return instance;
	}

	@Override
	public int userRegister(UserDto userdto) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int ret = -1;

		try {
			conn = DBManager.getConnection();
			StringBuilder sql = new StringBuilder();

			sql.append("insert into users(USER_NAME, USER_PASSWORD, USER_EMAIL, USER_REGISTER_DATE, USER_CLSF) \n");
			sql.append("values(?, ?, ?, now(), ?)");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userdto.getUserName());
			pstmt.setString(2, userdto.getUserPassword());
			pstmt.setString(3, userdto.getUserEmail());
			pstmt.setString(4, userdto.getUserClsf());
			ret = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, conn);
		}

		return ret;
	}

	@Override
	public int userUpdate(UserDto userDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int ret = -1;

		try {
			conn = DBManager.getConnection();
			StringBuilder sql = new StringBuilder();

			sql.append("UPDATE users set USER_PASSWORD = ? \n");
			sql.append("WHERE USER_EMAIL = ? ");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userDto.getUserPassword());
			pstmt.setString(2, userDto.getUserEmail());

			ret = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, conn);
		}

		return ret;
	}

	@Override
	public int userDelete(UserDto userDto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int ret = -1;

		try {
			conn = DBManager.getConnection();
			StringBuilder sql = new StringBuilder();

			sql.append("DELETE FROM users \n");
			sql.append("WHERE USER_EMAIL = ? ");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userDto.getUserEmail());

			ret = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, conn);
		}

		return ret;
	}

}

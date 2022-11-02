package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBManager {

	// Connection 객체를 얻어서 리턴
	public static Connection getConnection() {
		Connection conn = null;
		try {
			// context.xml에 접근
			Context context = (Context) new InitialContext().lookup("java:comp/env");

			// Resource에 접근
			DataSource dataSource = (DataSource) context.lookup("jdbc/my_house");
			conn = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

	// Connection 객체를 반납받는
	public static void releaseConnection(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}

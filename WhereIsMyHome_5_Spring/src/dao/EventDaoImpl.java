package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBManager;
import dto.EventDto;

public class EventDaoImpl {

	private static EventDaoImpl instance = new EventDaoImpl();

	private EventDaoImpl() {
	}

	public static EventDaoImpl getInstance() {
		return instance;
	}
	
	public List<EventDto> eventList() {
		Connection con = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<EventDto> list = new ArrayList<>();
		
		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append("SELECT * \n")
				.append("FROM event ");
			
			psmt = con.prepareStatement(sb.toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				EventDto tmp = new EventDto();
				tmp.eventId = rs.getInt("event_id");
				tmp.eventName = rs.getString("event_name");
				tmp.eventFrom = rs.getString("event_from");
				tmp.eventTo = rs.getString("event_to");
				
				list.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, psmt, con);
		}
		
		return list;
	}

	public int eventRegister(EventDto eventDto) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int ret = -1;

		try {
			conn = DBManager.getConnection();
			StringBuilder sql = new StringBuilder();

			sql.append("insert into event (EVENT_NAME, EVENT_FROM, EVENT_TO) \n");
			sql.append("values(?, ?, ?)");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, eventDto.eventName);
			pstmt.setString(2, eventDto.eventFrom);
			pstmt.setString(3, eventDto.eventTo);
			ret = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, conn);
		}

		return ret;
	}

	public int eventDelete(int eventId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int ret = -1;

		try {
			conn = DBManager.getConnection();
			StringBuilder sql = new StringBuilder();

			sql.append("DELETE FROM event \n");
			sql.append("WHERE EVENT_ID = ? ");

			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, eventId);

			ret = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.releaseConnection(rs, pstmt, conn);
		}

		return ret;
	}

}

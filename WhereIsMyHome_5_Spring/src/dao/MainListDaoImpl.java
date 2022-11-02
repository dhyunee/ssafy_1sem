package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBManager;
import dto.AptInfoDto;
import dto.PlaceDto;

public class MainListDaoImpl implements MainListDao{
	
	private static MainListDao instance = new MainListDaoImpl();
	private MainListDaoImpl() {}
	public static MainListDao getInstance() {
		return instance;
	}

	@Override
	public List<PlaceDto> getSido() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<PlaceDto> ret = new ArrayList<>();
		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(" select * ")
				.append("from sido_code ");
				
			
			pstmt = con.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String num = rs.getString("code");
				String name = rs.getString("name");
				ret.add(new PlaceDto(num,name));
			}
			
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}
		return ret;
	}

	@Override
	public List<PlaceDto> getGugun(String sido) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<PlaceDto> ret = new ArrayList<>();
		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(" select * ")
				.append("from gugun_code ")
				.append("where sido_code = ?");
				
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, sido);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String num = rs.getString("code");
				String name = rs.getString("name");
				ret.add(new PlaceDto(num,name));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}
		return ret;
	}

	@Override
	public List<PlaceDto> getDong(String sido, String gugun) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<PlaceDto> ret = new ArrayList<>();
		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			sb.append(" select * ")
				.append("from dong_code ")
				.append("where city_code = ? and gugun_code = ?");
				
			System.out.println(sb.toString());
			System.out.println(sido);
			System.out.println(gugun);
			
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, sido);
			pstmt.setString(2, gugun);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String num = rs.getString("code");
				String name = rs.getString("name");
				ret.add(new PlaceDto(num,name));
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}	
		return ret;
	}
	
	public List<AptInfoDto> getList(String sido, String gugun,String dong) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<AptInfoDto> ret = new ArrayList<>();
		try {
			con = DBManager.getConnection();
			StringBuilder sb = new StringBuilder();
			String Table = "SELECT h.no, h.AptName,h.floor,h.area,h.dong,h.dealAmount , h.code guncode, d.code dongcode " + 
					"from dong_code d,housedeal h " + 
					"where d.name = h.dong";
			
			sb.append("select * ")
				.append("from ("+Table+") t ");
			
			String cond = "";
			if(!"".equals(dong)) {
				cond = "where dongcode = ?";
				sb.append(cond);
				pstmt = con.prepareStatement(sb.toString());
				pstmt.setString(1, dong);
			}else if(!"".equals(gugun)) {
				cond = "where guncode = ?";
				sb.append(cond);
				pstmt = con.prepareStatement(sb.toString());
				pstmt.setString(1, gugun);
			}else {
				cond = "where guncode like ?";
				sb.append(cond);
				pstmt = con.prepareStatement(sb.toString());
				pstmt.setString(1, sido+"%");
			}
			System.out.println(sb);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String no = rs.getString("no");
				String AptName = rs.getString("AptName");
				String floor = rs.getString("floor");
				String area = rs.getString("area");
				String _dong = rs.getString("dong");
				String dealAmount = rs.getString("dealAmount");
				
				AptInfoDto dto = new AptInfoDto(no,AptName,floor,area,_dong,dealAmount); 
				
				String sql = "select lat, lng from houseinfo where dong = ? and AptName = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, _dong);
				pstmt.setString(2, AptName);
				ResultSet rs2 = pstmt.executeQuery();
				
				if(rs2.next()) {
					dto.setLat(rs2.getFloat("lat"));
					dto.setLng(rs2.getFloat("lng"));
				}
				
				if(rs2 != null)
					rs2.close();
				
				ret.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBManager.releaseConnection(rs, pstmt, con);
		}
		return ret;
	}

}

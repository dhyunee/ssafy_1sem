package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import common.DBManager;
import dto.CodeDto;

public class CodeDaoImpl implements CodeDao{
	
	private static CodeDaoImpl instance = new CodeDaoImpl();
	
	private CodeDaoImpl() {}
	
	public static CodeDaoImpl getInstance() {
		return instance;
	}
	
	
	public List<CodeDto> getCodeList(String code){
		List<CodeDto> list = new ArrayList<CodeDto>();


		String sql = "select code, code_name from code where group_code = ? and use_yn = 'Y'";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "001");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String rs_code = rs.getString("code");
				String codeName = rs.getString("code_name");
				
				CodeDto dto = new CodeDto();
				dto.setCode(rs_code);
				dto.setCodeName(codeName);
				
				list.add(dto);
			}
		//conn -> pstmt -> rs -> list.add()
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBManager.releaseConnection(rs, pstmt, conn);
		}
		
		list.forEach(System.out::println);
		return list;
	}
}

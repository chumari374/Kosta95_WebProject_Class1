package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.C_DbrdDTO;

public class C_DbrdDAO {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public C_DbrdDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB연결 실패:" + e);
			return;
		}
	}
	
	public int C_dbrdInsert(C_DbrdDTO C_Dbrd){
		int result = 0;
		
		try {
			String sql = "insert into c_dbrd(num,empno,title,content,write_date,data) "
					+ "values(comp_databoard_num.nextval,?,?,?,sysdate,?)";
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, C_Dbrd.getEmpno());
			pstmt.setString(2, C_Dbrd.getTitle());
			pstmt.setString(3, C_Dbrd.getContent());
			pstmt.setString(4, C_Dbrd.getData());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (conn != null) try { conn.close(); } catch (SQLException ex) {}
		}
		return result;
	}
}

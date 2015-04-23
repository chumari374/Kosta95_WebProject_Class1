package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.sun.org.apache.bcel.internal.generic.GETSTATIC;

public class SignDAO {

	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

	public SignDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB연결 실패:" + e);
			return;
		}
	}

	
	public String getGetSign() {
		String getGetSign_sql = "select ename from emp where grade = ? "
				+ ", dept = ?" + ", teamname = '?'";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(getGetSign_sql);
		/*	rs = pstmt.setInt(1, );
			rs = pstmt.setInt(2, );
			rs = pstmt.setString(3, );*/
			
			rs = pstmt.executeQuery();
			
			
			while(true) {
				
				if(rs.next()) {
				
				}
				
				
			}
		}

		catch (Exception ex) {
			System.out.println("");
		}

		finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return null;
	}

}

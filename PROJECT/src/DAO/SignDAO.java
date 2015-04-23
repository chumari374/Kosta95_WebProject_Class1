package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import sun.awt.SunToolkit.InfiniteLoop;

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
		String getGetSign_sql = "select emp.ename, grade.gradename from emp join grade on emp.grade = grade.grade "
							  + "where grade = ?";
		
		String[] searchGS = {", deptcode = ?",  ", teamname = '?'"};
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(getGetSign_sql);
			
			rs = pstmt.executeQuery();
			
			for(int i = 0 ; ; i++) {
				
				/*
				pstmt.setInt(1, ); 내 직급등급의 - 1
				pstmt.setInt(2, ); 내 부서
				pstmt.setString(3, ); 내 팀
				*/
				
				if(rs.getRow() != 1) {
					String GetSign = rs.getString(1) + " " + rs.getInt(2);
					return GetSign;
				}
				
				getGetSign_sql = getGetSign_sql + searchGS[i];
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

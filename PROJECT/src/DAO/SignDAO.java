package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.SignDTO;
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

	// ========== 결재문서작성에서 결재받는사람 정하기 ==============================================
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
	
	// ========== 결재문서작성에서 결재받는사람 정하기 끝==============================================
	
	
	
	// ========== 받은 결재 문서에서 나한테 결재 보내준 사람 보기========================
	public List getGetSignList(int page, int limit) {
		String getGetSignList_sql = "select * from sign where getsign = empno";
		
		List list = new ArrayList();
		
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(getGetSignList_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, endrow);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				SignDTO SignBoard = new SignDTO(); // 한 건의
				SignBoard.setSignnum(rs.getInt("SIGNNUM"));
				SignBoard.setStarter(rs.getInt("STARTER"));
				SignBoard.setEmpno(rs.getInt("EMPNO"));
				SignBoard.setGetsign(rs.getInt("GETSIGN"));
				SignBoard.setTitle(rs.getString("TITLE"));
				SignBoard.setContent(rs.getString("CONTENT"));
				SignBoard.setWrite_date(rs.getDate("WRITE_DATE"));
				SignBoard.setRef(rs.getInt("REF"));
				// SignBoard.setStep(rs.getInt("STEP"));
				SignBoard.setStatus(rs.getString("STATUS"));
				list.add(SignBoard); // key point (여러건의 데이터 collection사용)
			}
			
			return list;
		} catch (Exception ex) {
			System.out.println("SignBoard 에러 : " + ex);
		} finally {
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
	// ========== 받은 결재 문서에서 나한테 결재 보내준 사람 보기 끝========================

}

package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.catalina.Session;
import org.apache.catalina.connector.Request;
import org.apache.catalina.connector.Response;

import DTO.SignDTO;

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

	// ========== 결재문서작성에서 결재받는사람 표시==
	public String getGetSignName(int grade, int deptcode, int teamcode) {

		String getGetSign_sql = "select e.ename, g.gradename"
				+ "from emp e join grade g" + "on e.grade = g.grade" + "where ";

		String[] searchGS = { "e.grade = ?" + ", deptcode = ?",
				", teamname = '?'" };

		try {
			conn = ds.getConnection();

			for (int i = 0;; i++) {
				getGetSign_sql = getGetSign_sql + searchGS[i];
				pstmt = conn.prepareStatement(getGetSign_sql);

				
				pstmt.setInt(1, grade); //내 직급등급의 - 1 
				pstmt.setInt(2, deptcode); //내 부서
				pstmt.setInt(3, teamcode); //내 팀
				

				rs = pstmt.executeQuery();

				if (rs.getRow() != 1) {
					String getGetSignName = (rs.getString(1) + " " + rs
							.getString(2));
					return getGetSignName;
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

	// ========== 결재문서 작성(기안,상부보고)========
	public boolean Sign(SignDTO sign) {

		String getGetSign_sql = "select empno from emp where";

		String[] searchGS = { "e.grade = ?" + ", deptcode = ?",
				", teamname = '?'" };

		int getSign = 0;

		int getSignNum = 0;

		try {
			conn = ds.getConnection();

			for (int i = 0;; i++) {

				getGetSign_sql = getGetSign_sql + searchGS[i];
				pstmt = conn.prepareStatement(getGetSign_sql);

				/*
				 * pstmt.setInt(1, ); 내 직급등급의 - 1 pstmt.setInt(2, ); 내 부서
				 * pstmt.setString(3, ); 내 팀
				 */

				rs = pstmt.executeQuery();

				if (rs.getRow() != 1) {
					getSign = rs.getInt(1);
					break;
				}
			}

			String getSignNum_sql = "select max(signnum) from sign";
			pstmt = conn.prepareStatement(getSignNum_sql);
			rs = pstmt.executeQuery();

			getSignNum = rs.getInt(1);

			String startSign_sql = "insert into sign (Signnum, starter, empno, getsign, title, content"
					+ "write_date, ref, step, status) values(SIGNNUM_seq.nextval,?,?,?,?,?,sysdate,?,?,?)";

			pstmt = conn.prepareStatement(startSign_sql);

			pstmt.setInt(1, sign.getStarter()); // 기안자
			pstmt.setInt(2, sign.getEmpno()); // 내 사번
			pstmt.setInt(3, getSign);
			pstmt.setString(4, sign.getTitle());
			pstmt.setString(5, sign.getContent());
			// sysdate
			pstmt.setInt(6, sign.getRef());
			pstmt.setInt(7, sign.getStep());
			pstmt.setString(8, sign.getStatus());

		} catch (SQLException e) {
			e.printStackTrace();
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

		return false;
	}

	// ========== 받은 결재 함========================
	public List<SignDTO> getGetSignList(int empno, String status) {
		String getGetSignList_sql = "select * from sign where getsign = ?, status = '?'";

		List list = new ArrayList<SignDTO>();

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(getGetSignList_sql);
			pstmt.setInt(1, empno);
			pstmt.setString(2, status);
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

	// ========== 보낸 결재 함========================
	public List<SignDTO> getSendSignList(int empno, String status) {
		String getGetSignList_sql = "select * from sign where empno = ?, status = '?'";

		List list = new ArrayList<SignDTO>();

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(getGetSignList_sql);
			pstmt.setInt(1, empno);
			pstmt.setString(2, status);
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

}
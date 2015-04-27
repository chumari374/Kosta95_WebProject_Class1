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
			System.out.println("DB���� ����:" + e);
			return;
		}
	}

	// ========== ���繮���ۼ����� ����޴»�� ǥ��==
	public String getGetSignName(int grade, int deptcode, int teamcode) {

		String getGetSign_sql = "select e.ename, g.gradename"
				+ " from emp e join grade g on e.grade = g.grade where ";

		String[] searchGS = { "e.GRADE = ?", " and e.DEPTCODE = ?",
				" and e.TEAMCODE = ?" };
		System.out.println("����1");
		try {
			conn = ds.getConnection();

			for (int i = 0;; i++) {
				getGetSign_sql = getGetSign_sql + searchGS[i];

				System.out.println(getGetSign_sql);

				pstmt = conn.prepareStatement(getGetSign_sql);

				switch (i) {
				case 2:
					pstmt.setInt(3, teamcode); // �� ��
				case 1:
					pstmt.setInt(2, deptcode); // �� �μ�	
				case 0:
					pstmt.setInt(1, grade - 1); // �� ���޵���� - 1
					break;
				}

				rs = pstmt.executeQuery();
				System.out.println("����2");
				
				if (rs.getRow() == 0) {
					while (rs.next()) {
						String getGetSignName = (rs.getString("ENAME") + " " + rs
								.getString("GRADENAME"));
						System.out.println(getGetSignName);
						return getGetSignName;
					}
				}
			}
		}

		catch (Exception ex) {
			System.out.println("����: " + ex);
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

	// ========== ���繮�� �ۼ�(���,��κ���)========
	public boolean Sign(SignDTO sign, int grade, int deptcode, int teamcode) {

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

				pstmt.setInt(1, grade - 1); // �� ���޵���� - 1
				pstmt.setInt(2, deptcode); // �� �μ�
				pstmt.setInt(3, teamcode); // �� ��

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

			pstmt.setInt(1, sign.getStarter()); // �����
			pstmt.setInt(2, sign.getEmpno()); // �� ���
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

	// ========== ���� ���� ��=============================

	public List getGetSignList(int empno, int page, int limit, String status) {
		String getGetSignList_sql = "select rownum, signnum, title, content, empno, getsign, ref, step, write_date, status"
				+ "from sign"
				+ "where getsign = ? and rownum>=? and rownum<=? and status = '?'";

		List list = new ArrayList();
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1; // ���� ������ row ��ȣ.

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(getGetSignList_sql);
			pstmt.setInt(1, empno);
			pstmt.setInt(2, startrow); // 11 21 code
			pstmt.setInt(3, endrow); // 20 30 code
			pstmt.setString(4, status);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SignDTO SignBoard = new SignDTO(); // �� ����
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
				list.add(SignBoard); // key point (�������� ������ collection���)
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList ���� : " + ex);
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

	// ========== ���� ���� ��========================
	public List getSendSignList(int empno, int page, int limit, String status) {
		String getSendSignList_sql = "select rownum, signnum, title, content, empno, getsign, ref, step, write_date, status"
				+ "from sign"
				+ "where empno = ? and rownum>=? and rownum<=? and status = '?'";

		List list = new ArrayList();
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1; // ���� ������ row ��ȣ.

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(getSendSignList_sql);
			pstmt.setInt(1, empno);
			pstmt.setInt(2, startrow); // 11 21 code
			pstmt.setInt(3, endrow); // 20 30 code
			pstmt.setString(4, status);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				SignDTO SignBoard = new SignDTO(); // �� ����
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
				list.add(SignBoard); // key point (�������� ������ collection���)
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList ���� : " + ex);
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

	// ======== ���� ���� ���� ���� ���ϴ� �Լ� ======
	public int getSignListCount() {
		int rowcount = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn
					.prepareStatement("select count(*) from sign where getsign = ?");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rowcount = rs.getInt(1);
			}
		} catch (Exception e) {

		} finally {
			try {
				rs.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
			try {
				pstmt.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException s) {
				s.printStackTrace();
			}
		}
		return rowcount;
	}
	
}
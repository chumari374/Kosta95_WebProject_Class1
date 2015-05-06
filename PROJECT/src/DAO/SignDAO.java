package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

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

	// ========== 결재문서작성에서 결재받는사람 사번===
	public List getInfoList(int grade, int deptcode, int teamcode) {

		String getDeptName_sql = "select deptname from dept where deptcode = ?";
		String getTeamName_sql = "select teamname from team where teamcode = ?";
		String getGetSign_sql = "select e.ename, g.gradename, e.empno from emp e join grade g "
				+ " on e.grade = g.grade where ";

		String[] searchGS = { "e.GRADE = ?", " and e.DEPTCODE = ?",
				" and e.TEAMCODE = ?" };

		List infoList = new ArrayList<String>();

		System.out.println("도착1");
		try {
			conn = ds.getConnection();

			pstmt = conn.prepareStatement(getDeptName_sql);
			pstmt.setInt(1, deptcode);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				infoList.add(rs.getString(1));
			}

			pstmt = conn.prepareStatement(getTeamName_sql);
			pstmt.setInt(1, teamcode);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				infoList.add(rs.getString(1));
			}

			for (int i = 0;; i++) {

				System.out.println(grade + " " + teamcode + " " + deptcode);

				getGetSign_sql = getGetSign_sql + searchGS[i];

				System.out.println(getGetSign_sql);

				pstmt = conn.prepareStatement(getGetSign_sql,
						ResultSet.TYPE_SCROLL_INSENSITIVE,
						ResultSet.CONCUR_UPDATABLE);

				switch (i) {
				case 2:
					pstmt.setInt(3, teamcode); // 내 팀
				case 1:
					pstmt.setInt(2, deptcode); // 내 부서
				case 0:
					pstmt.setInt(1, grade - 1); // 내 직급등급의 - 1
					break;
				}

				rs = pstmt.executeQuery();
				System.out.println("도착2");
				rs.last();
				System.out.println(rs.getRow());

				if (rs.getRow() == 1) {
					while (rs.first()) {
						infoList.add((rs.getString("ENAME") + " " + rs
								.getString("GRADENAME")));
						infoList.add(rs.getString("empno"));

						return infoList;
					}
				}
			}
		}

		catch (Exception ex) {
			System.out.println("예외: " + ex);
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

		return infoList;
	}

	// ========== 사원 이름, 직급 표시===
	public String getEmpname(int empno) {

		System.out.println(empno);
		String empname = "";
		try {
			conn = ds.getConnection();

			String sql = "select *" + " from emp e join grade g"
					+ " on e.grade = g.grade" + " where empno = ?";
			pstmt = conn.prepareStatement(sql);

			System.out.println(sql);
			pstmt.setInt(1, empno);

			rs = pstmt.executeQuery();

			System.out.println("1");

			while (rs.next()) {
				empname = rs.getString("ename") + " "
						+ rs.getString("gradename");
				System.out.println("2");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
		return empname;

	}

	// ========== 결재문서 작성(기안, 상부 보고)========
	public boolean SignStart(SignDTO sign) {

		try {
			conn = ds.getConnection();

			int getMax = 0;

			pstmt = conn.prepareStatement("select max(signnum) from sign");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				getMax = rs.getInt(1) + 1;
			}

			String startSign_sql = "insert into sign (signnum, starter, empno, getsign, title, content, write_date, ref, step, status, file_sign)"
					+ "values(?,?,?,?,?,?,sysdate,?,?,?,?)";

			pstmt = conn.prepareStatement(startSign_sql);

			System.out.println(getMax);
			System.out.println(sign.getStarter());
			System.out.println(sign.getEmpno());
			System.out.println(sign.getGetsign());
			System.out.println(sign.getTitle());
			System.out.println(sign.getContent());
			System.out.println(sign.getRef());
			System.out.println(sign.getStep());
			System.out.println(sign.getStatus());
			System.out.println(sign.getFile_sign());

			pstmt.setInt(1, getMax);
			System.out.println(1);
			pstmt.setInt(2, sign.getStarter()); // 기안자
			System.out.println(2);
			pstmt.setInt(3, sign.getEmpno()); // 내 사번
			System.out.println(3);
			pstmt.setInt(4, sign.getGetsign());
			System.out.println(4);
			pstmt.setString(5, sign.getTitle());
			System.out.println(5);
			pstmt.setString(6, sign.getContent());
			System.out.println(6);
			// sysdate
			if (sign.getRef() == 0) {
				pstmt.setInt(7, getMax);
			} else {
				pstmt.setInt(7, sign.getRef());
			}
			System.out.println(7);
			pstmt.setInt(8, sign.getStep());
			System.out.println(8);
			pstmt.setString(9, sign.getStatus());
			System.out.println(9);
			if (sign.getFile_sign() == null) {
				pstmt.setString(10, "null");
			} else {
				pstmt.setString(10, sign.getFile_sign());
			}

			System.out.println(10);
			rs = pstmt.executeQuery();
			return true;
		} catch (SQLException e) {
			System.out.println(e);
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

	// ========== 받은 결재 함=============================
	public List getGetSignList(int empno, int page, int limit, String status) {
		String getGetSignList_sql = "";
		if (status.equals("전체")) {
			getGetSignList_sql = "select * from "
					+ " (select rownum as rnum, signnum, starter, empno, getsign, title, content, write_date, ref, step, status, file_sign from "
					+ " (select * from sign "
					+ " where getsign = ? order by signnum desc)) where rnum>=? and rnum<=? ";
		} else {
			getGetSignList_sql = "select * from "
					+ " (select rownum as rnum, signnum, starter, empno, getsign, title, content, write_date, ref, step, status, file_sign from "
					+ " (select * from sign "
					+ " where getsign = ? and status = ? order by signnum desc)) where rnum>=? and rnum<=? ";
		}

		System.out.println(getGetSignList_sql);
		System.out.println("DAO앵커1");

		List list = new ArrayList();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1; // 읽을 마지막 row 번호.

		System.out.println(startrow);
		System.out.println(endrow);

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(getGetSignList_sql);

			if (status.equals("전체")) {
				pstmt.setInt(1, empno);
				pstmt.setInt(2, startrow); // 11 21 code
				pstmt.setInt(3, endrow); // 20 30 code
				rs = pstmt.executeQuery();
			} else {
				pstmt.setInt(1, empno);
				pstmt.setString(2, status);
				pstmt.setInt(3, startrow); // 11 21 code
				pstmt.setInt(4, endrow); // 20 30 code
				rs = pstmt.executeQuery();
			}

			while (rs.next()) {
				System.out.println("점검1");
				SignDTO SignBoard = new SignDTO(); // 한 건의
				SignBoard.setSignnum(rs.getInt("signnum"));
				SignBoard.setStarter(rs.getInt("starter"));
				SignBoard.setEmpno(rs.getInt("empno"));
				SignBoard.setGetsign(rs.getInt("getsign"));
				SignBoard.setTitle(rs.getString("title"));
				SignBoard.setContent(rs.getString("content"));
				SignBoard.setWrite_date(rs.getDate("write_date"));
				SignBoard.setStatus(rs.getString("status"));
				SignBoard.setFile_sign(rs.getString("file_sign"));

				list.add(SignBoard); // key point (여러건의 데이터 collection사용)
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
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
		return list;
	}

	// ========== 보낸 결재 함========================
	public List getSendSignList(int empno, int page, int limit, String status) {
		String getSendSignList_sql = "select * from "
				+ " (select rownum as rnum, signnum, starter, empno, getsign, title, content, write_date, ref, step, status, file_sign from "
				+ " (select * from sign "
				+ " where empno = ? and status = ? order by signnum desc)) where rnum>=? and rnum<=? ";

		System.out.println(getSendSignList_sql);
		System.out.println("DAO앵커1");

		List list = new ArrayList();
		int startrow = (page - 1) * limit + 1;
		int endrow = startrow + limit - 1; // 읽을 마지막 row 번호.

		System.out.println(startrow);
		System.out.println(endrow);

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(getSendSignList_sql);

			System.out.println("DAO앵커2");

			System.out.println(empno);
			System.out.println(startrow);
			System.out.println(endrow);

			System.out.println("갯수끝");

			pstmt.setInt(1, empno);
			pstmt.setString(2, status);
			pstmt.setInt(3, startrow); // 11 21 code
			pstmt.setInt(4, endrow); // 20 30 code
			rs = pstmt.executeQuery();

			while (rs.next()) {
				System.out.println("점검1");
				SignDTO SignBoard = new SignDTO(); // 한 건의

				SignBoard.setSignnum(rs.getInt("signnum"));
				SignBoard.setStarter(rs.getInt("starter"));
				SignBoard.setEmpno(rs.getInt("empno"));
				SignBoard.setGetsign(rs.getInt("getsign"));
				SignBoard.setTitle(rs.getString("title"));
				SignBoard.setContent(rs.getString("content"));
				SignBoard.setWrite_date(rs.getDate("write_date"));
				SignBoard.setStatus(rs.getString("status"));
				SignBoard.setFile_sign(rs.getString("file_sign"));

				list.add(SignBoard); // key point (여러건의 데이터 collection사용)
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
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

	// ======== 받은 결재 글의 갯수 구하는 함수 ======
	public int getSignListCount(int empno, String status) {
		int rowcount = 0;
		String getSignListcount_sql = "";

		if (status.equals("전체")) {
			getSignListcount_sql = "select count(*) from sign where getsign = ?";
		} else {
			getSignListcount_sql = "select count(*) from sign where getsign = ? and status = ?";
		}

		try {

			conn = ds.getConnection();
			pstmt = conn.prepareStatement(getSignListcount_sql);

			if (status.equals("전체")) {
				pstmt.setInt(1, empno);
				rs = pstmt.executeQuery();
			} else {
				pstmt.setInt(1, empno);
				pstmt.setString(2, status);
				rs = pstmt.executeQuery();
			}

			if (rs.next()) {
				rowcount = rs.getInt(1);
				System.out.println(rowcount);
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

	// ====== 보낸결재 갯수 구하는 함수=======================
	public int sendSignListCount(int empno, String status) {
		int rowcount = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn
					.prepareStatement("select count(*) from sign where empno = ? and status = ?");
			pstmt.setInt(1, empno);
			pstmt.setString(2, status);
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

	// ====== 보낸결재에서 자세히 보기 함수
	public SignDTO DetailsendSign(int num) throws Exception {
		SignDTO SignBoard = null;
		try {
			conn = ds.getConnection();

			String getDetailSendSign_sql = "select SIGNNUM,STARTER,EMPNO,GETSIGN,TITLE,CONTENT,WRITE_DATE,STATUS,FILE_SIGN from sign"
					+ " where signnum = ?";

			pstmt = conn.prepareStatement(getDetailSendSign_sql);

			System.out.println(num);

			pstmt.setInt(1, num);

			System.out.println(getDetailSendSign_sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				SignBoard = new SignDTO();
				SignBoard.setSignnum(rs.getInt("signnum"));
				SignBoard.setStarter(rs.getInt("starter"));
				SignBoard.setEmpno(rs.getInt("empno"));
				SignBoard.setGetsign(rs.getInt("getsign"));
				SignBoard.setTitle(rs.getString("title"));
				SignBoard.setContent(rs.getString("content"));
				SignBoard.setWrite_date(rs.getDate("write_date"));
				SignBoard.setStatus(rs.getString("status"));
				SignBoard.setFile_sign(rs.getString("file_sign"));
			}
			return SignBoard;
		} catch (Exception ex) {
			System.out.println("Detail 에러 : " + ex);
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

	// ====== 받은 결재에서 자세히 보기 함수
	public SignDTO DetailgetSign(int num) throws Exception {
		SignDTO SignBoard = null;
		try {
			conn = ds.getConnection();
			System.out.println("받은 결재 : " + conn.isClosed());
			System.out.println("num : " + num);
			String getDetailSendSign_sql = "select SIGNNUM,STARTER,EMPNO,GETSIGN,TITLE,CONTENT,WRITE_DATE,STATUS,FILE_SIGN, REF, STEP from sign"
					+ " where signnum = ?";

			pstmt = conn.prepareStatement(getDetailSendSign_sql);

			// System.out.println(num);

			pstmt.setInt(1, num);

			// System.out.println(getDetailSendSign_sql);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				SignBoard = new SignDTO();
				SignBoard.setSignnum(rs.getInt("signnum"));
				SignBoard.setStarter(rs.getInt("starter"));
				SignBoard.setEmpno(rs.getInt("empno"));
				SignBoard.setGetsign(rs.getInt("getsign"));
				SignBoard.setTitle(rs.getString("title"));
				SignBoard.setContent(rs.getString("content"));
				SignBoard.setWrite_date(rs.getDate("write_date"));
				SignBoard.setRef(rs.getInt("ref"));
				SignBoard.setStep(rs.getInt("step"));
				SignBoard.setStatus(rs.getString("status"));
				SignBoard.setFile_sign(rs.getString("file_sign"));
			}
			return SignBoard;
		} catch (Exception ex) {
			System.out.println("Detail 에러 : " + ex);
			return null;
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

	}

	// ====== 문서 상태 함수===============================
	public void SignStatus(String status, int ref, int step) {

		System.out.println("사인 스테이터스 인");
		String signStatus_sql = "";
		System.out.println("DAO status" + status);

		if (status.equals("승인")) {
			signStatus_sql = "update sign set status = '승인' where ref = ?";
		}

		if (status.equals("취소")) {
			signStatus_sql = "update sign set status = '취소' where ref = ?";
		}

		System.out.println("DAO sql " + signStatus_sql);

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(signStatus_sql);
			if (status.equals("반려")) {
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
			} else {
				pstmt.setInt(1, ref);
			}

			rs = pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println("Sign 스테이터스  에러 : " + e);
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
	}

	public void signStepUp(int ref, int step, HttpServletRequest request) {
		SignDTO SignBoard = null;
		HttpSession session = request.getSession();
		int empno = (int) session.getAttribute("empno");
		int grade = (int) session.getAttribute("grade");
		int deptcode = (int) session.getAttribute("deptcode");
		int teamcode = (int) session.getAttribute("teamcode");

		System.out.println(grade + " " + deptcode + " " + teamcode);

		String stepUp_sql = "select SIGNNUM,STARTER,EMPNO,GETSIGN,TITLE,"
				+ " CONTENT,WRITE_DATE,STATUS,FILE_SIGN, REF, STEP "
				+ " from sign " + " where ref = ? and step = ?";

		SignDAO signdao = new SignDAO();
		List info = new ArrayList();
		info = signdao.getInfoList(grade, deptcode, teamcode);
		System.out.println(info.get(3));

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(stepUp_sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, step);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				SignBoard = new SignDTO();
				SignBoard.setSignnum(rs.getInt("signnum"));
				SignBoard.setStarter(rs.getInt("starter"));
				SignBoard.setEmpno(empno);
				SignBoard.setGetsign(Integer.parseInt((String) info.get(3)));
				SignBoard.setTitle(rs.getString("title"));
				SignBoard.setContent(rs.getString("content"));
				SignBoard.setWrite_date(rs.getDate("write_date"));
				SignBoard.setRef(rs.getInt("ref"));
				SignBoard.setStep(rs.getInt("step") + 1);
				SignBoard.setStatus("대기");
				SignBoard.setFile_sign(rs.getString("file_sign"));
			}

			signdao.SignStart(SignBoard);
		} catch (Exception ex) {
			System.out.println("stepUp error : " + ex);
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

	}
}

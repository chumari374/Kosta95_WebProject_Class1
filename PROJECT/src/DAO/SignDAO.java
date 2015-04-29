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
				getGetSign_sql = getGetSign_sql + searchGS[i];

				System.out.println(getGetSign_sql);

				pstmt = conn.prepareStatement(getGetSign_sql);

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

				if (rs.getRow() == 0) {
					while (rs.next()) {
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
		String getGetSignList_sql = "select rownum, signnum, title, content, empno, getsign, ref, step, write_date, status"
				+ "from sign"
				+ "where getsign = ? and rownum>=? and rownum<=? and status = ?";

		List list = new ArrayList();
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1; // 읽을 마지막 row 번호.

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(getGetSignList_sql);
			pstmt.setInt(1, empno);
			pstmt.setInt(2, startrow); // 11 21 code
			pstmt.setInt(3, endrow); // 20 30 code
			pstmt.setString(4, status);
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

	// ========== 보낸 결재 함========================
	public List getSendSignList(int empno, int page, int limit, String status) {
		String getSendSignList_sql = "select * from"
				+ " (select rownum as rnum, signnum, title, content, sgrade, ename, ggrade, mname, write_date, status, starter, getsign from"
				+ " (select s.signnum as signnum, s.title as title, s.content as content, g.gradename as sgrade, e.ename as ename,"
				+ " r.gradename as ggrade, m.ename as mname, s.write_date as write_date, s.status as status, s.starter as starter, s.getsign as getsign"
				+ " from sign s "
				+ " join emp e"
				+ " on e.empno = s.empno"
				+ " join emp m"
				+ " on m.empno = s.getsign"
				+ " join grade g"
				+ " on g.grade = e.grade"
				+ " join grade r"
				+ " on r.grade = m.grade"
				+ " where s.empno = ? and s.status = ? order by s.signnum)) where rnum>=? and rnum<=?";

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
				
				SignBoard.setTitle(rs.getString("TITLE"));
				SignBoard.setContent(rs.getString("CONTENT"));
				System.out.println("1");
				SignBoard.setStarter_name(rs.getString("sgrade") + " "
						+ rs.getString("ename"));

				SignBoard.setGetsign_name(rs.getString("ggrade") + " "
						+ rs.getString("mname"));
				SignBoard.setWrite_date(rs.getDate("WRITE_DATE"));
				SignBoard.setStatus(rs.getString("STATUS"));
			/*	SignBoard.setStarter(rs.getInt("starter"));
				SignBoard.setGetsign(rs.getInt("getsign"));*/
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

	// ======== 받은 결재 글의 갯수 구하는 함수 ======
	public int getSignListCount(int empno) {
		int rowcount = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn
					.prepareStatement("select count(*) from sign where empno = ?");
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

	// ====== 보낸결재 갯수 구하는 함수=======================
	public int sendSignListCount(int empno) {
		int rowcount = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn
					.prepareStatement("select count(*) from sign where empno = ?");
			pstmt.setInt(1, empno);
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

	public SignDTO DetailsendSign(int num) throws Exception {
	      SignDTO SignBoard = null;
	      try {
	         conn = ds.getConnection();
	         pstmt = conn.prepareStatement("select rownum, s.signnum, s.title, s.content, s.empno, g.GRADENAME as gname, e.ename as ename, "
	                              + "s.getsign, r.GRADENAME as rname, m.ename = mname, s.ref, s.step, s.write_date as write_date, s.status as status, s.FILE_SIGN as file_sign"
	                              + " from sign s join emp e on e.empno = s.empno"
	                              + " join emp m on m.empno = s.getsign join grade g"
	                              + " on g.GRADE = e.GRADE join grade r on r.GRADE = m.grade where s.signnum = ?"); 
	         pstmt.setInt(1, num); 
	         rs = pstmt.executeQuery(); 
	         if (rs.next()) { 
	            SignBoard = new SignDTO();
	            SignBoard.setSignnum(rs.getInt("signnum"));
	            SignBoard.setTitle(rs.getString("TITLE"));
	            SignBoard.setContent(rs.getString("CONTENT"));
	            SignBoard.setStarter_name(rs.getString("gname") + " "
	                  + rs.getString("ename"));
	            SignBoard.setStarter_name(rs.getString("gname") + " "
	                  + rs.getString("mname"));
	            SignBoard.setWrite_date(rs.getDate("WRITE_DATE"));
	            SignBoard.setStatus(rs.getString("STATUS"));
	            SignBoard.setFile_sign(rs.getString("FILE_SIGN"));
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

	// ====== 문서 상태 함수===============================
	public void SignStatus(String status, int ref, int step) {

		String signStatus_sql = "";

		if (status == "반려") {
			signStatus_sql = "update sign set status = '반려' where step = ?";
		} else {
			signStatus_sql = "update sign set status = '?' where ref = ?";
		}

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(signStatus_sql);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}

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

import DTO.C_BrdDTO;

public class C_BrdDAO {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public C_BrdDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB연결 실패:" + e);
			return;
		}
	}
	
	//조회수 업데이트.
	public void setReadCountUpdate(int num) throws Exception{
		String sql="update C_BRD set COUNT = COUNT+1 where NUM = "+num;
		
		try{
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
		}catch(SQLException ex){
			System.out.println("setReadCountUpdate 에러 : "+ex);
		}
		finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {}
		}
	}
	
//	 게시판 리스트 출력
	public List getList(int page, int limit){//limit 페이지사이즈
		// 글 목록 보기
				/*
				 * 18건 
				 * pagesize = 5 
				 * pagelist = 4개        1~5 , 5~10 , 11~15 , 16~18 
				 * pageindex = 3        11~15개의 데이터
				 * 
				 * BoardBean page = new BoardBean(); =>Table Row 한건 여러건의 데이터 배열
				 */
				// List.jsp
				// page =2 , limit =10(pagesize)
		//글번호	제목	작성자	작성일	조회수
		String getC_BrdList_sql = "select * from (select rownum rnum, NUM,EMPNO,TITLE,CONTENT,REF,DPTH,STEP,COUNT,WRITE_DATE from (select * from C_BRD order by REF desc,STEP asc)) where rnum>=? and rnum<=?";
		
		List<C_BrdDTO> list = new ArrayList<C_BrdDTO>();
		
		// List<Article> articleList = new ArrayList<Article>();
				// 권장방식 generic 사용
				int startrow = (page - 1) * 10 + 1;
				// Code //읽기 시작할 row 번호.
				// (2-1)*10+1 (1)*10+1 10 +1 11
				// page 없어 : 1
				int endrow = startrow + limit - 1; // 읽을 마지막 row 번호.
				// 11 +10 => 21-1 => 20
				// page 없어 : 10
				try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(getC_BrdList_sql);
					pstmt.setInt(1, startrow); // 11 21 code
					pstmt.setInt(2, endrow); // 20 30 code
					rs = pstmt.executeQuery();

					while (rs.next()) {
						C_BrdDTO c_brd = new C_BrdDTO();
						c_brd.setNum(rs.getInt("NUM"));
						c_brd.setEmpno(rs.getInt("EMPNO"));
						c_brd.setTitle(rs.getString("TITLE"));
						c_brd.setContent(rs.getString("CONTENT"));
						c_brd.setNotice(rs.getString("NOTICE"));
						c_brd.setWrite_date(rs.getDate("WRITE_DATE"));
						c_brd.setRef(rs.getInt("REF"));
						c_brd.setDpth(rs.getInt("DPTH"));
						c_brd.setStep(rs.getInt("STEP"));
						c_brd.setCount(rs.getInt("COUNT"));
						c_brd.setEname(rs.getString("ENAME"));
						list.add(c_brd);
					}

					return list;
				} catch (Exception ex) {
					System.out.println("getC_BrdList 에러 : " + ex);
				} finally {
					if (rs != null) try { rs.close(); } catch (SQLException ex) {}
					if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
					if (conn != null) try { conn.close(); } catch (SQLException ex) {}
				}
				return null;
		}
	
	// 글 내용 보기
	
	public C_BrdDTO getDetail(int num){
		
		C_BrdDTO c_brd = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select * from c_brd where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				c_brd = new C_BrdDTO();
				c_brd.setNum(rs.getInt("NUM"));
				c_brd.setEmpno(rs.getInt("EMPNO"));
				c_brd.setTitle(rs.getString("TITLE"));
				c_brd.setContent(rs.getString("CONTENT"));
				c_brd.setNotice(rs.getString("NOTICE"));
				c_brd.setWrite_date(rs.getDate("WRITE_DATE"));
				c_brd.setRef(rs.getInt("REF"));
				c_brd.setDpth(rs.getInt("DPTH"));
				c_brd.setStep(rs.getInt("STEP"));
				c_brd.setEname(rs.getString("ENAME"));
				c_brd.setCount(rs.getInt("COUNT"));
			}
			return c_brd;
		} catch (Exception ex) {
			System.out.println("getDetail 에러 : " + ex);
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (conn != null) try { conn.close(); } catch (SQLException ex) {}
		}
		return null;
	}
	
	// 글 등록
	public boolean Insert(C_BrdDTO c_brd){
		
		int num = 0;
		String sql = "";
		int result = 0;
		
		try {
			
			sql = "insert into c_brd (NUM, EMPNO, TITLE, CONTENT, NOTICE, WRITE_DATE, REF, DPTH, STEP , ENAME , COUNT)"
					+ "values(Comp_board_num.nextval,?,?,?,?,sysdate,Comp_board_refer.nextval,0,0,?,0)";
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, c_brd.getEmpno());
			pstmt.setString(2, c_brd.getTitle());
			pstmt.setString(3, c_brd.getContent());
			pstmt.setString(4, c_brd.getNotice());
			pstmt.setString(5, c_brd.getEname());


			result = pstmt.executeUpdate();
			
			if (result == 0)
				return false;

			return true;
		} catch (Exception ex) {
			System.out.println("boardInsert 에러 : " + ex);
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (conn != null) try { conn.close(); } catch (SQLException ex) {}
		}
		return false;
	}
	
	// 글 답변 (key point)
	// 글을 읽고 그 글에 대한 답변(게시글)
//	public int Reply(C_BrdDTO c_brd){
//		// 답변 2개의 쿼리
//		// 1, update ... 내가 자리잡을 위치 board_re_seq
//		// 2, insert ... 실 데이터 처리
//		// 코드 구현
//		String c_brd_max_sql = "select max(num) from c_brd";
//		String sql = "";
//		int num = 0;
//		int result = 0;
//		
//		// 현재 내가 읽고 답변을 하려는 원본글의 정보
//		int ref = c_brd.getRef();
//		int dpth = c_brd.getDpth();
//		int step = c_brd.getStep();
//		
//		try {
//			conn = ds.getConnection();
//			pstmt = conn.prepareStatement(c_brd_max_sql);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				num = rs.getInt(1) + 1;
//			} else {
//				num = 1;
//			}
//			// update 문 (위치 확보)
//			sql = " UPDATE c_brd SET STEP = STEP +1 "
//					+ " WHERE REF = ? AND STEP > ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, ref);
//			pstmt.setInt(2, dpth);
//
//			result = pstmt.executeUpdate();
//
//			// insert board :(key point)
//			step = step + 1; // 현재 읽은 글 + 1
//			dpth = dpth + 1; // 현재 읽은 글 + 1
//
//			sql = "insert into c_brd (NUM, EMPNO, TITLE,";
//			sql += "CONTENT, NOTICE, WRITE_DATE, REF, DPTH, STEP)"
//					+ "values(?,?,?,?,?,?,?,?,?,?,sysdate)";
//			
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, num);
//			pstmt.setInt(2, c_brd.getEmpno());
//			pstmt.setString(3, c_brd.getTitle());
//			pstmt.setString(4, c_brd.getContent());
//			pstmt.setString(5, c_brd.getNotice());
//			pstmt.setDate(6, c_brd.getWrite_date());
//			pstmt.setInt(7, ref);
//			pstmt.setInt(8, dpth);
//			pstmt.setInt(9, step);
//			pstmt.executeUpdate();
//			
//			return num;
//		} catch (SQLException e) {
//			System.out.println("Reply Error : " + e.getMessage());
//		} finally {
//			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
//			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
//			if (conn != null) try { conn.close(); } catch (SQLException ex) {}
//		}
//		return 0;
//	}
//	
//	// 글 수정
//	public boolean Modify(C_BrdDTO modifyc_brd){
//		
//		String sql = "update c_brd set TITLE=?, CONTENT=? where NUM=?";
//		
//		try {
//			conn = ds.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, modifyc_brd.getTitle());
//			pstmt.setString(2, modifyc_brd.getContent());
//			pstmt.setInt(3, modifyc_brd.getNum());
//			pstmt.executeUpdate();
//			return true;
//		} catch (Exception ex) {
//			System.out.println("boardModify 에러 : " + ex);
//		} finally {
//			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
//			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
//			if (conn != null) try { conn.close(); } catch (SQLException ex) {}
//		}
//		return false;
//	}
//	
//	// 글 삭제
//		// delete.jsp
//		public boolean Delete(int num) {
//			// 주의점
//			// 규칙 : 원본글이 삭제되면 다 지워 (ref = 1 ) .....
//
//			// 규칙 : state 컬럼 : T , F 글이 삭제하는 것이 아니라 상태
//			// : update set state = F where num=1
//			// : F (삭제된 글) 문자만
//
//			// 규칙 : 원본글 답변 지워지지 않고 답변 이 있으면 삭제 금지
//			// : 답변 1개라도 있으면 원본글(삭제)
//			// : 답변에 답변이 1개라도 있다면 삭제금지
//
//			// Table column : state : t , f
//			// 원본글
//			// ->답변 삭제 (x) 답변
//			// ->답변_1
//			String c_brd_delete_sql = "delete from c_brd where num=?";
//
//			int result = 0;
//
//			try {
//				conn = ds.getConnection();
//				pstmt = conn.prepareStatement(c_brd_delete_sql);
//				pstmt.setInt(1, num);
//				result = pstmt.executeUpdate();
//				if (result == 0)
//					return false;
//
//				return true;
//			} catch (Exception ex) {
//				System.out.println("boardDelete 에러 : " + ex);
//			} finally {
//				try {
//					if (pstmt != null) pstmt.close();
//					if (conn != null) conn.close();
//				} catch (Exception ex) {
//					
//				}
//			}
//
//			return false;
//		}
//		
//		// 조회수 업데이트
//		// 테이블에 조회수가 없다..!!
//		
//		
//		
//		// 글쓴이인지 확인
//		// 맞는지 확실하지 않음...
//		public boolean isboardWriter(int num, String empno){
//			
//			String board_sql = "select * from c_brd where NUM=?";
//			
//			try{
//				conn = ds.getConnection();
//				pstmt = conn.prepareStatement(board_sql);
//				pstmt.setInt(1, num);
//				rs=pstmt.executeQuery();
//				rs.next();
//				
//				if(empno.equals(rs.getString("EMPNO"))){
//					return true;
//				}
//			}catch(SQLException ex){
//				System.out.println("isBoardWriter 에러 : "+ex);
//			}
//			finally{
//				try{
//					if(pstmt!=null)pstmt.close();
//					if(conn!=null)conn.close();
//				}
//				catch(Exception ex) {}
//			}
//			return false;
//		}
		
}

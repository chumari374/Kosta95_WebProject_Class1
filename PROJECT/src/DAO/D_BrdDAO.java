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
import DTO.D_BrdDTO;

public class D_BrdDAO {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public D_BrdDAO() {
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
		String sql="update D_BRD set COUNT = COUNT+1 where NUM = "+num;
		
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
	
	public List getNoticeList(){
		
		String getD_BrdList_sql = "select * from (select rownum rnum,NUM,EMPNO,TITLE,CONTENT,REF,DPTH,STEP,COUNT,WRITE_DATE,ENAME,NOTICE,DEPTCODE from (select * from d_brd where deptcode = ? and notice = 'true' order by num desc)) where rnum>=1 and rnum<=3";
		
		List<D_BrdDTO> list = new ArrayList<D_BrdDTO>();
		

				try {
					conn = ds.getConnection();
					pstmt = conn.prepareStatement(getD_BrdList_sql);

					rs = pstmt.executeQuery();

					while (rs.next()) {
						D_BrdDTO d_brd = new D_BrdDTO();
						d_brd.setNum(rs.getInt("NUM"));
						d_brd.setEmpno(rs.getInt("EMPNO"));
						d_brd.setTitle(rs.getString("TITLE"));
						d_brd.setContent(rs.getString("CONTENT"));
						d_brd.setNotice(rs.getString("NOTICE"));
						d_brd.setWrite_date(rs.getDate("WRITE_DATE"));
						d_brd.setRef(rs.getInt("REF"));
						d_brd.setDpth(rs.getInt("DPTH"));
						d_brd.setStep(rs.getInt("STEP"));
						d_brd.setCount(rs.getInt("COUNT"));
						d_brd.setEname(rs.getString("ENAME"));
						d_brd.setDeptcode(rs.getInt("DEPTCODE"));
						list.add(d_brd);
					}

					return list;
				} catch (Exception ex) {
					System.out.println("getNoticeList 에러 : " + ex);
				} finally {
					if (rs != null) try { rs.close(); } catch (SQLException ex) {}
					if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
					if (conn != null) try { conn.close(); } catch (SQLException ex) {}
				}
				return null;
		
	}
	
	public int getListCount() {
		// select count(*) from board
		int rowcount = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select count(*) from D_BRD");
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
	
//	 게시판 리스트 출력
//	public List getList(int page, int limit){//limit 페이지사이즈
	public List getBoardList(int page, int limit , int deptcode){//limit 페이지사이즈
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
	//	int limit = 10;
		String getD_BrdList_sql = "select * from (select rownum rnum, NUM,EMPNO,TITLE,CONTENT,REF,DPTH,STEP,COUNT,WRITE_DATE,ENAME,NOTICE,DEPTCODE from (select * from D_BRD where deptcode = ? order by REF desc,STEP asc)) where rnum>=? and rnum<=?";
		
		List<D_BrdDTO> list = new ArrayList<D_BrdDTO>();
		
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
					pstmt = conn.prepareStatement(getD_BrdList_sql);
					pstmt.setInt(1, deptcode); // 11 21 code
					pstmt.setInt(2, startrow); // 11 21 code
					pstmt.setInt(3, endrow); // 20 30 code
					rs = pstmt.executeQuery();

					while (rs.next()) {
						D_BrdDTO d_brd = new D_BrdDTO();
						d_brd.setNum(rs.getInt("NUM"));
						d_brd.setEmpno(rs.getInt("EMPNO"));
						d_brd.setTitle(rs.getString("TITLE"));
						d_brd.setContent(rs.getString("CONTENT"));
						d_brd.setNotice(rs.getString("NOTICE"));
						d_brd.setWrite_date(rs.getDate("WRITE_DATE"));
						d_brd.setRef(rs.getInt("REF"));
						d_brd.setDpth(rs.getInt("DPTH"));
						d_brd.setStep(rs.getInt("STEP"));
						d_brd.setCount(rs.getInt("COUNT"));
						d_brd.setEname(rs.getString("ENAME"));
						list.add(d_brd);
					}

					return list;
				} catch (Exception ex) {
					System.out.println("getBoardList 에러 : " + ex);
				} finally {
					if (rs != null) try { rs.close(); } catch (SQLException ex) {}
					if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
					if (conn != null) try { conn.close(); } catch (SQLException ex) {}
				}
				return null;
		}
	
	// 글 내용 보기
	
	public D_BrdDTO getDetail(int num){
		
		D_BrdDTO d_brd = null;
		
		try {
			conn = ds.getConnection();
			String sql = "select * from d_brd where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				d_brd = new D_BrdDTO();
				d_brd.setNum(rs.getInt("NUM"));
				d_brd.setEmpno(rs.getInt("EMPNO"));
				d_brd.setTitle(rs.getString("TITLE"));
				d_brd.setContent(rs.getString("CONTENT"));
				d_brd.setNotice(rs.getString("NOTICE"));
				d_brd.setWrite_date(rs.getDate("WRITE_DATE"));
				d_brd.setRef(rs.getInt("REF"));
				d_brd.setDpth(rs.getInt("DPTH"));
				d_brd.setStep(rs.getInt("STEP"));
				d_brd.setEname(rs.getString("ENAME"));
				d_brd.setCount(rs.getInt("COUNT"));
				d_brd.setDeptcode(rs.getInt("DEPTCODE"));
			}
			return d_brd;
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
	public boolean Insert(D_BrdDTO d_brd, int deptcode){
		
		int num = 0;
		String sql = "";
		int result = 0;
		
		try {
			
			sql = "insert into d_brd (NUM, EMPNO, TITLE, CONTENT, NOTICE, WRITE_DATE, REF, DPTH, STEP , ENAME , COUNT , DEPTCODE)"
					+ "values(Dept_board_num.nextval,?,?,?,?,sysdate,Dept_board_refer.nextval,0,0,?,0,?)";
			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, d_brd.getEmpno());
			pstmt.setString(2, d_brd.getTitle());
			pstmt.setString(3, d_brd.getContent());
			pstmt.setString(4, d_brd.getNotice());
			pstmt.setString(5, d_brd.getEname());
			pstmt.setInt(6, deptcode);


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
	public boolean Modify(C_BrdDTO modifyc_brd){
		
		String sql = "update c_brd set TITLE=?, CONTENT=? where NUM=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, modifyc_brd.getTitle());
			pstmt.setString(2, modifyc_brd.getContent());
			pstmt.setInt(3, modifyc_brd.getNum());
			pstmt.executeUpdate();
			return true;
		} catch (Exception ex) {
			System.out.println("boardModify 에러 : " + ex);
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (conn != null) try { conn.close(); } catch (SQLException ex) {}
		}
		return false;
	}
	
	// 글 삭제
		// delete.jsp
		public boolean Delete(int num) {
			// 주의점
			// 규칙 : 원본글이 삭제되면 다 지워 (ref = 1 ) .....

			// 규칙 : state 컬럼 : T , F 글이 삭제하는 것이 아니라 상태
			// : update set state = F where num=1
			// : F (삭제된 글) 문자만

			// 규칙 : 원본글 답변 지워지지 않고 답변 이 있으면 삭제 금지
			// : 답변 1개라도 있으면 원본글(삭제)
			// : 답변에 답변이 1개라도 있다면 삭제금지

			// Table column : state : t , f
			// 원본글
			// ->답변 삭제 (x) 답변
			// ->답변_1
			String c_brd_delete_sql = "delete from c_brd where num=?";

			int result = 0;

			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(c_brd_delete_sql);
				pstmt.setInt(1, num);
				result = pstmt.executeUpdate();
				if (result == 0)
					return false;

				return true;
			} catch (Exception ex) {
				System.out.println("boardDelete 에러 : " + ex);
			} finally {
				try {
					if (pstmt != null) pstmt.close();
					if (conn != null) conn.close();
				} catch (Exception ex) {
					
				}
			}

			return false;
		}
		
		// 조회수 업데이트
		// 테이블에 조회수가 없다..!!
		
		
		
		// 글쓴이인지 확인
		// 맞는지 확실하지 않음...
		public boolean isboardWriter(int num, int empno){
			
			String board_sql = "select * from c_brd where NUM=?";
			
			try{
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(board_sql);
				pstmt.setInt(1, num);
				rs=pstmt.executeQuery();
				rs.next();
				
				if(empno == rs.getInt("EMPNO")){
					return true;
				}
			}catch(SQLException ex){
				System.out.println("isBoardWriter 에러 : "+ex);
			}
			finally{
				try{
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}
				catch(Exception ex) {}
			}
			return false;
		}
		
		public int boardReply(C_BrdDTO board){
			String board_max_sql="select max(num) from c_brd";
			String sql="";
			int num=0;
			int result=0;
			
			int re_ref=board.getRef();
			int re_lev=board.getStep();
			int re_seq=board.getDpth();
			
			try{
				conn = ds.getConnection();
				pstmt=conn.prepareStatement(board_max_sql);
				rs = pstmt.executeQuery();
				if(rs.next())num =rs.getInt(1)+1;
				else num=1;
				
				sql="update c_brd set step=step+1 ";
				sql+="where ref=? and step>?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,re_ref);
				pstmt.setInt(2,re_seq);
				result=pstmt.executeUpdate();
				
				re_seq = re_seq + 1;
				re_lev = re_lev+1;
				
//				sql="insert into memberboard (BOARD_NUM,BOARD_ID,BOARD_SUBJECT,";
//				sql+="BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,";
//				sql+="BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE) ";
//				sql+="values(?,?,?,?,?,?,?,?,?,sysdate)";
				
				
				sql = "insert into c_brd (NUM, EMPNO, TITLE, CONTENT, NOTICE, WRITE_DATE, REF, DPTH, STEP , ENAME , COUNT)"
						+ "values(Comp_board_num.nextval,?,?,?,?,sysdate,?,?,?,?,0)";
				
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, board.getEmpno());
				pstmt.setString(2, board.getTitle());
				pstmt.setString(3, board.getContent());
				pstmt.setString(4, "false");
				pstmt.setInt(5, re_ref);
				pstmt.setInt(6, re_lev);
				pstmt.setInt(7, re_seq);
				pstmt.setString(8, board.getEname());
				
				
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, num);
//				pstmt.setString(2, board.getBOARD_ID());
//				pstmt.setString(3, board.getBOARD_SUBJECT());
//				pstmt.setString(4, board.getBOARD_CONTENT());
//				pstmt.setString(5, ""); //�떟�옣�뿉�뒗 �뙆�씪�쓣 �뾽濡쒕뱶�븯吏� �븡�쓬.
//				pstmt.setInt(6, re_ref);
//				pstmt.setInt(7, re_lev);
//				pstmt.setInt(8, re_seq);
//				pstmt.setInt(9, 0);
				pstmt.executeUpdate();
				return num;
			}catch(SQLException ex){
				System.out.println("boardReply 오류 : "+ex);
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
				if(conn!=null)try{conn.close();}catch(SQLException ex){}
			}
			return 0;
		}
		
}

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
	
	public int getListCount() {
		// select count(*) from board
		int rowcount = 0;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select count(*) from C_DBRD");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rowcount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {rs.close();} catch (SQLException s) {}
			try {pstmt.close();} catch (SQLException s) {}
			try {conn.close();} catch (SQLException s) {}
		}
		return rowcount;
	}
	
	public List getDataBoardList(int page, int limit){//limit 페이지사이즈
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
		//int limit = 10;
		String getC_DbrdList_sql = "select * from (select rownum rnum, NUM,EMPNO,TITLE,CONTENT,WRITE_DATE,DATA from C_DBRD) where rnum>=? and rnum<=?";
		
		List<C_DbrdDTO> list = new ArrayList<C_DbrdDTO>();
		
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
			pstmt = conn.prepareStatement(getC_DbrdList_sql);
			pstmt.setInt(1, startrow); // 11 21 code
			pstmt.setInt(2, endrow); // 20 30 code
			rs = pstmt.executeQuery();

			while (rs.next()) {
				C_DbrdDTO c_dbrd = new C_DbrdDTO();
				c_dbrd.setNum(rs.getInt("NUM"));
				c_dbrd.setEmpno(rs.getInt("EMPNO"));
				c_dbrd.setTitle(rs.getString("TITLE"));
				c_dbrd.setContent(rs.getString("CONTENT"));
				c_dbrd.setWrite_date(rs.getDate("WRITE_DATE"));
				c_dbrd.setData(rs.getString("DATA"));
				list.add(c_dbrd);
			}

		} catch (Exception ex) {
			System.out.println("getBoardList 에러 : " + ex);
		} finally {
			if (rs != null)
				try {rs.close();} catch (SQLException ex) {}
			if (pstmt != null)
				try {pstmt.close();} catch (SQLException ex) {}
			if (conn != null)
				try {conn.close();} catch (SQLException ex) {}
		}
		return list;
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

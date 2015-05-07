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

import DTO.MessageDTO;

public class MessageDAO {
	
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt; 
	ResultSet rs;
	
	public MessageDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB연결 실패:" + e);
			return;
		}
	}

	// 받은쪽지 리스트 출력
	public List<MessageDTO> getMessageList(int empno , String requesturl, int page, int limit){
		
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
		
		String getMessageList_sql = "";
		if(requesturl.equals("/Recieved.mb")){
		 /*getMessageList_sql = "select msgnum, empno, title, content, filepath, sendempno from message where sendempno=? and revdeletecheck=0 order by msgnum asc";*/
			getMessageList_sql = "select * from (select rownum rnum, msgnum, empno, title, content, filepath, sendempno from (select * from Message where sendempno=? and revdeletecheck=0 order by msgnum desc)) where rnum>=? and rnum<=?";
		}else if(requesturl.equals("/Sent.mb")){
		/*	getMessageList_sql = "select msgnum, empno, title, content, filepath, sendempno from message where empno=? and sentdeletecheck=0 order by msgnum asc";*/
			getMessageList_sql = "select * from (select rownum rnum, msgnum, empno, title, content, filepath, sendempno from (select * from message where empno=? and sentdeletecheck=0 order by msgnum desc)) where rnum>=? and rnum<=?";
		}
		List<MessageDTO> list = new ArrayList<MessageDTO>();
		
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
			pstmt = conn.prepareStatement(getMessageList_sql);
			pstmt.setInt(1, empno);
			pstmt.setInt(2, startrow); // 11 21 code
			pstmt.setInt(3, endrow); // 20 30 code
			rs = pstmt.executeQuery();
            
			while (rs.next()) {
				System.out.println(rs.getRow());
				System.out.println("empno.. : "+rs.getInt("EMPNO"));
				MessageDTO Messagedto = new MessageDTO();
				Messagedto.setMsgnum(rs.getInt("MSGNUM"));
				Messagedto.setEmpno(rs.getInt("EMPNO")); //보낸사람
				Messagedto.setTitle(rs.getString("TITLE"));
				Messagedto.setContent(rs.getString("CONTENT"));
				Messagedto.setFilepath(rs.getString("FILEPATH"));
				Messagedto.setSendempno(rs.getInt("SENDEMPNO")); //받는사람
				list.add(Messagedto); // key point (여러건의 데이터 collection사용)
				
			
			}
                
			return list;
		} catch (Exception ex) {
			System.out.println("MessageBoard 에러 : " + ex);
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (conn != null) try { conn.close(); } catch (SQLException ex) {}
		}
		return null;
	}
	
	
	
	// 메세지 내용보기
	public MessageDTO getMessageDetail(int msgnum){
		
		MessageDTO message = null;
		
		try{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select * from message where msgnum = ?");
			pstmt.setInt(1, msgnum);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				message = new MessageDTO();
				message.setMsgnum(rs.getInt("MSGNUM"));
				message.setEmpno(rs.getInt("EMPNO"));
				message.setTitle(rs.getString("TITLE"));
				message.setContent(rs.getString("CONTENT"));
				message.setFilepath(rs.getString("FILEPATH"));
				message.setSendempno(rs.getInt("SENDEMPNO"));
				message.setWrite_date(rs.getDate("WRITE_DATE"));
			}
		
			return message;
		}catch(Exception ex){
			System.out.println("getMessageDetail 에러 : " + ex);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn !=null)try{conn.close();}catch(SQLException ex){}
		}
		return null;
	}
	
	
	// 메세지 작성
	public boolean MessageWrite(MessageDTO MessageBoard){
		
		int msgnum = 0;
		String sql = "";

		int result = 0;
		
		try {

/*			if (rs.next())
				msgnum = rs.getInt(1) + 1;
			else
				msgnum = 1;
*/
			sql = "insert into Message (MSGNUM,EMPNO,TITLE,CONTENT,FILEPATH,SENDEMPNO,WRITE_DATE, REVDELETECHECK, SENTDELETECHECK)"
					+ " values(MSGNUM.NEXTVAL,?,?,?,?,?,SYSDATE, 0,0)";
			
			/*rs = pstmt.executeQuery();*/
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, msgnum);
			pstmt.setInt(1, MessageBoard.getEmpno());
			pstmt.setString(2,MessageBoard.getTitle());
			pstmt.setString(3, MessageBoard.getContent());
			pstmt.setString(4, MessageBoard.getFilepath());
			pstmt.setInt(5, MessageBoard.getSendempno());
			
			
			result = pstmt.executeUpdate();
			if (result == 0)
				return false;

			return true;
		} catch (Exception ex) {
			System.out.println("MessageWrite 에러 : " + ex);
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (conn != null) try { conn.close(); } catch (SQLException ex) {}
		}
		return false;
	}
	
	//메세지 삭제
	public int messageDelete(int msgnum, String requesturl){
		String messageDelete_sql = "";
		if(requesturl.equals("/RecievedDeleteAction.mb")){
			messageDelete_sql = "update message set revdeletecheck=1 where msgnum=?";
			//update 받아온 메세지번호의 revdeletecheck 1로 변경
		}else if(requesturl.equals("/SentDeleteAction.mb")){
			messageDelete_sql = "update message set sentdeletecheck=1 where msgnum=?";
			//update 받아온 메세지번호의 sentdeletecheck 1로 변경
		}
	
		
		int result=0;
		
		try{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(messageDelete_sql);
			pstmt.setInt(1, msgnum);
			result=pstmt.executeUpdate();
			
			return result;
		}catch(Exception ex){
			System.out.println("messageDelete 에러 : "+ex);
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {}
		}
		
		return result;
	}
	
	
	

	public int getMessageListCount() {
			// select count(*) from board
			int rowcount = 0;
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement("select count(*) from Message");
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



// 메세지 답변
public boolean MessageReply(MessageDTO MessageBoard){
	
	int msgnum = 0;
	String sql = "";

	int result = 0;
	
	try {

/*			if (rs.next())
			msgnum = rs.getInt(1) + 1;
		else
			msgnum = 1;
*/
		sql = "insert into Message (MSGNUM,EMPNO,TITLE,CONTENT,FILEPATH,SENDEMPNO,WRITE_DATE, REVDELETECHECK, SENTDELETECHECK)"
				+ " values(MSGNUM.NEXTVAL,?,?,?,?,?,SYSDATE, 0,0)";
		
		/*rs = pstmt.executeQuery();*/
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(sql);
//		pstmt.setInt(1, msgnum);
		pstmt.setInt(1, MessageBoard.getEmpno());
		pstmt.setString(2,MessageBoard.getTitle());
		pstmt.setString(3, MessageBoard.getContent());
		pstmt.setString(4, MessageBoard.getFilepath());
		pstmt.setInt(5, MessageBoard.getSendempno());
		
		
		result = pstmt.executeUpdate();
		if (result == 0)
			return false;

		return true;
	} catch (Exception ex) {
		System.out.println("MessageReply 에러 : " + ex);
	} finally {
		if (rs != null) try { rs.close(); } catch (SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
		if (conn != null) try { conn.close(); } catch (SQLException ex) {}
	}
	return false;
    }
}

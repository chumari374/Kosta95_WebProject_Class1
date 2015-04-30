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

	// 메세지 리스트 출력
	public List<MessageDTO> getMessageList(int empno){
		String getMessageList_sql = "select * from msgnum, empno, title from message where sendempno=?";
		
		List<MessageDTO> list = new ArrayList<MessageDTO>();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(getMessageList_sql);
			pstmt.setInt(1, empno);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MessageDTO MessageBoard = new MessageDTO();
				MessageBoard.setMsgnum(rs.getInt("MSGNUM"));
				MessageBoard.setEmpno(rs.getInt("EMPNO"));
				MessageBoard.setTitle(rs.getString("TITLE"));
				MessageBoard.setContent(rs.getString("CONTENT"));
				MessageBoard.setFilepath(rs.getString("FILEPATH"));
				MessageBoard.setSendempno(rs.getInt("SENDEMPNO"));
				list.add(MessageBoard); // key point (여러건의 데이터 collection사용)
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
	public MessageDTO getMessageDetail(int num){
		
		MessageDTO message = null;
		
		try{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select * from message where msgnum = ?");
			pstmt.setInt(1, num);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				message = new MessageDTO();
				message.setMsgnum(rs.getInt("MSGNUM"));
				message.setEmpno(rs.getInt("EMPNO"));
				message.setTitle(rs.getString("TITLE"));
				message.setContent(rs.getString("CONTENT"));
				message.setFilepath(rs.getString("FILEPATH"));
				message.setSendempno(rs.getInt("SENDEMPNO"));
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
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select max(msgnum) from message");
			rs = pstmt.executeQuery();

/*			if (rs.next())
				msgnum = rs.getInt(1) + 1;
			else
				msgnum = 1;
*/
			sql = "insert into Message (MSGNUM,SENDEMPNO,TITLE,CONTENT,FILEPATH,EMPNO,ENAME)"
					+ " values(MSGNUM.NEXTVAL,?,?,?,?,?)";

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
	public boolean messageDelete(int num){
		
		String messageDelete_sql = "delete from message where msgnum=?";
		
		int result=0;
		
		try{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(messageDelete_sql);
			pstmt.setInt(1, num);
			result=pstmt.executeUpdate();
			if(result==0)return false;
			
			return true;
		}catch(Exception ex){
			System.out.println("messageDelete 에러 : "+ex);
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {}
		}
		
		return false;
	}
	
	
	

	public int getMessageListCount() {
			// select count(*) from board
			int rowcount = 0;
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement("select count(*) from C_BRD");
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
		};
	}



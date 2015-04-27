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
import DTO.SignDTO;

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
	
	// 메세지 작성
	public boolean MessageWrite(MessageDTO MessageBoard){
		
		int num = 0;
		String sql = "";

		int result = 0;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select max(msgnum) from message");
			rs = pstmt.executeQuery();

			if (rs.next())
				num = rs.getInt(1) + 1;
			else
				num = 1;

			sql = "insert into MessageBoard (MSGNUM,EMPNO,TITLE,CONTENT,";
			sql += "FILEPATH, SENDEMPNO)"
					+ " values(?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, MessageBoard.getEmpno());
			pstmt.setString(3,MessageBoard.getTitle());
			pstmt.setString(4, MessageBoard.getContent());
			pstmt.setString(5, MessageBoard.getFilepath());
			pstmt.setInt(6, MessageBoard.getSendempno());
			
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
}

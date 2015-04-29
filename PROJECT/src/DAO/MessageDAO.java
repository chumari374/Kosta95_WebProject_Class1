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
			System.out.println("DB���� ����:" + e);
			return;
		}
	}

	// �޼��� ����Ʈ ���
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
				list.add(MessageBoard); // key point (�������� ������ collection���)
			}

			return list;
		} catch (Exception ex) {
			System.out.println("MessageBoard ���� : " + ex);
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (conn != null) try { conn.close(); } catch (SQLException ex) {}
		}
		return null;
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
	
/*//	 �Խ��� ����Ʈ ���
//	public List getList(int page, int limit){//limit ������������
	public List getBoardList(int page, int limit){//limit ������������
		// �� ��� ����
				
				 * 18�� 
				 * pagesize = 5 
				 * pagelist = 4��        1~5 , 5~10 , 11~15 , 16~18 
				 * pageindex = 3        11~15���� ������
				 * 
				 * BoardBean page = new BoardBean(); =>Table Row �Ѱ� �������� ������ �迭
				 
				// List.jsp
				// page =2 , limit =10(pagesize)
		//�۹�ȣ	����	�ۼ���	�ۼ���	��ȸ��
	//	int limit = 10;
		String getC_BrdList_sql = "select * from (select rownum rnum, NUM,EMPNO,TITLE,CONTENT,REF,DPTH,STEP,COUNT,WRITE_DATE,ENAME,NOTICE from (select * from C_BRD order by REF desc,STEP asc)) where rnum>=? and rnum<=?";
		
		List<C_BrdDTO> list = new ArrayList<C_BrdDTO>();
		
		// List<Article> articleList = new ArrayList<Article>();
				// ������ generic ���
				int startrow = (page - 1) * 10 + 1;
				// Code //�б� ������ row ��ȣ.
				// (2-1)*10+1 (1)*10+1 10 +1 11
				// page ���� : 1
				int endrow = startrow + limit - 1; // ���� ������ row ��ȣ.
				// 11 +10 => 21-1 => 20
				// page ���� : 10
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
					System.out.println("getBoardList ���� : " + ex);
				} finally {
					if (rs != null) try { rs.close(); } catch (SQLException ex) {}
					if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
					if (conn != null) try { conn.close(); } catch (SQLException ex) {}
				}
				return null;
		}
	
	*/
	
	// �޼��� ���뺸��
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
			System.out.println("getMessageDetail ���� : " + ex);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn !=null)try{conn.close();}catch(SQLException ex){}
		}
		return null;
	}
	
	// �޼��� �ۼ�
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
			System.out.println("MessageWrite ���� : " + ex);
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (conn != null) try { conn.close(); } catch (SQLException ex) {}
		}
		return false;
	}
	
	//�޼��� ����
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
			System.out.println("messageDelete ���� : "+ex);
		}finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {}
		}
		
		return false;
	}

}

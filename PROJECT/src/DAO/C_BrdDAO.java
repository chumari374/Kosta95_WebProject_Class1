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
			System.out.println("DB���� ����:" + e);
			return;
		}
	}
	
	//��ȸ�� ������Ʈ.
	public void setReadCountUpdate(int num) throws Exception{
		String sql="update C_BRD set COUNT = COUNT+1 where NUM = "+num;
		
		try{
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.executeUpdate();
		}catch(SQLException ex){
			System.out.println("setReadCountUpdate ���� : "+ex);
		}
		finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {}
		}
	}
	
//	 �Խ��� ����Ʈ ���
	public List getList(int page, int limit){//limit ������������
		// �� ��� ����
				/*
				 * 18�� 
				 * pagesize = 5 
				 * pagelist = 4��        1~5 , 5~10 , 11~15 , 16~18 
				 * pageindex = 3        11~15���� ������
				 * 
				 * BoardBean page = new BoardBean(); =>Table Row �Ѱ� �������� ������ �迭
				 */
				// List.jsp
				// page =2 , limit =10(pagesize)
		//�۹�ȣ	����	�ۼ���	�ۼ���	��ȸ��
		String getC_BrdList_sql = "select * from (select rownum rnum, NUM,EMPNO,TITLE,CONTENT,REF,DPTH,STEP,COUNT,WRITE_DATE from (select * from C_BRD order by REF desc,STEP asc)) where rnum>=? and rnum<=?";
		
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
					System.out.println("getC_BrdList ���� : " + ex);
				} finally {
					if (rs != null) try { rs.close(); } catch (SQLException ex) {}
					if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
					if (conn != null) try { conn.close(); } catch (SQLException ex) {}
				}
				return null;
		}
	
	// �� ���� ����
	
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
			System.out.println("getDetail ���� : " + ex);
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (conn != null) try { conn.close(); } catch (SQLException ex) {}
		}
		return null;
	}
	
	// �� ���
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
			System.out.println("boardInsert ���� : " + ex);
		} finally {
			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
			if (conn != null) try { conn.close(); } catch (SQLException ex) {}
		}
		return false;
	}
	
	// �� �亯 (key point)
	// ���� �а� �� �ۿ� ���� �亯(�Խñ�)
//	public int Reply(C_BrdDTO c_brd){
//		// �亯 2���� ����
//		// 1, update ... ���� �ڸ����� ��ġ board_re_seq
//		// 2, insert ... �� ������ ó��
//		// �ڵ� ����
//		String c_brd_max_sql = "select max(num) from c_brd";
//		String sql = "";
//		int num = 0;
//		int result = 0;
//		
//		// ���� ���� �а� �亯�� �Ϸ��� �������� ����
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
//			// update �� (��ġ Ȯ��)
//			sql = " UPDATE c_brd SET STEP = STEP +1 "
//					+ " WHERE REF = ? AND STEP > ?";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, ref);
//			pstmt.setInt(2, dpth);
//
//			result = pstmt.executeUpdate();
//
//			// insert board :(key point)
//			step = step + 1; // ���� ���� �� + 1
//			dpth = dpth + 1; // ���� ���� �� + 1
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
//	// �� ����
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
//			System.out.println("boardModify ���� : " + ex);
//		} finally {
//			if (rs != null) try { rs.close(); } catch (SQLException ex) {}
//			if (pstmt != null) try { pstmt.close(); } catch (SQLException ex) {}
//			if (conn != null) try { conn.close(); } catch (SQLException ex) {}
//		}
//		return false;
//	}
//	
//	// �� ����
//		// delete.jsp
//		public boolean Delete(int num) {
//			// ������
//			// ��Ģ : �������� �����Ǹ� �� ���� (ref = 1 ) .....
//
//			// ��Ģ : state �÷� : T , F ���� �����ϴ� ���� �ƴ϶� ����
//			// : update set state = F where num=1
//			// : F (������ ��) ���ڸ�
//
//			// ��Ģ : ������ �亯 �������� �ʰ� �亯 �� ������ ���� ����
//			// : �亯 1���� ������ ������(����)
//			// : �亯�� �亯�� 1���� �ִٸ� ��������
//
//			// Table column : state : t , f
//			// ������
//			// ->�亯 ���� (x) �亯
//			// ->�亯_1
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
//				System.out.println("boardDelete ���� : " + ex);
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
//		// ��ȸ�� ������Ʈ
//		// ���̺� ��ȸ���� ����..!!
//		
//		
//		
//		// �۾������� Ȯ��
//		// �´��� Ȯ������ ����...
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
//				System.out.println("isBoardWriter ���� : "+ex);
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

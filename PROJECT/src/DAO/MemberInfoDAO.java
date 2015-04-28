package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.MemberInfoDTO;
import DTO.MessageDTO;

public class MemberInfoDAO {
	
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public MemberInfoDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB연결 실패:" + e);
			return;
		}
	}
	
	// 맴버정보출력
	public MemberInfoDTO getMemberInfo(int num){
		
		MemberInfoDTO memberinfo = null;
		
		try{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select * from memberinfo where empno = ?");
			pstmt.setInt(1, num);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				memberinfo = new MemberInfoDTO();
				memberinfo.setP_picture(rs.getString("P_PICTURE"));
				memberinfo.setP_content(rs.getString("P_CONTENT"));
				memberinfo.setEmpno(rs.getInt("EMPNO"));
				memberinfo.setEname(rs.getString("ENAME"));
				memberinfo.setCelphone(rs.getString("CELPHONE"));
				memberinfo.setEmail(rs.getString("EMAIL"));
				memberinfo.setDeptname(rs.getString("DEPTNAME"));
				memberinfo.setTeamname(rs.getString("TEAMNAME"));
				memberinfo.setGradename(rs.getString("GRADENAME"));
				memberinfo.setEmptel(rs.getString("EMPTEL"));
			}
			//return memberinfo;
			
		}catch(Exception ex){
			System.out.println("getMemberInfo 에러 : " + ex);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn !=null)try{conn.close();}catch(SQLException ex){}
		}
		return memberinfo;
	}
}

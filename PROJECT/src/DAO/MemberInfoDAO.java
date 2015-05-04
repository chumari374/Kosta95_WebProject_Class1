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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import DTO.MemberInfoDTO;

//Memberinfo view 에관한 클래스
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
			System.out.println("DB���� ����:" + e);
			return;
		}
	}
	
	// 맴버정보추출(사번)
	public MemberInfoDTO getMemberInfo(int num){
		
		MemberInfoDTO memberinfo = new MemberInfoDTO();
		
		try{
			conn = ds.getConnection();
			//사번에 대한 모든 정보추출
			pstmt = conn.prepareStatement("select * from memberinfo where empno = ?");
			pstmt.setInt(1, num);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()){
				memberinfo = new MemberInfoDTO();
				memberinfo.setP_picture(rs.getString("P_PICTURE"));
				memberinfo.setP_content(rs.getString("P_CONTENT"));
				memberinfo.setEmpno(rs.getInt("EMPNO"));
				memberinfo.setEname(rs.getString("ENAME"));
				memberinfo.setBirth(rs.getDate("BIRTH"));
				memberinfo.setSex(rs.getString("SEX"));
				memberinfo.setCelphone(rs.getString("CELPHONE"));
				memberinfo.setEmail(rs.getString("EMAIL"));
				memberinfo.setDeptname(rs.getString("DEPTNAME"));
				memberinfo.setTeamname(rs.getString("TEAMNAME"));
				memberinfo.setGradename(rs.getString("GRADENAME"));
				memberinfo.setEmptel(rs.getString("EMPTEL"));
			}
			
		}catch(Exception ex){
			System.out.println("getMemberInfo ���� : " + ex);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn !=null)try{conn.close();}catch(SQLException ex){}
		}
		return memberinfo;
	}
	
	// �������Ʈ ���(���ã�⿡��)
	public List MemberList(){
		
		List list = new ArrayList();
		
		try{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select deptname, teamname, ename, gradename, emptel, celphone from memberinfo order by grade");
			
			rs= pstmt.executeQuery();
			
			while(rs.next()){
				MemberInfoDTO memberinfo = new MemberInfoDTO();
				memberinfo.setDeptname(rs.getString("DEPTNAME"));
				memberinfo.setTeamname(rs.getString("TEAMNAME"));
				memberinfo.setEname(rs.getString("ENAME"));
				memberinfo.setGradename(rs.getString("GRADENAME"));
				memberinfo.setEmptel(rs.getString("EMPTEL"));
				memberinfo.setCelphone(rs.getString("CELPHONE"));
				list.add(memberinfo);
			}
			
		}catch(Exception ex){
			System.out.println("getMemberInfo ���� : " + ex);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn !=null)try{conn.close();}catch(SQLException ex){}
		}
		return list;
		
	}
	
	// ��� ����Ʈ JSON ��ü��... 
	public JSONArray MemberListJSON(){
		
		JSONArray rows = new JSONArray();
		
		try{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select deptname, teamname, ename, gradename, emptel, celphone from memberinfo order by grade");
			
			rs= pstmt.executeQuery();
			
			while(rs.next()){
				JSONObject jsonobject = new JSONObject();
				jsonobject.put("deptname", rs.getString("deptname"));
				jsonobject.put("teamname", rs.getString("teamname"));
				jsonobject.put("ename", rs.getString("ename"));
				jsonobject.put("gradename", rs.getString("gradename"));
				jsonobject.put("emptel", rs.getString("emptel"));
				jsonobject.put("celphone", rs.getString("celphone"));
				rows.add(jsonobject);
			}
			
		}catch(Exception ex){
			System.out.println("getMemberInfo ���� : " + ex);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn !=null)try{conn.close();}catch(SQLException ex){}
		}
		return rows;	
	}
}

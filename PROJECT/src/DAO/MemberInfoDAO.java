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
import DTO.AccountsDTO;
import DTO.MemberInfoDTO;

//Memberinfo view �뿉愿��븳 �겢�옒�뒪
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
			System.out.println("DB占쏙옙占쏙옙 占쏙옙占쏙옙:" + e);
			return;
		}
	}
	
	// 留대쾭�젙蹂댁텛異�(�궗踰�)
	public MemberInfoDTO getMemberInfo(int num){
		
		MemberInfoDTO memberinfo = new MemberInfoDTO();
		
		try{
			conn = ds.getConnection();
			//�궗踰덉뿉 ���븳 紐⑤뱺 �젙蹂댁텛異�
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
			System.out.println("getMemberInfo 占쏙옙占쏙옙 : " + ex);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn !=null)try{conn.close();}catch(SQLException ex){}
		}
		return memberinfo;
	}
	
	// 占쏙옙占쏙옙占쏙옙占싣� 占쏙옙占�(占쏙옙占시ｏ옙藪∽옙占�)
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
			System.out.println("getMemberInfo 占쏙옙占쏙옙 : " + ex);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn !=null)try{conn.close();}catch(SQLException ex){}
		}
		return list;
		
	}
	
	// 占쏙옙占� 占쏙옙占쏙옙트 JSON 占쏙옙체占쏙옙... 
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
			System.out.println("getMemberInfo 占쏙옙占쏙옙 : " + ex);
		}finally{
			if(rs!=null)try{rs.close();}catch(SQLException ex){}
			if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn !=null)try{conn.close();}catch(SQLException ex){}
		}
		return rows;	
	}
	
	public int MemberInfoUpdate(int empno, MemberInfoDTO member){
		int result = 0;
		try{
			conn = ds.getConnection();
			String sql = "update memberinfo set deptcode=?, teamcode=?, grade=? where empno=? " + ";"
						+ "update memberinfo set emptel=? where empno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member.getDeptcode());
			pstmt.setInt(2, member.getTeamcode());
			pstmt.setInt(3, member.getGrade());
			pstmt.setInt(4, member.getEmpno());
			pstmt.setString(5, member.getEmptel());
			pstmt.setInt(6, member.getEmpno());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e){
			e.getStackTrace();
		}finally{
			if (rs != null)try {rs.close();} catch (Exception e) {}
			if (pstmt != null)try {pstmt.close();} catch (Exception e) {}
			if (conn != null)try {conn.close();} catch (Exception e) {}
		}
		return result;
	}
}

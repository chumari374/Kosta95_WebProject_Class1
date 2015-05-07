package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.EmpDTO;

public class EmpDAO {
	DataSource ds;
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public EmpDAO(){
		try{
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		}catch(Exception e){
			e.getStackTrace();
			return;
		}
	}
	
	public int EmpInsert(EmpDTO Emp){
		int result = 0;
		try{
			/*
			EMPNO NUMBER NOT NULL,
   			ENAME VARCHAR2(20) NOT NULL,
   			TEAMNAME VARCHAR2(20),
   			SIGNCHECK VARCHAR2(10) NOT NULL,
   			MSGCHECK VARCHAR2(10) NOT NULL,
   			ADMIN VARCHAR2(10) NOT NULL, 
   			DEPTCODE NUMBER,
   			TEAMCODE NUMBER,
   			GRADE NUMBER NOT NULL
			*/
			conn = ds.getConnection();
			String sql = "insert into emp(empno,ename,teamname,signcheck,msgcheck,admin,deptcode,teamcode,grade) "
					+ "values(?,?,?,'true','true',?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Emp.getEmpno());
			ps.setString(2, Emp.getEname());
			ps.setString(3, Emp.getTeamname());
			ps.setString(4, Emp.getAdmin());
			ps.setInt(5, Emp.getDeptcode());
			ps.setInt(6, Emp.getTeamcode());
			ps.setInt(7, Emp.getGrade());
			
			result = ps.executeUpdate();
			
		}catch(Exception e){
			e.getStackTrace();
		}finally{
			if (rs != null)try {rs.close();} catch (Exception e) {}
			if (ps != null)try {ps.close();} catch (Exception e) {}
			if (conn != null)try {conn.close();} catch (Exception e) {}
		}
		return result;
	}
}

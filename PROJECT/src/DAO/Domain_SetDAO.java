package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import DTO.Domain_SetDTO;

public class Domain_SetDAO {
	DataSource ds;
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public Domain_SetDAO(){
		try{
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		}catch(Exception e){
			e.getStackTrace();
			return;
		}
	}
	
	public int Domain_SetInsert(Domain_SetDTO domain_set){
		int result = 0;
		try{
			/*
			EMPNO NUMBER NOT NULL, 
   			EMPTEL VARCHAR2(20) NOT NULL, 
   			HIREDATE DATE NOT NULL, 
   			FIREDATE DATE,
   			SEX VARCHAR2(200) NOT NULL,
   			BIRTH DATE NOT NULL, 
   			exist VARCHAR2(10) NOT NULL 
			*/
			conn = ds.getConnection();
			String sql = "insert into domain_set(empno,emptel,hiredate,sex,birth,exist) "
					+ "values(?,?,sysdate,?,?,'true')";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, domain_set.getEmpno());
			ps.setString(2, domain_set.getEmptel());
			ps.setString(3, domain_set.getSex());
			ps.setDate(4, domain_set.getBirth());
			
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

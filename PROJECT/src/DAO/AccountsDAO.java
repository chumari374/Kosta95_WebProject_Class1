package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import DTO.AccountsDTO;


public class AccountsDAO {
	DataSource ds;
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public AccountsDAO(){
		try{
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		}catch(Exception e){
			System.out.println("DB���� ����:" + e);
			return;
		}
	}
	
	public int AccountsInsert(AccountsDTO accounts){
		int result = 0;
		try{
			conn = ds.getConnection();
			String sql = "insert into accounts(empno,pwd,email,addr,celphone,p_picture,p_content) values(?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, accounts.getEmpno());
			ps.setString(2, accounts.getPwd());
			ps.setString(3, accounts.getEmail());
			ps.setString(4, accounts.getAddr());
			ps.setString(5, accounts.getCelphone());
			ps.setString(6, accounts.getP_picture());
			ps.setString(7, accounts.getP_content());
			
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
	
	public AccountsDTO pwd_search(int empno){
		AccountsDTO account = null;
		try{
			conn = ds.getConnection();
			String sql = "select * from accounts where empno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, empno);
			
			rs = ps.executeQuery();
			if(rs.next()){
				account.setEmpno(rs.getInt("empno"));
				account.setPwd(rs.getString("pwd"));
				account.setEmail(rs.getString("email"));
				account.setAddr(rs.getString("addr"));
				account.setCelphone(rs.getString("celphone"));
				account.setP_picture(rs.getString("p_picture"));
				account.setP_content(rs.getString("p_content"));
			}
		}catch(Exception e){
			e.getStackTrace();
		}finally{
			if (rs != null)try {rs.close();} catch (Exception e) {}
			if (ps != null)try {ps.close();} catch (Exception e) {}
			if (conn != null)try {conn.close();} catch (Exception e) {}
		}
		return account;
	}
}
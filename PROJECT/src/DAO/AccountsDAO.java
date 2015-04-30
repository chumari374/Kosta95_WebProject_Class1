package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;




import DTO.AccountsDTO;
import DTO.EmpDTO;


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
			e.getStackTrace();
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
	
	public int AccountUpdate(int empno,AccountsDTO account){
		int result = 0;
		try{
			conn = ds.getConnection();
			String sql = "update accounts set pwd=?, email=?, addr=?, celphone=?, p_picture=?, p_content=? where empno=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, account.getPwd());
			ps.setString(2, account.getEmail());
			ps.setString(3, account.getAddr());
			ps.setString(4, account.getCelphone());
			ps.setString(5, account.getP_picture());
			ps.setString(6, account.getP_content());
			ps.setInt(7, empno);
			
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
		AccountsDTO account = new AccountsDTO();
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
	
	public boolean isEmail(int empno,String email){
		boolean isEmail = false;
		try {
			conn = ds.getConnection();
			String sql = "select empno, email from accounts where empno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, empno);
			
			rs = ps.executeQuery();
			if(rs.next()){
				isEmail = rs.getString("email").equals(email) ? true:false;
			}
		}catch(Exception e){
			e.getStackTrace();
		}finally{
			if (rs != null)try {rs.close();} catch (Exception e) {}
			if (ps != null)try {ps.close();} catch (Exception e) {}
			if (conn != null)try {conn.close();} catch (Exception e) {}
		}
		return isEmail;
	}
	
	public boolean isExistEmpno(int empno){
		boolean isExistEmpno = false;
		try {
			conn = ds.getConnection();
			String sql = "select empno from accounts";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()){
				if(rs.getInt("empno")==empno){
					isExistEmpno = true;
				}
			}
		}catch(Exception e){
			e.getStackTrace();
		}finally{
			if (rs != null)try {rs.close();} catch (Exception e) {}
			if (ps != null)try {ps.close();} catch (Exception e) {}
			if (conn != null)try {conn.close();} catch (Exception e) {}
		}
		return isExistEmpno;
	}
	
	public boolean isExistEmail(String email){
		boolean isExistEmail = false;
		try {
			conn = ds.getConnection();
			String sql = "select email from accounts";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()){
				System.out.println(rs.getString("email")+" / "+email);
				if(rs.getString("email").equals(email)){
					isExistEmail = true;
				}
			}
		}catch(Exception e){
			e.getStackTrace();
		}finally{
			if (rs != null)try {rs.close();} catch (Exception e) {}
			if (ps != null)try {ps.close();} catch (Exception e) {}
			if (conn != null)try {conn.close();} catch (Exception e) {}
		}
		return isExistEmail;
	}
	
	public boolean loginCheck(int empno,String pwd){
		boolean loginCheck = false;
		try {
			conn = ds.getConnection();
			String sql = "select pwd from accounts where empno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, empno);
			
			rs = ps.executeQuery();
			if(rs.next()){
				if(rs.getString("pwd").equals(pwd)){
					loginCheck = true;
				}
			}
		}catch(Exception e){
			e.getStackTrace();
		}finally{
			if (rs != null)try {rs.close();} catch (Exception e) {}
			if (ps != null)try {ps.close();} catch (Exception e) {}
			if (conn != null)try {conn.close();} catch (Exception e) {}
		}
		return loginCheck;
	}
	
	public EmpDTO getEmp(int empno){
		EmpDTO emp = new EmpDTO();
		try{
			conn = ds.getConnection();
			String sql = "select empno,ename,teamcode,teamname,deptcode,grade,admin from emp where empno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, empno);
			
			rs = ps.executeQuery();
			if(rs.next()){
				emp.setEmpno(rs.getInt("empno"));
				emp.setEname(rs.getString("ename"));
				emp.setTeamcode(rs.getInt("teamcode"));
				emp.setTeamname(rs.getString("teamname"));
				emp.setDeptcode(rs.getInt("deptcode"));
				emp.setGrade(rs.getInt("grade"));
				emp.setAdmin(rs.getString("admin"));
			}
		}catch(Exception e){
			e.getStackTrace();
		}finally{
			if (rs != null)try {rs.close();} catch (Exception e) {}
			if (ps != null)try {ps.close();} catch (Exception e) {}
			if (conn != null)try {conn.close();} catch (Exception e) {}
		}
		return emp;
	}
}

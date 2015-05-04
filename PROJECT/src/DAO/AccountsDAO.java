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

//Accounts 테이블에 관련된 함수
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
	
	//계정 등록 함수(accounts 객체)
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
	
	//암호 추출함수(사번)
	public AccountsDTO pwd_search(int empno){
		AccountsDTO account = new AccountsDTO();
		try{
			conn = ds.getConnection();
			//사번의 모든 정보 추출
			String sql = "select * from accounts where empno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, empno); //인자에 파라메터로 받은 사번 설정
			
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
		return account; //사번의 정보를 리턴
	}
	
	//사번에대한 이메일 판별 함수(사번,이메일)
	public boolean isEmail(int empno,String email){
		boolean isEmail = false;
		try {
			conn = ds.getConnection();
			// 사번의 이메일 추출
			String sql = "select empno, email from accounts where empno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, empno); //인자에 파라메터로 받은 사번 설정
			
			rs = ps.executeQuery();
			if(rs.next()){
				//삼항연산자
				//추출한 이메일이 파라메터로 받은 이메일과 같다면 true
				//아니면 false
				isEmail = rs.getString("email").equals(email) ? true:false;
			}
		}catch(Exception e){
			e.getStackTrace();
		}finally{
			if (rs != null)try {rs.close();} catch (Exception e) {}
			if (ps != null)try {ps.close();} catch (Exception e) {}
			if (conn != null)try {conn.close();} catch (Exception e) {}
		}
		return isEmail; //참,거짓 리턴
	}
	
	//사번 존재 여부 함수(사번)
	public boolean isExistEmpno(int empno){
		boolean isExistEmpno = false;
		try {
			conn = ds.getConnection();
			//accounts 테이블의 모든 사번 추출
			String sql = "select empno from accounts";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()){
				if(rs.getInt("empno")==empno){ //사번이 존재하면 true
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
	
	//이메일 존재 여부 함수(이메일)
	public boolean isExistEmail(String email){
		boolean isExistEmail = false;
		try {
			conn = ds.getConnection();
			//accounts 테이블의 모든 이메일 추출
			String sql = "select email from accounts";
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()){
				System.out.println(rs.getString("email")+" / "+email);
				if(rs.getString("email").equals(email)){ //이메일이 존재하면 true
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
	
	//사번과 비밀번호 체크 함수(사번,비번)
	public boolean loginCheck(int empno,String pwd){
		boolean loginCheck = false;
		try {
			conn = ds.getConnection();
			//사번의 비밀번호 추출
			String sql = "select pwd from accounts where empno=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, empno); //인자에 파라메터로 받은 사번 설정
			
			rs = ps.executeQuery();
			if(rs.next()){
				//추출한 비밀번호와 파라메터로 받은 비밀번호가 일치한다면 true
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
	
	//예외: 사원정보 추출함수(사번)
	public EmpDTO getEmp(int empno){
		EmpDTO emp = new EmpDTO();
		try{
			conn = ds.getConnection();
			//사번에대한 사원정보에서 필요한 정보 추출
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

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

import DTO.ScheduleDTO;

public class ScheduleDAO {
	
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public ScheduleDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			System.out.println("DB���� ����:" + e);
			return;
		}
	}
	
	//������ �Է��Լ�(�����찴ü)
	public int ScheduleAdd(ScheduleDTO schedule){
		String sql="insert into schedule(scnum,empno,startdate,enddate,title) "
				+ "values(schedule_num.nextval,?,?,?,?)";
		int result = 0;
		/*	
		SCNUM     NOT NULL NUMBER        
		EMPNO     NOT NULL NUMBER        
		STARTDATE NOT NULL DATE          
		ENDDATE   NOT NULL DATE          
		TITLE     NOT NULL VARCHAR2(200)  
		*/
		try{
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, schedule.getEmpno());
			pstmt.setDate(2, schedule.getStartdate());
			pstmt.setDate(3, schedule.getEnddate());
			pstmt.setString(4, schedule.getTitle());
			result = pstmt.executeUpdate();
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {}
		}
		return result;
	}
	
	public List<ScheduleDTO> scheduleList(int empno){
		List<ScheduleDTO> list = new ArrayList<ScheduleDTO>();
		String sql = "select * from schedule where empno=? order by scnum";
		try{
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ScheduleDTO schedule = new ScheduleDTO();
				schedule.setScnum(rs.getInt("SCNUM"));
				schedule.setEmpno(rs.getInt("EMPNO"));
				schedule.setStartdate(rs.getDate("STARTDATE"));
				schedule.setEnddate(rs.getDate("ENDDATE"));
				schedule.setTitle(rs.getString("TITLE"));
				list.add(schedule);
			}
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {}
		}
		return list;
	}
	
	public int ScheduleEdit(ScheduleDTO schedule,int scnum){
		String sql="update schedule set STARTDATE=?,ENDDATE=?,TITLE=? where scnum=?";
		int result = 0;
		try{
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setDate(1, schedule.getStartdate());
			pstmt.setDate(2, schedule.getEnddate());
			pstmt.setString(3, schedule.getTitle());
			pstmt.setInt(4, scnum);
			result = pstmt.executeUpdate();
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {}
		}
		return result;
	}
	
	public int ScheduleDelete(int scnum){
		String sql="delete from schedule where scnum=?";
		int result = 0;
		try{
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, scnum);
			result = pstmt.executeUpdate();
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		finally{
			try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex) {}
		}
		return result;
	}
}

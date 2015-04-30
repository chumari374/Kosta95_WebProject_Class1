<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%  
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	Context context = new InitialContext();
	ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");

	conn = ds.getConnection();
	String sql = "select deptname, deptcode from dept";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	JSONArray rows = new JSONArray();
	while(rs.next()){
		JSONObject jsonobject = new JSONObject();
		jsonobject.put("deptname", rs.getString("deptname"));
		jsonobject.put("deptcode", rs.getInt("deptcode"));
		rows.add(jsonobject);
	}
		
	rs.close();
	pstmt.close();
	conn.close();
%>
<%=rows%>

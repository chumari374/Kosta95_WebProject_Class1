<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%  
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.7.192:1521:XE", "PROJECT", "1004");
	String sql = "select teamname, teamcode from team where deptcode = ? order by teamcode";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, request.getParameter("deptcode"));
	ResultSet rs = ps.executeQuery();
	
	JSONArray rows = new JSONArray();
	while(rs.next()){
		JSONObject jsonobject = new JSONObject();
		jsonobject.put("teamname", rs.getString("teamname"));
		jsonobject.put("teamcode", rs.getInt("teamcode"));
		rows.add(jsonobject);
	}
		
	rs.close();
	ps.close();
	con.close();
%>
<%=rows%>

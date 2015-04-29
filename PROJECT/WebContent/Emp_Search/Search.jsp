<%@page import="net.sf.json.JSONObject"%>
<%@page import="net.sf.json.JSONArray"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="DTO.MemberInfoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@192.168.7.192:1521:XE", "PROJECT", "1004");
	String sql = "select deptname, teamname, ename, gradename, emptel, celphone from memberinfo where teamcode = ? order by grade";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setInt(1, Integer.parseInt(request.getParameter("teamcode")));
	ResultSet rs = ps.executeQuery();
	
	JSONArray rows = new JSONArray();
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
		
	rs.close();
	ps.close();
	con.close();
%> 
<%-- <%
	JSONArray rows = (JSONArray)request.getAttribute("JSONList");
%> --%>
<%=rows%>
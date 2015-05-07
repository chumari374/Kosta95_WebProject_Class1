<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.DataSource"%>
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
	String deptcode = request.getParameter("deptcode");
	String teamcode = request.getParameter("teamcode");
	
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	Context context = new InitialContext();
	ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");

	conn = ds.getConnection();
	String sql = "select m.empno, m.deptname, m.teamname, m.ename, m.gradename, m.emptel, m.celphone, d.exist from MEMBERINFO m "
            + "join domain_set d on m.empno=d.empno where d.exist='true' and m.deptcode like '%"+deptcode+"%' and m.teamcode like '%"+teamcode+"%' order by m.grade";
	pstmt = conn.prepareStatement(sql);

	rs = pstmt.executeQuery();
	
	JSONArray emplist = new JSONArray();
	
	while(rs.next()){
		JSONObject jsonobject = new JSONObject();
		jsonobject.put("empno",rs.getInt("empno"));
		jsonobject.put("deptname", rs.getString("deptname"));
		jsonobject.put("teamname", rs.getString("teamname"));
		jsonobject.put("ename", rs.getString("ename"));
		jsonobject.put("gradename", rs.getString("gradename"));
		jsonobject.put("emptel", rs.getString("emptel"));
		jsonobject.put("celphone", rs.getString("celphone"));
		emplist.add(jsonobject);
	}
		
	rs.close();
	pstmt.close();
	conn.close();
%> 
<%-- <%
	JSONArray rows = (JSONArray)request.getAttribute("JSONList");
%> --%>
<%=emplist%>
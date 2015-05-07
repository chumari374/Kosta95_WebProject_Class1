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
	String sql = "select m.teamname, m.teamcode from MEMBERINFO m "
            + "join domain_set d on m.empno=d.empno where d.exist='true' and m.deptcode = ? order by m.teamcode";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("deptcode"));
	rs = pstmt.executeQuery();
	
	JSONArray rows = new JSONArray();
	while(rs.next()){
		JSONObject jsonobject = new JSONObject();
		jsonobject.put("teamname", rs.getString("teamname"));
		jsonobject.put("teamcode", rs.getInt("teamcode"));
		rows.add(jsonobject);
	}
		
	rs.close();
	pstmt.close();
	conn.close();
%>
<%=rows%>

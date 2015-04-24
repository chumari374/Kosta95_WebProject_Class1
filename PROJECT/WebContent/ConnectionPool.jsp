<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
</head>
<body>
	 <h3>DB연결 검증작업</h3>
		<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			Context context = new InitialContext();
			DataSource datasource = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
			conn = datasource.getConnection();
		    out.print("DB연결 여부 :"  + conn.isClosed() +"<br>");
		    conn.close();
		    out.print("DB연결 여부 : " + conn.isClosed() +"<br>");

		%>

</body>
</html>
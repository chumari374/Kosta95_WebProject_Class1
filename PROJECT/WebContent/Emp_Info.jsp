<%@page import="DAO.MemberInfoDAO"%>
<%@page import="DTO.EmpDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 게시판이나 사원검새에서 '사원상제정보보기'를 눌렀을때 나오는 화면 -->
<% 
	int empno = (int)session.getAttribute("empno");
	String ename = (String)session.getAttribute("ename");
	String celphone = (String)session.getAttribute("celphone");
	String email = (String)session.getAttribute("email");
	String deptname = (String)session.getAttribute("deptname");
	String teamname = (String)session.getAttribute("teamname");
	String gradename = (String)session.getAttribute("gradename");
	String emptel = (String)session.getAttribute("emptel");
	String p_picture = (String)session.getAttribute("p_picture");
	String p_content = (String)session.getAttribute("p_content");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">



table {
   border: 2px solid grey;
   border-radius: 5px;
   margin: 10px;
}

		
    th {
    
    background-color: #D5D5D5;
    
    }

	tr, td {
		border-bottom: 1px solid grey;
 		border-collapse: collapse;
 		background-color: #F6F6F6;
 
 		
 		
	}
</style>

   <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>

	<table width="500px" height="300px">
		<tr>
			<th colspan="3" align="center"><%= ename %>님의 사원정보</th>
		</tr>
		<tr>
			<td rowspan="5"><%= p_picture %><br>프로필사진</td>
			<td>사원번호</td>
			<td><%= empno %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%= ename %></td>
		</tr>
		<tr>
			<td>핸드폰</td>
			<td><%= celphone %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%= email %></td>
		</tr>
		<tr>
			<td>소속부서</td>
			<td><%= deptname %></td>
		</tr>
		<tr>
			<td rowspan="3"><%= p_content %><!-- 프로필메세지 --></td>
			<td>소속팀</td>
			<td><%= teamname %></td>
		</tr>
		<tr>
			<td>직급</td>
			<td><%= gradename %></td>
		</tr>
		<tr>
			<td>사내전화번호</td>
			<td><%= emptel %></td>
		</tr>
		<tr>
			<td colspan="3" align="center"><input type="button" value="닫기"></td>
		</tr>
	</table>

</body>
</html>

<%@page import="DTO.MemberInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 게시판이나 사원검새에서 '사원상제정보보기'를 눌렀을때 나오는 화면 -->
<% 
	MemberInfoDTO member = (MemberInfoDTO)request.getAttribute("member");
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
			<th colspan="3" align="center">${member.ename}님의 사원정보</th>
		</tr>
		<tr>
			<td rowspan="6">${member.p_picture}<br>프로필사진</td>
			<td>사원번호</td>
			<td>${member.empno}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${member.ename}</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${member.birth}</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>${member.sex}</td>
		</tr>
		<tr>
			<td>핸드폰</td>
			<td>${member.celphone}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${member.email}</td>
		</tr>
		<tr>
			<td rowspan="4">${member.p_content}<!-- 프로필메세지 --></td>
			<td>소속부서</td>
			<td>${member.deptname}</td>
		</tr>
		<tr>
			<td>소속팀</td>
			<td>${member.teamname}</td>
		</tr>
		<tr>
			<td>직급</td>
			<td>${member.gradename}</td>
		</tr>
			<tr>
			<td>사내전화번호</td>
			<td>${member.emptel}</td>
		</tr>
		<tr>
			<td colspan="3" align="center"><input type="button" value="닫기"></td>
		</tr>
	</table>

</body>
</html>

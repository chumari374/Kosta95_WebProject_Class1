<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<style>
	#login_table {border:1px solid black}
	#login_table th {text-align: right}
</style>
</head>
<body>
	<div id="login_div">
		<form id="login_form">
			<table id="login_table">
				<tr>
					<th>사원번호</th>
					<td>
						<input type="text" name="empno">
					</td>
				</tr>
				<tr>
					<th>암호</th>
					<td>
						<input type="text" name="pwd">
						<input type="button" value="로그인">
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<a href="Pwd_Search.jsp">비밀번호 찾기</a>
						<a href="Register.jsp">회원가입</a>
					</td>
				</tr>
			</table>
			
		</form>
	</div>
</body>
</html>
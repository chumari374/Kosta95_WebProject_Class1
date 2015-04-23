<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 회원가입 페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<style>
	#register_table {border:1px solid black}
	#register_table th {text-align: right}
</style>
</head>
<body>
	<div id="register_div">
		<form id="register_form">
			<table id="register_table">
				<tr>
					<th>사원번호</th>
					<td>
						<input type="text" name="empno">
						<input type="button" value="중복확인" onclick="">
					</td>
				</tr>
				<tr>
					<th>암호</th>
					<td>
						<input type="text" name="pwd">
					</td>
				</tr>
				<tr>
					<th>암호 확인</th>
					<td>
						<input type="text" name="pwd2">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="email">
						<input type="button" value="중복확인" onclick="">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="addr">
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td>
						<input type="text" name="celphone">
					</td>
				</tr>
				<tr>
					<th>프로필사진</th>
					<td>
						<input type="file" name="p_picture">
					</td>
				</tr>
				<tr>
					<th>프로필내용</th>
					<td>
						<textarea name="p_content"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
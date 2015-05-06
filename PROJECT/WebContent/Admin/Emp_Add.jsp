<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table>
		<tr>
			<td>사원번호</td>
			<td><input type="text" name="empno"></td>
			<td><input type="button" id="empnocheck" value="중복확인"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="ename"></td>
		</tr>
		<tr>
			<td>관리자권한</td>
			<td><select name="admin">
					<option>관리자</option>
					<option>일반사용자</option>
			</select></td>
		</tr>
		<tr>
			<td>부서</td>
			<td><select name="dept">
					<option>부서1</option>
					<option>부서2</option>
			</select></td>
		</tr>
		<tr>
			<td>팀</td>
			<td><select name="team">
					<option>팀1</option>
					<option>팀2ㄴ</option>
			</select></td>
		</tr>
		<tr>
			<td>직급</td>
			<td><select name="admin">
					<option>관리자</option>
					<option>일반사용자</option>
			</select><input type="button" id="gradecheck" value="직급확인"></td>
		</tr>
		<tr>
			<td>사내전화번호</td>
			<td><input type="text" name="emptel"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><select name="sex">
					<option value="남자">남자</option>
					<option value="여자">여자</option>
			</select></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><input type="text" name="year" height="40px">년</td>
			<td><input type="text" name="month">월</td>
			<td><input type="text" name="day">일</td>
		</tr>


	</table>

</body>
</html>
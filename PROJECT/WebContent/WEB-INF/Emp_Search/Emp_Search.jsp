<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 사원검색 페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 table, tr, td{
 	border: 1px solid gray;
 	border-collapse: collapse;
 	padding: 5px;
 	padding-left: 10px; 
 	padding-right: 10px;
 } 
</style>
</head>
<body>
	<table width="60%">
		<tr>
			<td colspan="6" align="center">
				<select>
					<option>선택</option>
					<option>개발부</option>
					<option>영업부</option>
					<option>총무부</option>
				</select>
				<input type="text" placeholder="이름으로 검색">&nbsp;<input type="button" value="검색">
			</td>
		</tr>
		<!-- 동적으로 구성 -->
		<tr>
			<td>부서</td>
			<td>팀</td>
			<td>이름</td>
			<td>직급</td>
			<td>사내전화번호</td>
			<td>핸드폰</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td align="right"><input type="button" value="쪽지"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td align="right"><input type="button" value="쪽지"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td align="right"><input type="button" value="쪽지"></td>
		</tr>
	</table>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 게시판에서 '사원정보보기'를 눌렀을때 나오는 화면 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
	table, tr, td {
		border: 1px solid gray;
 		border-collapse: collapse;
 		padding: 5px;
 		padding-left: 10px; 
 		padding-right: 10px;
	}

</style>
</head>
<body>
	<table>
		<tr>
			<th colspan="3" align="center">님의 사원정보</th>
		</tr>
		<tr>
			<td rowspan="5">프로필사진</td>
			<td>사원번호</td>
			<td></td>
		</tr>
		<tr>
			<td>이름</td>
			<td></td>
		</tr>
		<tr>
			<td>핸드폰</td>
			<td></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td></td>
		</tr>
		<tr>
			<td>소속부서</td> 
			<td></td>
		</tr>
		<tr>
			<td rowspan="3">프로필메세지</td>
			<td>소속팀</td>
			<td></td>
		</tr>
		<tr>
			<td>직급</td>
			<td></td>
		</tr>
		<tr>
			<td>사내전화번호</td>
			<td></td>
		</tr>
		<tr>
			<td colspan="3" align="center"><input type="button" value="닫기"></td>
		</tr>
	</table>
</body>
</html>
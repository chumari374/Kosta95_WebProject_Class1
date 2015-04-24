<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!-- (어드민전용)사원정보수정 페이지 -->
<!-- 자신이 수정할수있는 정보는 input text가 있고, 수정할수없는 정보는 보여주기만 -->
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
	<form>
		<table>
			<tr>
				<td>사원번호  </td>
				<td></td>
			</tr>
			<tr>
				<td>이름 </td>
				<td></td>
			</tr>
			<tr>
				<td>생년월일  </td>
				<td></td>
			</tr>
			<tr>
				<td>성별  </td>
				<td></td>
			</tr>
			<tr>
				<td>소속부서 </td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td>소속팀 </td>
				<td><input type="text"></td>
			</tr>
			<tr>
				<td>패스워드  </td>
				<td></td>
			</tr>
			<tr>
				<td>이메일 주소 </td>
				<td></td>
			</tr>
			<tr>
				<td>주소  </td>
				<td></td>
			</tr>
			<tr>
				<td>핸드폰 번호  </td>
				<td></td>
			</tr>
			<tr>
				<td>프로필 사진  </td>
				<td></td>
			</tr>
			<tr>
				<td>프로필 메세지 </td>
				<td><textarea rows="5" cols="60" readonly="readonly"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정">&nbsp;<input type="button" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>
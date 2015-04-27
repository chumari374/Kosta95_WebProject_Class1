<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<style>
		table {border:1px solid black}
		th {text-align: right}
	</style>
	<script type="text/javascript">
		window.onload = function(){
			document.getElementById("pwd_search_ok").onclick = function(){
				//location.href = "pwd_search.ps";
			}
		}
		
	</script>
</head>
<body>
	<div id="pwd_search_div">
		비밀번호 찾기
		<form action="pwd_search.ps" method="post">
		<table id="pwd_search_table">
			<tr>
				<th>사원번호</th>
				<td><input type="text" name="empno"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<input type="submit" id="pwd_search_ok" value="찾기">
					<input type="button" id="pwd_search_cancel" value="취소" onclick="">
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>
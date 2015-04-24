<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 메세지함 페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>쪽지함</title>
	<style>
		#message_list_table {border:1px solid black;border-collapse: collapse}
		#message_list_table th {border:1px solid black;}
	</style>
</head>
<body>
	<div id="message_list">
		<table id="message_list_table">
			<tr>
				<th>쪽지번호</th>
				<th>받는사람</th>
				<th>작성자</th>
				<th>제목</th>
			</tr>
		</table>
		<hr>
		<input type="button" value="쪽지보내기">
	</div>
</body>
</html>
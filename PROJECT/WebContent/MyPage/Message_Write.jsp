<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#message_write_table {border:1px solid black}
	#message_write_table th {text-align: right}
</style>
</head>
<body>
	<div id="message_write_div">
		<form id="message_write_form">
			<table id="message_write_table">
				<tr>
					<th>받는사람</th>
					<td>
						<input type="text" name="sendempno">
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="content"></textarea>
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
					<th>첨부파일</th>
					<td>
						<input type="file" name="filepath">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
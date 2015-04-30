<%
    String msgnum = (String.valueOf(session.getAttribute("msgnum"))); 
	String empno = (String.valueOf(session.getAttribute("empno"))); 
	String title = (String)session.getAttribute("title");
	String content = (String)session.getAttribute("content");
	String filepath = (String)session.getAttribute("filepath");
	String sendempno = (String.valueOf(session.getAttribute("sendempno")));
	
%>
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

	<script language="javascript">
	function addMSGboard(){
		messageboardform.submit();
	}
	
</script>
</head>
<body>
	<div id="message_write_div">
		<form action="../MessageWriteOk.mb" method="post" name="messageboardform">
			<table id="message_write_table">
				<tr>
					<th></th>
					<td>
						받는사원번호<input type="text" name="sendempno">
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
					<th>첨부파일</th>
					<td>
						<input type="file" name="filepath">
					</td>
				</tr>
					<tr align="center" valign="middle">
		<td colspan="2">
		
				<a href="javascript:addMSGboard()">
				<input type="submit" value="등록" class="btn btn-primary btn-inline-block btn-lg">
				</a>
				
			</table>
		</form>
	</div>
</body>
</html>
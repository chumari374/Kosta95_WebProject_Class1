<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	List SendSignList = (List)request.getAttribute(arg0)

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>kostra net</title>
</head>
<body>
	<table width=50% border="0" cellpadding="0" cellspacing="0">
		<%if(listcount > 0){%>
			<tr align="center" valign="middle">
				<td colspan="4">보낸 결재 게시판</td>
			</tr>
	</table>
</body>
</html>
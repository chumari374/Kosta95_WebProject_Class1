<%@page import="DTO.SignDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.SignDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	SignDTO signdata = (SignDTO) request.getAttribute("signdata");
	SignDAO signdao = new SignDAO();
	
	
	String title = signdata.getTitle();
	String starter = signdao.getEmpname(signdata.getStarter());
	String sender = signdao.getEmpname(signdata.getEmpno());
	String getsign = signdao.getEmpname(signdata.getGetsign());
	String content = signdata.getContent();
	String filepath = signdata.getFile_sign();	

	/* if(signdata.getFile_sign() == "null"){
		filepath = "없음";
	} else {
		filepath = signdata.getFile_sign();
	} */
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결재문서 열람</title>
<script src="http://icode.jquery.com/jquery-1.11.2.min.js"></script>
<script>
</script>
<style type="text/css">
table, td, tr {
	border: 1px solid gray;
	border-collapse: collapse;
	width: 800px;
}

.content {
	height: 250px;
}
</style>
</head>
<body>
	<jsp:include page="../Main.jsp"></jsp:include>
	<div id="main" align="center">
		<form action="SignAddAction.hong" method="post"
			enctype="multipart/form-data">
			<center>
				<table>
					<tr>
						<td>제목</td>
						<td><%=title %></td>
					</tr>
					<tr>
						<td>기안자</td>
						<td><%=starter %></td>
					</tr>
					<tr>
						<td>송부자</td>
						<td><%=sender %></td>
					</tr>
					<tr>
						<td>파일</td>
						<td><%=filepath %></td>
					</tr>
					<tr class="content">
						<td>내용</td>
						<td><%=content %></td>
					</tr>
					<tr>
						<td>결재자</td>
						<td><%=getsign %></td>
					</tr>
				</table>
			</center>
		</form>
	</div>
	<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
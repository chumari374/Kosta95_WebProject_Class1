<%@page import="DTO.SignDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.SignDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	SignDTO signdata = (SignDTO) request.getAttribute("signdata");
	SignDAO signdao = new SignDAO();

	ServletContext context = getServletContext();
	String SignDownLoadPath =  "\\\\192.168.7.235\\Upload";
	
	String title = signdata.getTitle();
	String starter = signdao.getEmpname(signdata.getStarter());
	String sender = signdao.getEmpname(signdata.getEmpno());
	String getsign = signdao.getEmpname(signdata.getGetsign());
	String content = signdata.getContent();
	String filepath = signdata.getFile_sign();
	String status = signdata.getStatus();
	
	if(filepath.equals("null")){
		filepath = "";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결재문서 열람</title>
<script src="http://icode.jquery.com/jquery-1.11.2.min.js"></script>
   <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<style type="text/css">
/* table, td, tr {
	border: 1px solid gray;
	border-collapse: collapse;
	width: 800px;
} */

.content {
	height: 200px;
}
</style>
</head>
<body>
	<jsp:include page="../Main.jsp"></jsp:include>
	<form action="StatusSign.hong" method="post">
		<div id="main" align="center">
			<center>
				<table class="table" style="width: 80%; margin-top: 50px;">
					<tr align="center" valign="middle">
						<td colspan="2"><b>받은 결재함</b></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><%=title%></td>
					</tr>
					<tr>
						<td>기안자</td>
						<td><%=starter%></td>
					</tr>
					<tr>
						<td>송부자</td>
						<td><%=sender%></td>
					</tr>
					<tr>
						<td>파일</td>
						<td>
							<%if(!(signdata.getFile_sign()==null)) { %>
							
							<a href="Sign/Sign_(6)File_Down.jsp?File_sign=<%=filepath %>">
							<%=filepath %>
							</a>
							<%} %>
						</td>
					</tr>
					<tr class="content">
						<td>내용</td>
						<td><%=content%></td>
					</tr>
					<tr>
						<td>결재자</td>
						<td><%=getsign%></td>
					</tr>
					<tr>
						<td>상태</td>
						<td><%=status%></td>
					</tr>
				</table>

				<input type="hidden" id="ref" name="ref"
					value="<%=signdata.getRef()%>"> 
				<input type="hidden" id="step" name="step" 
					value="<%=signdata.getStep()%>"> 
				<%if(status.equals("대기")) {%> 
				<input type="submit" id="status" name="status" value="승인"> 
				<input type="submit" id="status" name="status" value="취소"> 
				<input type="submit" id="status" name="status" value="상부보고">
				<%} %>
			</center>
		</div>
	</form>
	<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
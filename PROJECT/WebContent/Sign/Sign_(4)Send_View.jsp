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
	
	int signnum = signdata.getSignnum();

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
<script type="text/javascript">
function goBack() {
    window.history.back();
}
</script>
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
}
 */
.content {
	height: 200px;
}
.css3button {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #383838;
	padding: 4px 10px;
	background: -moz-linear-gradient(
		top,
		#f7f7f7 0%,
		#ebebeb 50%,
		#dbdbdb 50%,
		#dbdbdb);
	background: -webkit-gradient(
		linear, left top, left bottom,
		from(#f7f7f7),
		color-stop(0.50, #ebebeb),
		color-stop(0.50, #dbdbdb),
		to(#dbdbdb));
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 5px;
	border: 1px solid #c7c7c7;
}
</style>
</head>
<body>
	<jsp:include page="../Main.jsp"></jsp:include>
	<div id="main" align="center">
		<form action="SignAddAction.hong" method="post"
			enctype="multipart/form-data">
			<center>
				<table class="table" style="width: 80%; margin-top: 50px;">
					<tr align="center" valign="middle">
						<td colspan="2"><b>보낸 결재함</b></td>
					</tr>
					<tr>
						<td><b>제목</b></td>
						<td><%=title %></td>
					</tr>
					<tr>
						<td><b>기안자</b></td>
						<td><a href="#" onclick="info(<%=signdata.getStarter()%>)"><%=starter %></a></td>
					</tr>
					<tr>
						<td><b>송부자</b></td>
						<td><a href="#" onclick="info(<%=signdata.getEmpno()%>)"><%=sender %></a></td>
					</tr>
					<tr>
						<td><b>파일</b></td>
						<td>
							<%if(!(signdata.getFile_sign()==null)) { %>
							
							<a href="Sign/Sign_(6)File_Down.jsp?File_sign=<%=filepath %>">
							<%=filepath %>
							</a>
							<%} %>
						</td>
					</tr>
					<tr class="content">
						<td><b>내용</b></td>
						<td><%=content %></td>
					</tr>
					<tr>
						<td><b>결재자</b></td>
						<td><a href="#" onclick="info(<%=signdata.getGetsign()%>)"><%=getsign %></a></td>
					</tr>
						<tr>
						<td><b>상태</b></td>
						<td><%=status %></td>
					</tr>
				</table>
				<hr>
				<input type="button" value="뒤로가기" onclick="goBack()" class="css3button">
			</center>
		</form>
	</div>
	<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>

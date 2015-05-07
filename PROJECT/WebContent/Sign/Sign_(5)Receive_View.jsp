<%@page import="DTO.SignDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.SignDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int grade = (Integer) session.getAttribute("grade");
	

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
} */

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
	<form action="StatusSign.hong" method="post">
		<div id="main" align="center">
			<center>
				<table class="table" style="width: 80%; margin-top: 50px;">
					<tr align="center" valign="middle">
						<td colspan="2"><b>받은 결재함</b></td>
					</tr>
					<tr>
						<td><b>제목</b></td>
						<td><%=title%></td>
					</tr>
					<tr>
						<td><b>기안자</b></td>
						<td><%=starter%></td>
					</tr>
					<tr>
						<td><b>송부자</b></td>
						<td><%=sender%></td>
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
						<td><%=content%></td>
					</tr>
					<tr>
						<td><b>결재자</b></td>
						<td><%=getsign%></td>
					</tr>
					<tr>
						<td><b>상태</b></td>
						<td><%=status%></td>
					</tr>
				</table>

				<input type="hidden" id="ref" name="ref"
					value="<%=signdata.getRef()%>"> 
				<input type="hidden" id="step" name="step" 
					value="<%=signdata.getStep()%>"> 
				<%if(status.equals("대기")) {%> 
				<input type="submit" id="status" name="status" value="승인" class="css3button"> 
				<input type="submit" id="status" name="status" value="취소" class="css3button"> 
					<%if(grade != 1) {%>
				<input type="submit" id="status" name="status" value="상부보고" class="css3button">
					<%}
				}%>
				<input type="button" onclick="goBack()" value="뒤로가기" class="css3button">
			</center>
			<!-- <input type="button" onclick="goBack()" value="뒤로가기" class="css3button"> -->
			<!-- center 아래에 있던거 위로 옮김(문제 생길까봐 써놓음 ㅠㅠ) -->
		</div>
	</form>
	<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>

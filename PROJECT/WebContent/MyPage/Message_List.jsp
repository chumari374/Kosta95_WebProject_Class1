<%@page import="java.util.List"%>
<%@page import="DTO.MessageDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
List messageList=(List)request.getAttribute("messagelist");

int listcount=(Integer)request.getAttribute("listcount");
int nowpage=(Integer)request.getAttribute("page");
int maxpage=(Integer)request.getAttribute("maxpage");
int startpage=(Integer)request.getAttribute("startpage");
int endpage=(Integer)request.getAttribute("endpage");
	
// 	System.out.println(listcount + "/ " + nowpage + " / " + maxpage + " / ");
// 	System.out.println(startpage + " / " + endpage);
%>
<!-- 메세지함 페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>쪽지함</title>
	<style>
		#message_list_table {border:1px solid black;border-collapse: collapse}
		#message_list_table th {border:1px solid black; text-align:center;}
	</style>
   <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
   <link type="text/css" rel="stylesheet" href="../css/mystyle.css">

</head>
<body>
<jsp:include page="../Main.jsp"></jsp:include>
   <div id="main" align="center">
   <div id="title"><h3><b>쪽지함</b></h3></div>
	<div id="message_list">
		<table id="message_list_table" width="60%" height="50%">
			<tr>
				<th width="15%">쪽지번호</th>
				<th width="15%">받는사람</th>
				<th width="15%">작성자</th>
				<th>제목</th>
			</tr>
	<%
		for(int i=0;i<messageList.size();i++){
			MessageDTO ml=(MessageDTO)messageList.get(i);
	%>
	<tr>
		<td>
			<%=ml.getMsgnum()%>
		</td>
		<td>
			<%=ml.getSendempno() %>
		</td>
		<td>
		   <%=ml.getEmpno() %>
		</td>
		<td>
			<a href="MessageDetailAction.mb?msgnum=<%=ml.getMsgnum()%>">
				<%=ml.getTitle()%>
			</a>
		</td>
	</tr>
	<%} %>
		</table>
		<hr>
		<input type="button" value="쪽지보내기">
	</div>
	</div>
	<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
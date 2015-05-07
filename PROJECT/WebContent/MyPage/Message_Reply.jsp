<%@page import="java.util.List"%>
<%@page import="DTO.MessageDTO"%>
<%@page import="DAO.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

	MessageDTO messageboard = (MessageDTO)request.getAttribute("messagedata");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#message_write_table {border:1px solid black}
	#message_write_table th {text-align: right}
</style>

<!-- 	<script language="javascript">
	function addMSGboard(){
		messageboardform.submit();
	}
	
</script> -->
<%

/*  String empno = (String)session.getAttribute("empno"); */
	String empno = (String.valueOf(session.getAttribute("empno"))); 
	String sendempno = request.getParameter("sendempno");

%>
</head>
<body>
<c:set var="messagedata" value="${messagedata}"/>
	<div id="message_reply_div">
		<form action="./MessageReplyOk.mb" method="post" name="messageboardform">
			<table id="message_reply_table">
			    <tr>
			       <th>보내는사원번호</th>
			       <td><input type="text" name="empno" value= <%= empno %> readonly></td>
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
						<tr>
					<th>받는사원번호</th>
					<td>
						<input type="text" name="sendempno" value=<%=sendempno %>>
					</td>
				</tr>
				<tr align="center" valign="middle">
		   <td colspan="2">
	    	<!-- 
				<a href="javascript:addMSGboard()"> -->
				<input type="submit" value="등록" class="btn btn-primary btn-inline-block btn-lg">
				<!-- </a> -->
				</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
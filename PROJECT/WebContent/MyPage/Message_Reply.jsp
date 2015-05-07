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

<style>
	
	    h3 { text-align: center; }
	    body{background-color: #f5f5f5;}
		#message_reply_table { color: #4C4C4C; border-radius: 2px;}
		th { 
		border: 0px #4587c0 solid; 
		border-radius: 2px;
		background-color: #abd1e3;
		color: #3c6d97;
		font-size: 12px;
		}
		
		#message_reply_table td {border-bottom:1px dashed #4587c0;}
		a {color: #4C4C4C; text-decoration: none;}
		a:hover{color: #A6A6A6;}
		
button.css3button {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #3c6d97;
	padding: 6px 14px;
	background: -moz-linear-gradient(
		top,
		#f5f5f5 0%,
		#f5f5f5);
	background: -webkit-gradient(
		linear, left top, left bottom,
		from(#f5f5f5),
		to(#CFCFCF));
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	border: 1px solid #4587c0;
	-moz-box-shadow:
		0px 1px 2px rgba(000,000,000,0.5),
		inset 0px 1px 1px rgba(255,255,255,0.5);
/* 	-webkit-box-shadow:
		0px 1px 2px rgba(000,000,000,0.5),
		inset 0px 1px 1px rgba(255,255,255,0.5);
	box-shadow:
		0px 1px 2px rgba(000,000,000,0.5),
		inset 0px 1px 1px rgba(255,255,255,0.5); */
	text-shadow:
		0px 0px 0px rgba(000,000,000,0),
		0px 0px 0px rgba(255,255,255,0);
}

#menudiv {margin-left: 30%;}

</style>

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
						<textarea name="content" rows="5" cols="21"></textarea>
					</td>
				</tr>
<!--  				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="filepath">
					</td>
				</tr>  -->
					<tr align="center" valign="middle">
						<tr>
					<th>받는사원번호</th>
					<td>
						<input type="text" name="sendempno" value=<%=sendempno %>>
					</td>
				</tr>
			</table>
			
				<br>
				<div id="menudiv">
				<button type="submit" value="" class="css3button">등록</button>
				<button type="button" value="" onclick="window.close();" class="css3button">취소</button>
				</div>
			
		</form>
	</div>
</body>
</html>
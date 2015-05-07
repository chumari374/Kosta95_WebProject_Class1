<%@page import="java.util.List"%>
<%@page import="DTO.MessageDTO"%>
<%@page import="DAO.MessageDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
 table, th, tr, td {
     font-family: 돋움;
     font-size: 12px;
     text-align: center;
 }
 
 button.css3button {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #282828;
	padding: 6px 14px;
	background: -moz-linear-gradient(
		top,
		#f5f5f5 0%,
		#f5f5f5);
	background: -webkit-gradient(
		linear, left top, left bottom,
		from(#f5f5f5),
		to(#f5f5f5));
	-moz-border-radius: 2px;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	border: 1px solid #c4c4c4;
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
 
 
 
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:set var="messagedata" value="${messagedata}"/>
<div id="main" align="center">
<!-- 게시판 수정 -->
<input type="hidden" value="${messagedata.msgnum} }"/>
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="6"></td>
	</tr>
	
	<tr>
		<td>
			<div align="center">제&nbsp; 목&nbsp;&nbsp;</div>
		</td>
		
		<td>
		${messagedata.title}
		</td>
	
	</tr>
		<tr>
			<td>
			<div align="center">작성일&nbsp;&nbsp;</div>
		</td>
		<td>
		 ${messagedata.write_date}
		</td>
		</tr>
		
		<tr>
			<td>
			<div align="center">보낸사람&nbsp;&nbsp;</div>
		</td>
		
		<td>
		${messagedata.empno }
		</td>
		</tr>
		
		
		
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	
	<tr>
		<td>
			<div align="center">내 용</div>
		</td>
		<td>
			<table border=0 width=490 height=250 style="table-layout:fixed">
				<tr>
					<td>
					${messagedata.content}
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;"></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>

	<tr align="center" valign="middle">
		<td colspan="5">
			
			
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="./MessageReply.mb?sendempno=${messagedata.empno}" target="blank"><button type="button" value="" class="css3button">답장</button></a>&nbsp;&nbsp;
			<%-- ./MessageReplyAction.mb?empno=${messagedata.empno} --%>
			
			<button type="button" value="" onclick="window.close();" class="css3button">닫기</button>

<%-- 			<a href="./MessageList.mb?page=<%=Integer.parseInt(request.getParameter("page"))%>">
			[목록]</a>&nbsp;&nbsp; --%>
			
		</td>
	</tr>
</table>
</div>
</body>
</html>
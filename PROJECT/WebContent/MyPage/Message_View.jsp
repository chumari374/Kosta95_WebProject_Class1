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
			<a href="./MessageReply.mb?sendempno=${messagedata.empno}" target="blank"><input type="button" value="답장"></a>&nbsp;&nbsp;
			<%-- ./MessageReplyAction.mb?empno=${messagedata.empno} --%>
			
			<input type="button" value="닫기" onclick="window.close();">

<%-- 			<a href="./MessageList.mb?page=<%=Integer.parseInt(request.getParameter("page"))%>">
			[목록]</a>&nbsp;&nbsp; --%>
			
		</td>
	</tr>
</table>
</div>
</body>
</html>
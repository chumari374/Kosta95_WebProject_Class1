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
 
 body {background-color: #EFEFEF !important;}
 
button.css3button {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #383838;
	padding: 4px 10px;
	background: -moz-linear-gradient(top, #f7f7f7 0%, #ebebeb 50%, #dbdbdb 50%, #dbdbdb);
	background: -webkit-gradient(linear, left top, left bottom, from(#f7f7f7),
		color-stop(0.50, #ebebeb), color-stop(0.50, #dbdbdb), to(#dbdbdb));
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 5px;
	border: 1px solid #c7c7c7;
}
 
 
</style>
<script>
function msgsend(){

	var popupWidth = 310;
	var popupHeight = 200;
	var popup_options = "top="+((screen.availHeight - popupWidth)/2)+", left="+((screen.availWidth - popupHeight)/2)+", width=310, height=200, location=no";
	var url = "./MessageReply.mb?sendempno=${messagedata.empno}";
	var target = "_blank";

	window.open(url, target, popup_options);
}
</script>

</style>
   <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/myscript.js"></script>

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
		<th>
			<div align="center">제&nbsp; 목&nbsp;&nbsp;</div>
		</th>
		
		<td style="border-bottom: 1px solid #A2A2A2">
		<p></p>
		<p>${messagedata.title}</p>
		</td>
	
	</tr>
		<tr>
			<th>
			<div align="center">작성일&nbsp;&nbsp;</div>
		</th>
		<td style="border-bottom: 1px solid #A2A2A2">
		<p></p>
		 <p>${messagedata.write_date}</p>
		</td>
		</tr>
		
		<tr>
			<th>
			<div align="center">보낸사람&nbsp;&nbsp;</div>
		</th>
		
		<td>
		<p></p>
		<p>${messagedata.empno }</p>
		</td>
		</tr>
		
	<tr bgcolor="#0469AF">
		<td colspan="2" style="height:2px;">
		</td>
	</tr>
	
	<tr>
		<th>
			<div align="center">내 용</div>
		</th>
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
<!-- 	<tr bgcolor="#0469AF">
		<td colspan="2" style="height:2px;"></td>
	</tr> -->
	<tr><td colspan="2">&nbsp;</td></tr>

	<tr align="center" valign="middle">
		<td colspan="5">
			
			
			
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%-- 			<a href="./MessageReply.mb?sendempno=${messagedata.empno}" target="blank">
			<button type="button" value="" class="css3button">답장</button>
			</a>&nbsp;&nbsp; --%>
			
			<button type="button" value="" class="btn btn-primary" onclick="msgsend()">답장</button>
			
			<%-- ./MessageReplyAction.mb?empno=${messagedata.empno} --%>
			
			<button type="button" value="" onclick="window.close();" class="btn btn-default">닫기</button>

<%-- 			<a href="./MessageList.mb?page=<%=Integer.parseInt(request.getParameter("page"))%>">
			[목록]</a>&nbsp;&nbsp; --%>
			
		</td>
	</tr>
</table>
</div>
</body>
</html>
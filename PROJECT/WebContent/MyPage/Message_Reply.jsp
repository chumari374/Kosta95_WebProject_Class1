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
		border-bottom: 1px #B8B8B8 solid; 
		color: #5D5D5D;
		font-size: 12px;
		}
		
		#message_reply_table td {border-bottom:0px dashed #0469AF;}
		a {color: #4C4C4C; text-decoration: none;}
		a:hover{color: #A6A6A6;}
		
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
		
	<hr style=" border-color: #1b7dc0; ">
	
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
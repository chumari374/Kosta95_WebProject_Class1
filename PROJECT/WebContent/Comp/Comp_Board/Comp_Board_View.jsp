<%@page import="DTO.C_BrdDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	C_BrdDTO board = (C_BrdDTO)request.getAttribute("boarddata");
%>

<html>
<head>
	<title>사내 게시판</title>
</head>

<body>
<jsp:include page="../../Main.jsp"></jsp:include>
   <div id="main" align="center">
<!-- 게시판 수정 -->
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="6">사내 게시판</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제&nbsp; 목&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=board.getTitle()%>
		</td>
	
	</tr>
		<tr>
			<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">작성일&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=board.getWrite_date() %>
		</td>
		</tr>
		
		<tr>
			<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">작성자&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=board.getEname() %>
		</td>
		</tr>
		
		<tr>
			<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">조회수&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=board.getCount() %>
		</td>
		</tr>
		
		
		
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td style="font-family:돋음; font-size:12">
			<table border=0 width=490 height=250 style="table-layout:fixed">
				<tr>
					<td valign=top style="font-family:돋음; font-size:12">
					<%=board.getContent() %>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;"></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="./CompBoardReplyAction.cp?num=<%=board.getNum() %>">
			[답변]
			</a>&nbsp;&nbsp;
			<a href="./CompBoardModify.cp?num=<%=board.getNum() %>">
			[수정]
			</a>&nbsp;&nbsp;
			<a href="./CompBoardDeleteAction.cp?num=<%=board.getNum() %>"
			>
			[삭제]
			</a>&nbsp;&nbsp;
			<a href="./CompBoardList.cp">[목록]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
</div>
<jsp:include page="../../Footer.jsp"></jsp:include>
<!-- 게시판 수정 -->
</body>
</html>
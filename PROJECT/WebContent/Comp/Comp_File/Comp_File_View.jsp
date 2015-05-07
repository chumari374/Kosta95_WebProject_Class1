<%@page import="DTO.C_DbrdDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	C_DbrdDTO board = (C_DbrdDTO)request.getAttribute("boarddata");
%>

<html>
<head>
	<title>사내 자료실</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(function(){
		$('#download').click(function(){
			
			document.downloadForm.action='Comp/Comp_File/Comp_File_Download.jsp';
			document.downloadForm.submit();
		});
	});
		
	</script>
	<style type="text/css">
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
<jsp:include page="../../Main.jsp"></jsp:include>
   <div id="main" align="center">

<form action="#" method="post" name="downloadForm">
<table cellpadding="0" cellspacing="0" class="table" style="width: 70%; margin-top: 50px;">
	<tr align="center" valign="middle">
		<td colspan="6"><b>사내 자료실</b></td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:14" height="17">
			<div align="center"><b>제&nbsp; 목&nbsp;&nbsp;</b></div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=board.getTitle()%>
		</td>
	
	</tr>
		<tr>
			<td style="font-family:돋음; font-size:14" height="17">
			<div align="center"><b>작성일&nbsp;&nbsp;</b></div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=board.getWrite_date() %>
		</td>
		</tr>
		
		<tr>
			<td style="font-family:돋음; font-size:14" height="17">
			<div align="center"><b>작성자&nbsp;&nbsp;</b></div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<a href="#" onclick="info(<%=board.getEmpno()%>)"><%=board.getEname()%></a>
		</td>
		</tr>
		
		<tr>
			<td style="font-family:돋음; font-size:14" height="17">
			<div align="center"><b>조회수&nbsp;&nbsp;</b></div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=board.getCount() %>
		</td>
		</tr>
		
		
		
<!-- 	<tr bgcolor="cccccc">
		<td colspan="3" style="height:1px;">
		</td>
	</tr> -->
	
	<tr>
		<td style="font-family:돋음; font-size:14">
			<div align="center"><b>내&nbsp; 용&nbsp;&nbsp;</b></div>
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
<!-- 	<tr bgcolor="cccccc">
		<td colspan="3" style="height:1px;">
		</td>
	</tr>
	 -->
	<tr>
		<td style="font-family:돋음; font-size:14" height="17">
			<div align="center"><b>첨부파일&nbsp;&nbsp;</b></div>
		</td>
		<td style="font-family:돋음; font-size:12" >
			<%=board.getData() %><input type="hidden" name="filename" value="<%=board.getData() %>">
		</td>
		<td style="font-family:돋음; font-size:12">
			<input type="button" value="받기" id="download" class="css3button">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="./CompDataBoardModify.cf?num=<%=board.getNum() %>" class="css3button">
			수정
			</a>&nbsp;&nbsp;
			<a href="./CompDataBoardDeleteAction.cf?num=<%=board.getNum() %>"  class="css3button"
			>
			삭제
			</a>&nbsp;&nbsp;
			<a href="./CompDataBoardList.cf?page=<%=Integer.parseInt(request.getParameter("page"))%>"  class="css3button">목록</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
</form>
</div>
<jsp:include page="../../Footer.jsp"></jsp:include>
<!-- 게시판 수정 -->
</body>
</html>
<%@page import="DTO.C_BrdDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	C_BrdDTO board = (C_BrdDTO)request.getAttribute("boarddata");
	String ename = (String)session.getAttribute("ename");
	int empno = (Integer)session.getAttribute("empno");
%>

<html>
<head>
	<title>사내 게시판</title>
<style type="text/css">
input.css3button {
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
<!-- 게시판 수정 -->
<input type="hidden" value="<%=empno%>"/>
<table cellpadding="0" cellspacing="0" class="table" style="width: 70%; margin-top: 50px;">
	<tr align="center" valign="middle">
		<td colspan="6"><b>사내 게시판</b></td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:14" height="16">
			<div align="center"><b>제&nbsp; 목&nbsp;&nbsp;</b></div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=board.getTitle()%>
		</td>
	
	</tr>
		<tr>
			<td style="font-family:돋음; font-size:14" height="16">
			<div align="center"><b>작성일</b>&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=board.getWrite_date() %>
		</td>
		</tr>
		
		<tr>
			<td style="font-family:돋음; font-size:14" height="16">
			<div align="center"><b>작성자</b>&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<a href="#" onclick="info(<%=board.getEmpno()%>)"><%=board.getEname()%></a>
		</td>
		</tr>
		
		<tr>
			<td style="font-family:돋음; font-size:14" height="16">
			<div align="center"><b>조회수&nbsp;&nbsp;</b></div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=board.getCount() %>
		</td>
		</tr>
		
		
		
<!-- 	<tr bgcolor="cccccc">
		<td colspan="2">
		</td>
	</tr> -->
	
	<tr>
		<td style="font-family:돋음; font-size:15">
			<div align="center"><b>내&nbsp; 용&nbsp;&nbsp;</b></div>
		</td>
		<td style="font-family:돋음; font-size:12">
			<table border=0 width=490 height=250 style="table-layout:fixed">
				<tr>
					<td valign=top style="font-family:돋음; font-size:12">
<!-- 					<textarea ></textarea>  -->
					<%=board.getContent() %>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<!-- <tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;"></td>
	</tr> -->
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="./CompBoardReplyView.cp?num=<%=board.getNum() %>">
			<input type="button" class="css3button" value="답변">
			</a>&nbsp;&nbsp;
			<a href="./CompBoardModify.cp?num=<%=board.getNum() %>">
			<input type="button" class="css3button" value="수정">
			</a>&nbsp;&nbsp;
			<a href="./CompBoardDeleteAction.cp?num=<%=board.getNum() %>"
			>
			<input type="button" class="css3button" value="삭제">
			</a>&nbsp;&nbsp;
			<a href="./CompBoardList.cp?page=<%=Integer.parseInt(request.getParameter("page"))%>">
			<input type="button" class="css3button" value="목록">
			</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>

<!-- 	<tr bgcolor="cccccc"> -->
<!-- 		<td colspan="2" style="height:1px;"></td> -->
<!-- 	</tr> -->
<!-- 	<!-- 댓글입력 -->
<!-- 	<tr><td colspan="2">&nbsp;</td></tr> -->
<!-- 	<tr style="font-family:돋음; font-size:12" height="16"> -->
<%-- 	<td><div style="float: left"><%=ename %></div> --%>

<!-- 	<td> -->
<!-- 	<div style="float: left"><input type="text" style="width: 600px" placeholder="댓글을 입력하세요"></div> -->
<!-- 	<div  style="float: left"><input type="button" value ="확인"></div> -->
<!-- 	</td> -->
<!-- 	</tr> -->
<!-- 	<!-- 댓글입력 종료 -->
<!-- 	<tr><td colspan="2">&nbsp;</td></tr> -->

<!-- 	<tr><td>이름<br>작성일</td><td>내용 삭제</td></tr> -->


</table>
</div>
<jsp:include page="../../Footer.jsp"></jsp:include>
<!-- 게시판 수정 -->
</body>
</html>
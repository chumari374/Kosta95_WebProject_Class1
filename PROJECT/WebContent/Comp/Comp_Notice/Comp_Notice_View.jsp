<%@page import="DTO.C_N_BrdDTO"%>
<%@page import="DTO.C_BrdDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	C_N_BrdDTO board = (C_N_BrdDTO)request.getAttribute("boarddata");
	String ename = (String)session.getAttribute("ename");
	int empno = (Integer)session.getAttribute("empno");
%>

<html>
<head>
	<title>사내 공지사항</title>
</head>

<body>
<jsp:include page="../../Main.jsp"></jsp:include>
   <div id="main" align="center">
<!-- 게시판 수정 -->
<input type="hidden" value="<%=empno%>"/>
<table cellpadding="0" cellspacing="0" class="table" style="width: 70%; margin-top: 50px;">
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
<%-- 		<%=board.getEname() %> --%>
		Admin
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
		
		
		
<!-- 	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr> -->
	
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
<!-- 	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;"></td>
	</tr> -->
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
<%-- 			<a href="./CompNoticeReplyView.cn?num=<%=board.getNum() %>"> --%>
<!-- 			<input type="button" value="답변"> -->
<!-- 			</a>&nbsp;&nbsp; -->
			<a href="./CompNoticeModify.cn?num=<%=board.getNum() %>">
			<input type="button" value="수정">
			</a>&nbsp;&nbsp;
			<a href="./CompNoticeDeleteAction.cn?num=<%=board.getNum() %>"
			>
			<input type="button" value="삭제">
			</a>&nbsp;&nbsp;
			<a href="./CompNoticeList.cn?page=<%=Integer.parseInt(request.getParameter("page"))%>">
			<input type="button" value="목록">
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
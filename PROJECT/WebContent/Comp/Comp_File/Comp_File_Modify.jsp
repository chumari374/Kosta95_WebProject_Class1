
<%@page import="DTO.C_DbrdDTO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	C_DbrdDTO boarddata = (C_DbrdDTO)request.getAttribute("boarddata");
	String empno = (String.valueOf(session.getAttribute("empno"))); 
	String ename = (String)session.getAttribute("ename");
	String teamcode = (String.valueOf(session.getAttribute("teamcode")));
	String teamname = (String)session.getAttribute("teamname");
	String deptcode = (String.valueOf(session.getAttribute("deptcode")));
	String grade = (String.valueOf(session.getAttribute("grade")));

%>

<html>
<head>
	<title>사내 게시판</title>

	<script type="text/javascript" 
		src="<%=request.getContextPath()%>/ckeditor/ckeditor.js">
   		 CKEDITOR.replace('content',{
        toolbar: 'Full',
        uiColor: '#9AB8F3',
    }
	);
	</script>
	
	<script language="javascript">
	function addboard(){
		boardform.submit();
	}
	</script>
	
	<style>
	
/* 	body{
	   text-align: center;
	} */
	
	table {
	    margin-top: 20px;
	    margin-left: 20px;
	}
	
	tr, td{
	   border-bottom: 1px solid #D5D5D5;
	}
	
	#bottons {
	
	   padding-left: 50px;
	
	}
	
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
	   <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	
</head>
<body>
<!-- 게시판 등록 -->
<jsp:include page="../../Main.jsp"></jsp:include>
   <div id="main" align="center">
<form action="CompDataBoardRealModifyAction.cf" method="post" method="post" name="boardform" enctype="multipart/form-data">
<input type="hidden" name="BOARD_ID" value="<%=empno %>">
<input type="hidden" name="BOARD_NUM" value="<%=boarddata.getNum()%>">
<table width="700px" height="600px" cellpadding="0" cellspacing="0" width="100%">
	<tr align="center" valign="middle">
		<td colspan="5"><h3><b>사내 자료실</b></h3></td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:14" height="16">
			<div align="center"><b>글쓴이</b></div>
		</td>
		<td>
			Admin
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:14" height="16">
			<div align="center"><b>제 목</b></div>	
		</td>
		<td style="font-family:돋음; font-size:12" height="16">
			<input name="BOARD_TITLE" type="text" size="50" maxlength="100" 
				value="<%=boarddata.getTitle()%>"/>
		
		</td>
	</tr>

	<tr>
	
		<td style="font-family:돋음; font-size:14">
			<div align="center"><b>내 용</b></div>
		</td>
		<td>
		
			<textarea class="ckeditor" id="content" name="BOARD_CONTENT" cols="80" rows="15" ><%=boarddata.getContent() %></textarea>
			
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
			<input type="file" id="data" name="data" size="50">
		</td>
	</tr>
	<tr><td colspan="2"></td>
	<tr align="center" valign="middle">
		<td colspan="5">
		
				<a href="javascript:addboard()">
				<input type="submit" value="수정" class="css3button">
				</a>
				<a href="javascript:history.go(-1)" class="css3button">
				뒤로</a>
		</td>
	</tr>
</table>
</form>
<!-- 게시판 등록 -->
</div>
<jsp:include page="../../Footer.jsp"></jsp:include>
</body>
</html>
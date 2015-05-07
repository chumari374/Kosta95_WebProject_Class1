
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
   <div id="main" align="center" style="overflow: scroll;">
<form action="CompDataBoardRealModifyAction.cf" method="post" method="post" name="boardform" enctype="multipart/form-data">
<input type="hidden" name="BOARD_ID" value="<%=empno %>">
<input type="hidden" name="BOARD_NUM" value="<%=boarddata.getNum()%>">
<table width="700px" height="600px" cellpadding="0" cellspacing="0" width="100%">
	<tr align="center" valign="middle">
		<td colspan="5"><h3><b>사내 자료실</b></h3></td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">글쓴이</div>
		</td>
		<td>
			Admin
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>	
		</td>
		<td style="font-family:돋음; font-size:12" height="16">
			<input name="BOARD_TITLE" type="text" size="50" maxlength="100" 
				value="<%=boarddata.getTitle()%>"/>
		
		</td>
	</tr>

	<tr>
	
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
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
				<input type="submit" value="수정" class="btn btn-primary btn-inline-block btn-lg">
				</a>
				<a href="javascript:history.go(-1)" class="btn btn-success btn-inline-block btn-lg">
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
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	String empno = (String.valueOf(session.getAttribute("empno"))); 
	String ename = (String)session.getAttribute("ename");
	String teamcode = (String.valueOf(session.getAttribute("teamcode")));
	String teamname = (String)session.getAttribute("teamname");
	String deptcode = (String.valueOf(session.getAttribute("deptcode")));
	String grade = (String.valueOf(session.getAttribute("grade")));
	String admin = (String)session.getAttribute("admin");

	/*
		boardform
		BOARD_ID 작성자 empno
		BOARD_TITLE 제목 title
		BOARD_CONTENT 내용
		BOARD_FILE 파일첨부
		BOARD_NOTICE 공지사항여부
		
		글번호(PK)	NUM(PK)	N/A	NUMBER	NOT NULL
		작성자번호(FK)	EMPNO(FK)	N/A	NUMBER	NOT NULL
		제목	TITLE	N/A	VARCHAR2(20)	NOT NULL
		내용	CONTENT	N/A	VARCHAR2(4000)	NOT NULL
		공지사항	NOTICE	N/A	VARCHAR2(10)	NOT NULL
		
		작성일자	WRITE_DATE	N/A	DATE	NOT NULL
		
		답글	REF	N/A	NUMBER	NULL
		들여쓰기	DPTH	N/A	NUMBER	NULL
		답글계층	STEP	N/A	NUMBER	NULL

	*/
	
%>
<!DOCTYPE HTML>
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
   <div id="main" align="center">
<form action="CompDataBoardWriteOk.cf" method="post" name="boardform">
<input type="hidden" name="BOARD_ID" value="<%=empno %>">
<table width="700px" height="600px" cellpadding="0" cellspacing="0" width="100%">
	<tr align="center" valign="middle">
		<td colspan="5"><h3><b>사내 자료실</b></h3></td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">글쓴이</div>
		</td>
		<td>
			<%=ename %>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>	
		</td>
		<td style="font-family:돋음; font-size:12" height="16">
			<input name="BOARD_TITLE" type="text" size="50" maxlength="100" 
				value=""/>
		</td>
	</tr>

	<tr>
	
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
		
			<textarea class="ckeditor" id="content" name="BOARD_CONTENT" cols="80" rows="15"></textarea>
			
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2"></td>
	<tr align="center" valign="middle">
		<td colspan="5">
		
				<a href="javascript:addboard()">
				<input type="submit" value="등록" class="btn btn-primary btn-inline-block btn-lg">
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
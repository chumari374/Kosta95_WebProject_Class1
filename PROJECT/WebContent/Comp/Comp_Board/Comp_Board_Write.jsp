<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
	String empno = (String)session.getAttribute("empno"); 
	String ename = (String)session.getAttribute("ename");
	String teamcode = (String)session.getAttribute("teamcode");
	String deptcode = (String)session.getAttribute("deptcode");
	String grade = (String)session.getAttribute("grade");
	

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
</head>
<body>
<!-- 게시판 등록 -->
<form action="BoardAddAction.cp" method="post" name="boardform">
<input type="hidden" name="BOARD_ID" value="<%=ename %>">
<table cellpadding="0" cellspacing="0" width="100%">
	<tr align="center" valign="middle">
		<td colspan="5"> 사내 게시판</td>
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
		
			 공지사항 <input type="checkbox" name = "BOARD_NOTICE"/>
		
		</td>
	</tr>

	<tr>
	
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea class="ckeditor" id="content" name="content" name="BOARD_CONTENT" cols="80" rows="15"></textarea>
			
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">파일 첨부</div>
		</td>
		<td>
			<input name="BOARD_FILE" type="file"/>
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5">
			<a href="javascript:addboard()">[등록]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[뒤로]</a>
		</td>
	</tr>
</table>
</form>
<!-- 게시판 등록 -->
</body>
</html>
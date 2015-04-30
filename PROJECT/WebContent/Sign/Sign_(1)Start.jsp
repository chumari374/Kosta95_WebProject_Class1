<%@page import="java.util.ArrayList"%>
<%@page import="DAO.SignDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int empno = (Integer) session.getAttribute("empno");
	int teamcode = (Integer) session.getAttribute("teamcode");
	int deptcode = (Integer) session.getAttribute("deptcode");
	int grade = (Integer) session.getAttribute("grade");

	SignDAO sign = new SignDAO();
	ArrayList infoList = (ArrayList) sign.getInfoList(grade, deptcode,
			teamcode);

	String deptname = (String) infoList.get(0);
	String teamname = (String) infoList.get(1);
	String getSign = (String) infoList.get(2);
	int getSignNum = Integer.parseInt((String) infoList.get(3));

	sign.getEmpname(empno);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>기안서 작성</title>
<script src="http://icode.jquery.com/jquery-1.11.2.min.js"></script>
<script>
	$(function() {
		$("td:first-child").css("background-color", "#EFEFEF");
	});
</script>
<style type="text/css">
table, td, tr {
	border: 1px solid gray;
	border-collapse: collapse;
	width: 800px;
}

.content {
	height: 250px;
}
</style>
<script type="text/javascript" src="./ckeditor/ckeditor.js">
	CKEDITOR.replace('content', {
		toolbar : 'Full',
		uiColor : '#9AB8F3',
	});
</script>
<SCRIPT type="text/javascript">
	function check() {

		if (!write.TITLE.value) {
			alert("제목을 입력하세요");
			bbs.subject.focus();
			return false;
		}

		var ckeditor = CKEDITOR.instances['CONTENT']; //객체가져오기
		if (ckeditor.getData() == "") {//null값은 안옴 = 빈문자열
			alert("글 내용을 입력하세요");
			ckeditor.focus();
			return false;
		}
		
		document.write.submit();
	}
</SCRIPT>
</head>
<body>
	<jsp:include page="../Main.jsp"></jsp:include>
	<div id="main" align="center">
		<form action="SignAddAction.hong" method="post"
			enctype="multipart/form-data" id="write" name="write">
			<center>
				<table>
					<tr>
						<td>부서</td>
						<td><%=deptname%></td>
					</tr>
					<tr>
						<td>팀</td>
						<td><%=teamname%></td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td>제목</td>
						<td><input id="TITLE" name="TITLE" type="text"
							style="width: 500px"></td>
					</tr>
					<tr>
						<td>파일첨부</td>
						<td>&nbsp;<input id="File_sign" name="File_sign" type="file"></td>
					</tr>
					<tr class="content">
						<td>내용</td>
						<td><textarea rows="10" cols="60" name="CONTENT" id="CONTENT"></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('CONTENT');
							</script></td>
					</tr>
					<tr>
						<td>결재자</td>
						<td><%=getSign%></td>
					</tr>
				</table>
				<input id="STARTER" name="STARTER" type="hidden" value="<%=empno%>">
				<input id="EMPNO" name="EMPNO" type="hidden" value="<%=empno%>">
				<input id="GETSIGN" name="GETSIGN" type="hidden"
					value="<%=getSignNum%>"> <input id="STEP" name="STEP"
					type="hidden" value="1">
				<input type="button" value="작성완료" onclick="check()">
			</center>
		</form>
	</div>
	<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
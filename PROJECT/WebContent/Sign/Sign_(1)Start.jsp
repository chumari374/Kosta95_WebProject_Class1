<%@page import="java.util.ArrayList"%>
<%@page import="DAO.SignDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/* 	int empno = Integer.parseInt((String)session.getAttribute("empno"));
	int ename = Integer.parseInt((String)session.getAttribute("ename"));
	int teamcode = Integer.parseInt((String)session.getAttribute("teamcode"));
	int deptcode = Integer.parseInt((String)session.getAttribute("deptcode"));
	int grade = Integer.parseInt((String)session.getAttribute("grade")); */

	SignDAO sign = new SignDAO();
	ArrayList infoList = (ArrayList) sign.getInfoList(4, 110, 1101);

	String deptname = (String) infoList.get(0);
	String teamname = (String) infoList.get(1);
	String getSign = (String) infoList.get(2);
	int getSignNum = Integer.parseInt((String)infoList.get(3));
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
<script type="text/javascript" src="../ckeditor/ckeditor.js">
    CKEDITOR.replace('content',{
            toolbar: 'Full',
            uiColor: '#9AB8F3',
        }
    );
</script>
<SCRIPT type="text/javascript">
	function check() {

		if (!bbs.subject.value) {
			alert("제목을 입력하세요");
			bbs.subject.focus();
			return false;
		}

		if (!bbs.writer.value) {

			alert("이름을 입력하세요");
			bbs.writer.focus();
			return false;
		}

		var ckeditor = CKEDITOR.instances['content']; //객체가져오기
		if (ckeditor.getData() == "") {//null값은 안옴 = 빈문자열
			alert("글 내용을 입력하세요");
			ckeditor.focus();
			return false;
		}

		if (!bbs.pwd.value) {
			alert("비밀번호를 입력하세요");
			bbs.pwd.focus();
			return false;
		}

		document.bbs.submit();

	}
</SCRIPT>
</head>
<body>
	<form action="SignAddAction.hong" method="post">
		<center>
			<table>
				<tr>
					<td>문서종류</td>
					<td>&nbsp;<select><option>선택하세요</option></select></td>
				</tr>
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
					<td><input id="TITLE" type="text" style="width: 500px"></td>
				</tr>
				<tr>
					<td>파일첨부</td>
					<td>&nbsp;<input id="FILEPATH" type="file"></td>
				</tr>
				<tr class="content">
					<td>내용</td>
					<td><textarea rows="10" cols="60" name="content" id="content"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('content');
						</script></td>
				</tr>
				<tr>
					<td>결재자</td>
					<td><%=getSign%><input id = "SIGNNUM" type="hidden" value="<%=getSignNum %>"></td>
				</tr>
			</table>
			<button>미리보기</button>
			&nbsp;
			<button>임시저장</button>
			&nbsp;<input type="submit" value="작성완료">
		</center>
	</form>
</body>
</html>
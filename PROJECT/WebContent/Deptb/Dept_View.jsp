<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="100%" align="center">
<tr>
 <td>게시판번호</td><td>${read.no }</td>
 <td>작성자</td><td>${read.writer }</td>
 <td>작성날짜</td><td>${list.regdate}</td></tr>
<tr> <td>제목</td><td>${read.title }</td></tr>
<tr> <td>내용</td><td>${read.contents }</td></tr>

</table>

</body>
</html>
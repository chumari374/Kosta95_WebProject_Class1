<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!-- 부서게시판 페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table, tr, td {
		border: 1px solid gray;
 		border-collapse: collapse;
 		padding: 5px;
 		padding-left: 10px; 
 		padding-right: 10px;
	}
</style>
</head>
<body>
	<table width="80%">
		<tr>
			<td colspan="5" align="right">
				<select>
					<option>제목</option>
					<option>내용</option>
					<option>작성자</option>
				</select>
				&nbsp;
				<input type="text">
				&nbsp;
				<input type="button" value="검색">
			</td>
		</tr>
		<tr>
                <td>글번호</td>
                <td>제목</td>
                <td>작성자</td>
                <td>작성일</td>
                <td>조회수</td>
        </tr>    
		<!-- 동적으로 구성 -->
		<!-- WebJSP7_BasicBoard > board_list.jsp 참고 -->
		<tr>
				<td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
		</tr>
		<tr>
				<td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
		</tr>
		<tr>
				<td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
		</tr>
		<tr>
			<td colspan="4" align="center"> &lt; 1 2 3 4 5 6 7 8 9 10 &gt; </td>
			<td align="center"><input type="button" value="글쓰기"></td>
		</tr>
	</table>
</body>
</html>
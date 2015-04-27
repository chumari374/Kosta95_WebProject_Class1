<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 사내게시판 페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-9">
    	 <table class="table table-list-search">
                    <thead>
                      
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
                    </thead>
                    <tbody>
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
			<td align="center"><input type="button" value="글쓰기" onclick="location.href='<%=request.getContextPath()%>/CompBoardWrite.cp'"></td>
		</tr>
                    </tbody>
	
	</table>
	</div>
	</div>
	</div>
</body>
</html>
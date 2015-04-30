<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 개인정보수정 페이지 -->
<!-- 자신이 수정할수있는 정보는 input text가 있고, 수정할수없는 정보는 보여주기만 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<style type="text/css">
 table, tr, td{
 	border: 1px solid gray;
 	border-collapse: collapse;
 	padding: 5px;
 	padding-left: 10px; 
 	padding-right: 10px;
 } 
</style>
<script type="text/javascript">

</script>
</head>
<body>
<jsp:include page="../Main.jsp"></jsp:include>
   <div id="main" align="center">
	<form action="Account_Update.mp" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td>사원번호  </td>
				<td>${requestScope.account.empno}</td>
			</tr>
			<tr>
				<td>이름 </td>
				<td>${requestScope.account.ename}</td>
			</tr>
			<tr>
				<td>생년월일  </td>
				<td>${requestScope.account.birth}</td>
			</tr>
			<tr>
				<td>성별  </td>
				<td>${requestScope.account.sex}</td>
			</tr>
			<tr>
				<td>소속부서 </td>
				<td>${requestScope.account.deptname}</td>
			</tr>
			<tr>
				<td>소속팀 </td>
				<td>${requestScope.account.teamname}</td>
			</tr>
			<tr>
				<td>패스워드  </td>
				<td><input type="password" name="pwd" id="pwd"></td>
			</tr>
			<tr>
				<td>이메일 주소 </td>
				<td><input type="text" name="email" id="email"></td>
			</tr>
			<tr>
				<td>주소  </td>
				<td><input type="text" size="30" name="addr" id="addr"></td>
			</tr>
			<tr>
				<td>핸드폰 번호  </td>
				<td><input type="text" name="celphone" id="celphone"></td>
			</tr>
			<tr>
				<td>프로필 사진  </td>
				<td><input type="file" name="p_picture" id="p_picture"></td>
			</tr>
			<tr>
				<td>프로필 메세지 </td>
				<td><textarea rows="5" cols="32" name="p_content" id="p_content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정">&nbsp;<input type="button" value="취소"></td>
			</tr>
		</table>
	</form>
	</div>
   
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
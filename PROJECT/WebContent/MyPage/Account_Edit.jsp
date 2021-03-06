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
<script>
   $(function() {
// 	  $("td").css("background-color","white");
//       $("td:first-child").css("background-color", "#E8E8E8");
//       $("table,tr,td").css("border","1px solid #F6F6F6");
      $("table").css("margin-bottom","10px");
      $("table").css("width","500px");
      $("td:first-child").css("width","100px");
   });
</script>
<style type="text/css">
body,table,tr,td{
	font-size: 13px; 
}
input.css3button {
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
</head>
<body>
<jsp:include page="../Main.jsp"></jsp:include>
   <div id="main" align="left">
   <div style="margin-left: 30px; margin-bottom: 10px;"><h3>개인정보 수정</h3></div>
   <div id="wrapper" style="width: 70%; margin-left: 250px;">
	<form action="Account_Update.mp" method="post" enctype="multipart/form-data">
		<table class="table table-striped">
			<tr>
				<td><b>사원번호 </b></td>
				<td>${requestScope.memberInfo.empno}</td>
			</tr>
			<tr>
				<td><b>이름 </b></td>
				<td>${requestScope.memberInfo.ename}</td>
			</tr>
			<tr>
				<td><b>생년월일</b>  </td>
				<td>${requestScope.memberInfo.birth}</td>
			</tr>
			<tr>
				<td><b>성별</b>  </td>
				<td>${requestScope.memberInfo.sex}</td>
			</tr>
			<tr>
				<td><b>소속부서 </b></td>
				<td>${requestScope.memberInfo.deptname}</td>
			</tr>
			<tr>
				<td><b>소속팀</b> </td>
				<td>${requestScope.memberInfo.teamname}</td>
			</tr>
			<tr>
				<td><b>패스워드</b>  </td>
				<td><input type="password" name="pwd" id="pwd" value="${requestScope.account.pwd}"></td>
			</tr>
			<tr>
				<td><b>이메일 주소 </b></td>
				<td><input type="text" name="email" id="email" value="${requestScope.account.email}"></td>
			</tr>
			<tr>
				<td><b>주소 </b> </td>
				<td><input type="text" size="30" name="addr" id="addr" value="${requestScope.account.addr}"></td>
			</tr>
			<tr>
				<td><b>핸드폰 번호</b>  </td>
				<td><input type="text" name="celphone" id="celphone" value="${requestScope.account.celphone}"></td>
			</tr>
			<tr>
				<td><b>프로필 사진 </b> </td>
				<td><input type="file" name="p_picture" id="p_picture" ></td>
			</tr>
			<tr>
				<td><b>프로필 메세지 </b></td>
				<td><textarea rows="5" cols="32" name="p_content" id="p_content">${requestScope.account.p_content}</textarea></td>
			</tr>
		</table>
			<div align="left" style="margin-left: 200px;"><input type="submit" class="css3button" value="수정">&nbsp;
			<input type="button" value="취소" class="css3button" onclick="script:history.go(-1)">
			</div>
	</form>
	</div>
   </div>
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
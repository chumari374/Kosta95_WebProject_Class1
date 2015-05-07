<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.getSession().invalidate();
%>	
<!-- 로그인 페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link type="text/css" rel="stylesheet" href="css/mystyle.css">
<style>
body {
	background-image: url("img/10.jpg");
	background-size: cover;
	background-repeat: no-repeat;
}

.container {
	margin-top: 10px !important;
	margin-left: 33% !important;
}

#mainpagetitle {
	color: white;
	font-family: 맑은 고딕, 고딕, sans-serif;
	text-align: center;
	float: right;
	margin-right: 6%;
	margin-bottom: 10%;
}
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript">
	//유효성체크
	$(function(){
		$('#login').click(function(){
			var empno = $('#empno').val();
			var pwd = $('#pwd').val();
			console.log(empno+"/"+pwd);
			//사번의 길이가 0이거나 null일때
			if(empno.length==0||empno==null){
				alert('사원번호를 입력하세요');
				return false;
			}
			//암호의 길이가 0이거나 null일때
			if(pwd.length==0||pwd==null){
				alert('비밀번호를 입력하세요');
				return false;
			}
			//성공하면 AdminFrontController로 넘김
			document.loginForm.action="login_Ok.ad";
			document.loginForm.submit();
		});
		
	});
	//사번 숫자 체크
	function onlyNum(){
		//event 객체 (mouse 제어, 키보드 입력값 제어)
		if((event.keyCode<48)||(event.keyCode>57)){
			event.returnValue = false;
		}
	}
</script>
</head>
<body>
	<div id="mainpagetitle">
		<h1>
			<b>KOSTA 95기 1조 회사 인트라넷 페이지</b>
		</h1>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">로그인하세요</h3>
					</div>
					<div class="panel-body"><!-- action="login_Ok.ad" -->
						<form role="form"  method="post" name="loginForm">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="사원번호" name="empno" id="empno"
										type="text" onkeypress="onlyNum()">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="비밀번호" name="pwd" id="pwd"
										type="password" value="">
								</div>
								<div>
									<a href="Pwd_Search.jsp">비밀번호 찾기</a>
								</div>
								<input class="btn btn-lg btn-success btn-block" type="submit"
									value="로그인" id="login">
							</fieldset>
						</form>
						<hr/>
						<center>
							<h4>OR</h4>
						</center>
						<a href="Register.jsp"><input
							class="btn btn-lg btn-primary btn-block" type="button"
							value="회원가입"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
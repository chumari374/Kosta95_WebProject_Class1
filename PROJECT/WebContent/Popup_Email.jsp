<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Email 확인</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#checkEmail').click(function(){
				var length = $('#email').val().length;
				var email = $('#email').val();
				if(length==0){
					alert('입력하세요');
					return false;
				}
				//비동기 처리
				//존재하면 ""(빈값)
				//존재하지않으면 email
				$.post(
					url="emailCheck.ad",
					'email='+email,
					function(data){
						opener.document.registerForm.email.value = data;//비동기로 넘어온 값 대입
						if(data.length>0){ //길이가 0보다 크면 사용가능한 email
							alert('사용 가능한 이메일입니다.');
							window.close();
						}else{ //길이가 0이면 존재한는 email
							alert('존재하는 이메일입니다.');
						}
						
					}
				);
			});
		});
	</script>
</head>
<body>
<div class="container">

<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form role="form" method="post" name="registerForm">
			<h2>이메일 <small>확인합니다</small></h2>
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-8 col-sm-9 col-md-8">
					<div class="form-group">
				<input type="text" name="email" id="email" class="form-control input-lg" placeholder="이메일 주소" tabindex="4">
			</div>
				</div>
				<div class="col-xs-4 col-sm-3 col-md-4">
					<input class="btn btn-lg btn-warning btn-block" type="button" value="중복확인" id="checkEmail">
				</div>
			</div>
		</form>
	</div>
</div>
</div>
</body>
</html>
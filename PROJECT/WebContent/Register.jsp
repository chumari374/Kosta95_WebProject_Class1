<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 회원가입 페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원 가입</title>
	<style>
		body {
		    background-color: #f5f5f5;
		}
	</style>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('#checkEmpno').click(function(){
				//사번 중복 확인 버튼을 누르면
				//'Popup_Empno.jsp' 팝업창 오픈
				open('Popup_Empno.jsp', 'checkEmpno', 'width=500 height=200');
			});
			
			$('#checkEmail').click(function(){
				//이메일 중복 확인 버튼을 누르면
				//'Popup_Email.jsp' 팝업창 오픈
				open('Popup_Email.jsp', 'checkEmail', 'width=500 height=200');
			});
			
			$('#registerOk').click(function(){
				//pwd와 pwd2 일치확인
				var pwd = $('#pwd').val();
				var pwd2 = $('#pwd2').val();
				
				if(pwd2!=pwd){
					alert('비밀번호 확인이 맞지 않습니다');
					return false;
				}
				document.registerForm.action='register_Ok.ad';
				document.registerForm.submit();
			});
		});
	</script>
</head>
<body>
<div class="container">

<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form role="form" method="post" name="registerForm" enctype="multipart/form-data">
			<h2>회원가입 <small>환영합니다</small></h2>
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-8">
					<div class="form-group">
                        <input type="text" name="empno" id="empno" class="form-control input-lg" placeholder="사원번호" tabindex="1" readonly="readonly">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4">
				<!-- 사번 중복 확인 버튼 -->
				<input class="btn btn-lg btn-danger btn-block" type="button" value="중복확인" id="checkEmpno">
				</div>
			</div>
				<div class="form-group">
					<input type="password" name="pwd" id="pwd" class="form-control input-lg" placeholder="비밀번호" tabindex="2">
				</div>
				<div class="form-group">
					<input type="password" name="pwd2" id="pwd2" class="form-control input-lg" placeholder="비밀번호 확인" tabindex="3">
				</div>
			<div class="row">
				<div class="col-xs-8 col-sm-9 col-md-8">
					<div class="form-group">
				<input type="text" name="email" id="email" class="form-control input-lg" placeholder="이메일 주소" tabindex="4" readonly="readonly">
			</div>
				</div>
				<div class="col-xs-4 col-sm-3 col-md-4">
					<!-- 이메일 중복 확인 버튼 -->
					<input class="btn btn-lg btn-warning btn-block" type="button" value="중복확인" id="checkEmail">
				</div>
			</div>
			<div class="form-group">
				<input type="text" name="addr" id="addr" class="form-control input-lg" placeholder="주소" tabindex="5">
			</div>
			<div class="form-group">
				<input type="text" name="celphone" id="celphone" class="form-control input-lg" placeholder="휴대전화" tabindex="6">
			</div>
			<div>
			    <label for="comment">프로필 사진 업로드</label>
				<input type="file" name="p_picture" id="p_picture" class="form-control input-lg" value="프로필사진" placeholder="프로필사진" tabindex="7"><br />
           </div>
			
            <div class="form-group">
				<textarea class="form-control" name="p-content" id="p-content" rows="5" placeholder="프로필 내용"></textarea>
            </div>
			
			
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-md-6"><input type="submit" value="회원가입" class="btn btn-primary btn-block btn-lg" tabindex="7" id="registerOk"></div>
				<div class="col-xs-12 col-md-6"><a href="#" class="btn btn-success btn-block btn-lg">취소</a></div>
			</div>
		</form>
	</div>
</div>

</div>
</body>
</html>

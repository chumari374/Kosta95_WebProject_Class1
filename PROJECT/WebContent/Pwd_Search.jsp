<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 비밀번호 찾기 페이지 -->
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
	<script type="text/javascript">
		function goBack() {
			window.history.back();
		}
		
		function checkEmpty() {
			if (!pwd_search_div.empno.value){
				alert("사번을 입력 하세요.");
				return false;
			} else if (!pwd_search_div.email.value) {
				alert("이메일을 입력 하세요.");
				return false;
			}
			
			document.registerForm.submit();
		}
	</script>
	<style>
	  body {
	    background-color: #f5f5f5;
	  }
	</style>
</head>
<body>
<div class="container">

<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
    	<!-- 클릭하면 AdminFrontController로 이동 -->
		<form action="pwd_search.ad" role="form" method="post" name="registerForm" id="pwd_search_div">
			<h2>비밀번호 찾기 <small></small></h2>
			<hr class="colorgraph">
				<!-- 확인요소 : 사번, 이메일 -->
				<div class="form-group">
					<input type="text" name="empno" id="empno" class="form-control input-lg" placeholder="사원번호" tabindex="2">
				</div>
				<div class="form-group">
					<input type="text" name="email" id="email" class="form-control input-lg" placeholder="이메일" tabindex="3">
				</div>
	
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-md-6"><a onclick="checkEmpty()" type="button" value="찾기" class="btn btn-primary btn-block btn-lg" tabindex="7" id="registerOk">찾기</a></div>
				<div class="col-xs-12 col-md-6"><a onclick="goBack()" class="btn btn-success btn-block btn-lg">취소</a></div>
			</div>
		</form>
	</div>
</div>
</div>
</body>
</html>
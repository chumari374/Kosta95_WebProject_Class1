<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<script type="text/javascript">
		window.onload = function(){
			document.getElementById("pwd_search_ok").onclick = function(){
				//location.href = "pwd_search.ps";
			}
		}
		
	</script>
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
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form action="pwd_search.ad" role="form" method="post" name="registerForm" id="pwd_search_div">
			<h2>비밀번호 찾기 <small></small></h2>
			<hr class="colorgraph">
	
				<div class="form-group">
					<input type="text" name="empno" id="email" class="form-control input-lg" placeholder="사원번호" tabindex="2">
				</div>
				<div class="form-group">
					<input type="email" name="empno" id="email" class="form-control input-lg" placeholder="이메일" tabindex="3">
				</div>
	
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-md-6"><input type="submit" value="찾기" class="btn btn-primary btn-block btn-lg" tabindex="7" id="registerOk"></div>
				<div class="col-xs-12 col-md-6"><a href="#" class="btn btn-success btn-block btn-lg">취소</a></div>
			</div>
		</form>
	</div>
</div>
</div>
</body>
</html>
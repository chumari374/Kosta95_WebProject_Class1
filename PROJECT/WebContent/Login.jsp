<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 로그인 페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link type="text/css" rel="stylesheet" href="css/mystyle.css">
<style>
  body{ 
          background-image: url("img/2.jpg");
          background-size: cover;
          background-repeat: no-repeat;
  }
  .container
  {
    margin-top: 180px !important;
  }
  #mainpagetitle {
                     color: white;
                     font-family: 맑은 고딕, 고딕, sans-serif;
                     text-align: center;
  }
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
</head>
<body>
<div id="mainpagetitle"><h3>KOSTA 95기 1조 회사 인트라넷 페이지</h3></div>
<div class="container">
    <div class="row">
    	<div class="col-md-4 col-md-offset-4">
    		<div class="panel panel-default">
			  	<div class="panel-heading">
			    	<h3 class="panel-title">로그인하세요</h3>
			 	</div>
			  	<div class="panel-body">
			    	<form accept-charset="UTF-8" role="form">
                    <fieldset>
			    	  	<div class="form-group">
			    		    <input class="form-control" placeholder="사원번호" name="empno" type="text">
			    		</div>
			    		<div class="form-group">
			    			<input class="form-control" placeholder="비밀번호" name="password" type="password" value="">
			    		</div>
			    		<div>
			    	    		<a href="Pwd_Search.jsp">비밀번호 찾기</a><p />
			    	    </div>
			    		<input class="btn btn-lg btn-success btn-block" type="submit" value="로그인">
			    	</fieldset>
			      	</form>
                      <hr/>
                    <center><h4>OR</h4></center>
                    <a href="Register.jsp"><input class="btn btn-lg btn-primary btn-block" type="submit" value="회원가입"></a>
			    </div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
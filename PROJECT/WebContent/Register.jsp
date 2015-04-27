<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 회원가입 페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
<link type="text/css" rel="stylesheet" href="css/mystyle.css">
<style>
	#p_content {
	     border-color: red;
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

<div class="container">

<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form role="form">
			<h2>회원가입 <small>환영합니다</small></h2>
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-8">
					<div class="form-group">
                        <input type="text" name="empno" id="empno" class="form-control input-lg" placeholder="사원번호" tabindex="1">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4">
				<input class="btn btn-lg btn-danger btn-block" type="submit" value="중복확인">
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
				<input type="email" name="email" id="email" class="form-control input-lg" placeholder="이메일 주소" tabindex="4">
			</div>
				</div>
				<div class="col-xs-4 col-sm-3 col-md-4">
					<input class="btn btn-lg btn-warning btn-block" type="submit" value="중복확인">
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
			
			<form role="form">
              <div class="form-group">
                 <textarea class="form-control" name="p-content" id="p-content" rows="5">프로필 내용</textarea>
              </div>
            </form>
			
			<div class="row">
				<div class="col-xs-4 col-sm-3 col-md-3">
					<span class="button-checkbox">
						<button type="button" class="btn" data-color="info" tabindex="7">동의</button>
                        <input type="checkbox" name="t_and_c" id="t_and_c" class="hidden" value="1">
					</span>
				</div>
				<div class="col-xs-8 col-sm-9 col-md-9">
					<strong class="label label-primary">동의</strong> 버튼을 누르면 본 사이트 이용에 관한&nbsp;<a href="#" data-toggle="modal" data-target="#t_and_c_m">사이트 약관</a>에 동의합니다.
				</div>
			</div>
			
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-12 col-md-6"><input type="submit" value="회원가입" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
				<div class="col-xs-12 col-md-6"><a href="#" class="btn btn-success btn-block btn-lg">로그인</a></div>
			</div>
		</form>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Terms & Conditions</h4>
			</div>
			<div class="modal-body">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">I Agree</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>
</body>
</html>
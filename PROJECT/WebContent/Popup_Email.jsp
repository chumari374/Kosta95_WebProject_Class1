<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Email Ȯ��</title>
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
					alert('�Է��ϼ���');
					return false;
				}
				$.post(
					url="emailCheck.ad",
					'email='+email,
					function(data){
						opener.document.registerForm.email.value = data;
						if(data.length>0){
							alert('��� ������ �̸����Դϴ�.');
							window.close();
						}else{
							alert('�����ϴ� �̸����Դϴ�.');
						}
						
					}
				);
				/* document.registerForm.action='empnoCheck.ad';
				document.registerForm.submit();
				opener.document.registerForm.empno.value = empno; */
				//window.close();
			});
		});
	</script>
</head>
<body>
<div class="container">

<div class="row">
    <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form role="form" method="post" name="registerForm">
			<h2>�̸��� <small>Ȯ���մϴ�</small></h2>
			<hr class="colorgraph">
			<div class="row">
				<div class="col-xs-8 col-sm-9 col-md-8">
					<div class="form-group">
				<input type="text" name="email" id="email" class="form-control input-lg" placeholder="�̸��� �ּ�" tabindex="4">
			</div>
				</div>
				<div class="col-xs-4 col-sm-3 col-md-4">
					<input class="btn btn-lg btn-warning btn-block" type="button" value="�ߺ�Ȯ��" id="checkEmail">
				</div>
			</div>
		</form>
	</div>
</div>
</div>
</body>
</html>
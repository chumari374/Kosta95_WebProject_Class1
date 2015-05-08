<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/myscript.js"></script>
<style type="text/css">
	body {
		font-size: 72.5%;
	}
/* 	table {border:1px solid black}
	.btn-back {
		background-color: #5B5847;
		color: white;
	} */
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
<script type="text/javascript">
	$(function(){
		$.ajax({
	        url : 'Emp_Search/Dept.jsp',
	        dataType : "json",
	        success : function(data){
	      	  var options="";
	            $.each(data, function(index,dlist){
	            	 options += "<option value="+dlist.deptcode+">"+dlist.deptname+"</option>";
	            });
	            $('#deptlist').append(options);
	            
	        },
	       error: function (xhr,Options,thrownError) {
	       }
	    });
		

		 $('#deptlist').on("click",function(){
	 	  	// 팀 목록 출력
	 	  	$('#teamlist').empty();
	 	  	 $.ajax({
	              url : 'Emp_Search/Team.jsp',
	              data:{deptcode:$('#deptlist').val()},
	              dataType : "json",
	              success : function(data){
	            	  var options="";
	                  $.each(data, function(index,tlist){
	                         options += "<option value="+tlist.teamcode+">"+tlist.teamname+"</option>";
	                  });
	                  $('#teamlist').append(options);
	              },
	             error: function (xhr,Options,thrownError) {
	             }
	 	  	});
	 	 });
		 
		 $('#empnocheck').click(function(){
			 open('Popup_Empno.jsp', 'checkEmpno', 'width=500 height=200');
		 });
		  
	});
	function onlyNum(){
		//event 객체 (mouse 제어, 키보드 입력값 제어)
		if((event.keyCode<48)||(event.keyCode>57)){
			event.returnValue = false;
		}
	}
	function checkForm(){
		var year = $('#year').val();
		var month = $('#month').val();
		var day = $('#day').val();
		
		if(month>12 || month < 1){
			alert("1부터 12까지 넣어주세요");
			return false;
		}
		
		if(month==2){
			if(year%4==0 && (day>29 || day < 1)){
				alert("1부터 29까지 넣어주세요");
				return false;
			}else if(day>28 || day < 1){
				alert("1부터 28까지 넣어주세요");
				return false;
			}
		}else if(month==4||month==6||month==9||month==11){
			if(day>30 || day < 1)
				alert("1부터 30까지 넣어주세요");
			return false;
		}else if(month==1||month==3||month==5||month==7||month==8||month==10||month==12){
			if(day>31 || day < 1)
				alert("1부터 31까지 넣어주세요");
			return false;
		}
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../Main.jsp"></jsp:include>
 <div id="main" align="left" style="overflow: scroll;">
	<div class="container" >
	<div id="wrapper" style="width: 90%;">
		<div style="margin: 30px; "><h3>신입사원 추가</h3></div>
		<div align="left" style="margin-bottom: 0px; margin-left: 300px;">
		<form action="MemberAddUpdate.admin" method="post" name="MemberAddForm">
			<table class="table" style="width: 60%">
				<tr>
					<th>사원번호</th>
					<td colspan="3">
						<input type="text" name="empno" size="10px" readonly="readonly">&nbsp;
						<input type="button" id="empnocheck" value="중복확인" class="css3button">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="ename" size="10px"></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>관리자권한</th>
					<td><select name="admin" id="admin">
							<option value="true">관리자</option>
							<option value="false">일반사용자</option>
					</select></td>
					<td colspan="2">
				</tr>
				<tr>
					<th>부서</th>
					<td><select name="dept" id="deptlist">
					</select></td>
					<td colspan="2">
				</tr>
				<tr>
					<th>팀</th>
					<td><select name="team" id="teamlist">
					</select></td>
					<td colspan="2">
				</tr>
				<tr>
					<th>직급</th>
					<td><select id="gradelist" name="grade" >
										<option value="1">&nbsp;&nbsp;대표이사</option>
										<option value="2">&nbsp;&nbsp;&nbsp;부장</option>
										<option value="3">&nbsp;&nbsp;&nbsp;팀장</option>
										<option value="4" selected >&nbsp;&nbsp;&nbsp;사원</option>
					</select></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<th>사내전화번호</th>
					<td><input type="text" name="emptel" size="10px"></td>
					<td colspan="2">
				</tr>
				<tr>
					<th>성별</th>
					<td><select name="sex">
							<option value="남자">남자</option>
							<option value="여자">여자</option>
					</select></td>
					<td colspan="2">
				</tr>
				<tr>
					<th>생년월일</th>
					<td colspan="3">
						<input type="text" name="year" id="year" height="40px" size="10px" maxlength="4" onkeypress="onlyNum()">&nbsp;년 &nbsp;&nbsp;
						<input type="text" name="month" id="month" size="5px" maxlength="2" onkeypress="onlyNum()">&nbsp;월 &nbsp;&nbsp;
						<input type="text" name="day" id="day" size="5px" maxlength="2" onkeypress="onlyNum()">&nbsp;일
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="submit" class="css3button" value="등록" onclick="checkForm()">&nbsp;
					<input type="reset" class="css3button" value="취소"></td>
				</tr>
			</table>
		</form>
		</div>
	
	</div>
	</div>
	</div>
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>

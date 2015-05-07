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
	table {border:1px solid black}
	.btn-back {
		background-color: #5B5847;
		color: white;
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
		}else{
			if(day>31 || day < 1)
				alert("1부터 31까지 넣어주세요");
			return false;
		}
		document.MemberAddForm.submit();
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../Main.jsp"></jsp:include>
 <div id="main" align="left" style="overflow: scroll;">
	<div class="container" >
	<div id="wrapper" style="width: 90%;">
		<div align="center" style="margin-bottom: 0px;">
		<form action="MemberAddUpdate.admin" method="post" name="MemberAddForm">
			<table>
				<tr>
					<td>사원번호</td>
					<td><input type="text" name="empno" size="10px" readonly="readonly"></td>
					<td colspan="2"><input type="button" id="empnocheck" value="중복확인"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="ename" size="10px"></td>
					<td colspan="2">
				</tr>
				<tr>
					<td>관리자권한</td>
					<td><select name="admin" id="admin">
							<option value="true">관리자</option>
							<option value="false">일반사용자</option>
					</select></td>
					<td colspan="2">
				</tr>
				<tr>
					<td>부서</td>
					<td><select name="dept" id="deptlist">
					</select></td>
					<td colspan="2">
				</tr>
				<tr>
					<td>팀</td>
					<td><select name="team" id="teamlist">
					</select></td>
					<td colspan="2">
				</tr>
				<tr>
					<td>직급</td>
					<td><select id="gradelist" name="grade" >
										<option value="1">&nbsp;&nbsp;대표이사</option>
										<option value="2">&nbsp;&nbsp;&nbsp;부장</option>
										<option value="3">&nbsp;&nbsp;&nbsp;팀장</option>
										<option value="4" selected >&nbsp;&nbsp;&nbsp;사원</option>
					</select></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td>사내전화번호</td>
					<td><input type="text" name="emptel" size="10px"></td>
					<td colspan="2">
				</tr>
				<tr>
					<td>성별</td>
					<td><select name="sex">
							<option value="남자">남자</option>
							<option value="여자">여자</option>
					</select></td>
					<td colspan="2">
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" name="year" id="year" height="40px" size="10px" maxlength="4" onkeypress="onlyNum()">년</td>
					<td><input type="text" name="month" id="month" size="5px" maxlength="2" onkeypress="onlyNum()">월</td>
					<td><input type="text" name="day" id="day" size="5px" maxlength="2" onkeypress="onlyNum()">일</td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="button" value="등록" onclick="checkForm()"><input type="reset" value="취소"></td>
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
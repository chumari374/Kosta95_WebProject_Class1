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
	
	.btn-back {
		background-color: #5B5847;
		color: white;
	}
</style>
<script type="text/javascript">
	$(function(){
		$.ajax({
	        url : '../Emp_Search/Dept.jsp',
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
	              url : '../Emp_Search/Team.jsp',
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
		 
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../Main.jsp"></jsp:include>

	<div class="container" >
	<div id="wrapper" style="width: 90%;">
		<div align="center" style="margin-bottom: 0px;">
		<table>
			<tr>
				<td>사원번호</td>
				<td><input type="text" name="empno"></td>
				<td><input type="button" id="empnocheck" value="중복확인"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="ename"></td>
			</tr>
			<tr>
				<td>관리자권한</td>
				<td><select name="admin" id="admin">
						<option value="true">관리자</option>
						<option value="false">일반사용자</option>
				</select></td>
			</tr>
			<tr>
				<td>부서</td>
				<td><select name="dept" id="deptlist">
				</select></td>
			</tr>
			<tr>
				<td>팀</td>
				<td><select name="team" id="teamlist">
				</select></td>
			</tr>
			<tr>
				<td>직급</td>
				<td><select id="gradelist" name="grade">
									<option value="1">대표이사</option>
									<option value="2">부장</option>
									<option value="3">팀장</option>
									<option value="4" selected>사원</option>
				</select><input type="button" id="gradecheck" value="직급확인"></td>
			</tr>
			<tr>
				<td>사내전화번호</td>
				<td><input type="text" name="emptel"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><select name="sex">
						<option value="남자">남자</option>
						<option value="여자">여자</option>
				</select></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="year" height="40px" size="10px">년</td>
				<td><input type="text" name="month" size="5px">월</td>
				<td><input type="text" name="day" size="5px">일</td>
			</tr>
	
	
		</table>
		</div>
	
	</div>
	</div>
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
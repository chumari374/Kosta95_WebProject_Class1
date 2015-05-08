<%@page import="DTO.MemberInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- (어드민전용)사원정보수정 페이지 -->
<!-- 자신이 수정할수있는 정보는 input text가 있고, 수정할수없는 정보는 보여주기만 -->
<% 
	MemberInfoDTO member = (MemberInfoDTO)request.getAttribute("member");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

table, tr, td  {
   border-radius: 5px;
   padding: 10px;
   margin: 10px;
}
</style>
   <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/myscript.js"></script>
<script type="text/javascript">
$(function(){
	
	memberDeptname = "<%= member.getDeptname() %>";
	
	$.ajax({
        url : './Emp_Search/Dept.jsp',
        dataType : "json",
        success : function(data){
      	  var options="";
            $.each(data, function(index,dlist){
            	if(dlist.deptname==memberDeptname){
            	   options += "<option value="+dlist.deptcode+" selected>"+dlist.deptname+"</option>";
            	}else{
                   options += "<option value="+dlist.deptcode+">"+dlist.deptname+"</option>";
            	}
//             	 options += "<option value="+dlist.deptcode+">"+dlist.deptname+"</option>";
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
              url : './Emp_Search/Team.jsp',
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
</head>
<body style="background-color: #EFEFEF">
	<center>
<form action="MemberUpdate.admin" method="post">
<input type="hidden" name="empno" value="<%=member.getEmpno()%>">
	<table height="400px" width="500px">
		<tr>
			<td colspan="2" style="border-bottom: 2px solid #0469AF"><h4>${member.ename}님의 사원정보</h4></td>
		</tr>
		<tr>
			<td>
				<table height="300px" width="200px">
					<tr height="220px">
						<td align="center"><img src="http://192.168.7.241:8090/PROJECT/Upload/${member.p_picture}" width="200px" height="200px"></td>
					</tr>
					<tr>
						<td align="center" style="background-image: url('img/배경2.png');">" ${member.p_content} "</td>
					</tr>
				</table>
			</td>
			<td>
				<table height="300px" width="300px" id="emp">
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>사원번호</td>
						<td>${member.empno}</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>이름</td>
						<td>${member.ename}</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>생년월일</td>
						<td>${member.birth}</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>성별</td>
						<td>${member.sex}</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>핸드폰</td>
						<td>${member.celphone}</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>이메일</td>
						<td>${member.email}</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>소속부서</td>
						<td>
							<select id="deptlist" name="deptcode">
							</select>
							<%-- ${member.deptname} --%>
						</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>소속팀</td>
						<td>
							<select id="teamlist" name="teamcode">
							</select>
							<%-- ${member.teamname} --%>
						</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>직급</td>
						<td>
							<select id="gradelist" name="grade">
								<option value="1">대표이사</option>
								<option value="2">부장</option>
								<option value="3">팀장</option>
								<option value="4" selected>사원</option>
							</select>
							<%-- ${member.gradename} --%>
						</td>
					</tr>
					<tr>
						<td>사내전화번호</td>
						<td><input type="text" name="emptel" id="emptel" value="${member.emptel}"><%-- ${member.emptel} --%></td>
					</tr>
				</table>

			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="submit" class="btn btn-primary" value="수정하기">&nbsp;
			<input type="button" class="btn btn-default" value="취소" onclick="window.close()"></td>
		</tr>
	</table>
	</form>
</center>
</body>
</html>
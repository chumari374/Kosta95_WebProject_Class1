<%@page import="java.util.List"%>
<%@page import="DTO.MemberInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	List MemberList = (List)request.getAttribute("MemberList");
%>
<!-- 사원검색 페이지 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
	<style type="text/css">
		body {font-size: 82.5%;}
		table, tr, td{
			border: 1px solid gray;
			border-collapse: collapse;
			padding: 5px;
			padding-left: 10px; 
			padding-right: 10px;
		}
	</style>
	<script type="text/javascript">
		$(function(){
			/* $('ul').menu(); */

/* 			 $.ajax({
	              url : './Emp_Search/Team.jsp',
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
	          }); */
	          
	          $.ajax({
	              url : './Emp_Search/Dept.jsp',
	              dataType : "json",
	              success : function(data){
	            	  var options="";
	            	  		 options += "<option value=''>부서선택</option>";
	                  $.each(data, function(index,dlist){
	                         options += "<option value="+dlist.deptcode+">"+dlist.deptname+"</option>";
	                  });
	                  $('#deptlist').append(options);
	              },
	             error: function (xhr,Options,thrownError) {
	             }
	          });
	          
 			 $('#teamlist').on("change",function(){
					$('#emplist').empty();
					$.ajax({
						url : "./Emp_Search/Search.jsp",
						data:{deptcode:$('#deptlist').val(),
							teamcode:$('#teamlist').val()},
						dataType : "json",
						success : function(data){
							$('#emplist').append(
									"<tr>"
								+	"<td>부서</td>"
								+	"<td>팀</td>"
								+	"<td>이름</td>"
								+	"<td>직급</td>"
								+	"<td>사내전화번호</td>"
								+	"<td>핸드폰</td>"
								+	"</tr>"		
							);
							$.each(data,function(index,entry){
								$('#emplist').append(
									"<tr><td>" + entry.deptname + 
									"</td><td>" + entry.teamname + 
									"</td><td>" + entry.ename + 
									"</td><td>" + entry.gradename + 
									"</td><td>" + entry.emptel + 
									"</td><td>" + entry.celphone  + "<a href='Member.info?empno="+entry.empno+"'>클릭</a>"
									+ "</td></tr>"		
								);
							});
						},
						error:function(data){alert("Error 발생");}
					});
			}); 
			
	          $('#deptlist').on("change",function(){
	        	  	$('#teamlist').empty();
	        	  	 $.ajax({
	   	              url : './Emp_Search/Team.jsp',
	   	              data:{deptcode:$('#deptlist').val()},
	   	              dataType : "json",
	   	              success : function(data){
	   	            	  var options="";
	   	            		options += "<option value=''>팀선택</option>";
	   	                  $.each(data, function(index,tlist){
	   	                         options += "<option value="+tlist.teamcode+">"+tlist.teamname+"</option>";
	   	                  });
	   	                  $('#teamlist').append(options);
	   	              },
	   	             error: function (xhr,Options,thrownError) {
	   	             }
	        	  	});
	        	  	 
					$('#emplist').empty();
					$.ajax({
						url : "./Emp_Search/Search.jsp",
						data:{deptcode:$('#deptlist').val(), 
							teamcode:$('#teamlist').val()},
						dataType : "json",
						success : function(data){
							$('#emplist').append(
									"<tr>"
								+	"<td>부서</td>"
								+	"<td>팀</td>"
								+	"<td>이름</td>"
								+	"<td>직급</td>"
								+	"<td>사내전화번호</td>"
								+	"<td>핸드폰</td>"
								+	"</tr>"		
							);
							$.each(data,function(index,entry){
								$('#emplist').append(
									"<tr><td>" + entry.deptname + 
									"</td><td>" + entry.teamname + 
									"</td><td>" + entry.ename + 
									"</td><td>" + entry.gradename + 
									"</td><td>" + entry.emptel + 
									"</td><td>" + entry.celphone  + "<a href='Member.info?empno="+entry.empno+"'>클릭</a>"
									+ "</td></tr>"		
								);
							});
						},
						error:function(data){alert("Error 발생");}
					});
			}); 
	          
	          /* $('#btn').on("click",function(){
	        	  window.open('Member.info?empno="+entry.empno+"', 'Empinfo', 'width=400 height=200')'
	          }); */
	          
	          /* $('#btn').on("click", function(){
	        	    alert("The paragraph was clicked.");
	        	}); */
		});
	</script>
</head>
<body>
<jsp:include page="../Main.jsp"></jsp:include>
   <div id="main" align="center">
	<table width="60%">
		<tr>
		<td>
			중분류 :
		</td>
			<td>
				<!-- <ul>
					<li>선택
						<ul>
							<li onclick="dept(110)">개발부
								<ul>
									<li>솔루션개발팀</li>
									<li>외주팀</li>
								</ul>
							</li>
							<li>영업부
								<ul>
									<li>기술경영팀</li>
									<li>A/S팀</li>
								</ul>
							</li>
							<li>총무부
								<ul>
									<li>인사팀</li>
									<li>경리팀</li>
									<li>경영팀</li>
								</ul>
							</li>
						</ul>
					</li>
				</ul> -->
				<!-- <select id="teamlist"> -->
				<select id="deptlist"></select>
			</td>
			<td>
				소분류 :
			</td>
			<td>
				<select id="teamlist"></select>
			</td>
			<td colspan="5">
				<input type="text" placeholder="이름으로 검색">&nbsp;<input type="button" value="검색" id="btn">
			</td>
		</tr>
		</table>
		<table width="60%" id="emplist">
		<!-- <tr>
			<td>부서</td>
			<td>팀</td>
			<td>이름</td>
			<td>직급</td>
			<td>사내전화번호</td>
			<td>핸드폰</td>
		</tr> -->
		<%-- <% 	
				for(int i=0;i<MemberList.size();i++){
					MemberInfoDTO MID = (MemberInfoDTO)MemberList.get(i);
		%>
				<tr>
					<td><%= MID.getDeptname() %></td>
					<td><%= MID.getTeamname() %></td>
					<td><%= MID.getEname() %></td>
					<td><%= MID.getGradename() %></td>
					<td><%= MID.getEmptel() %></td>
					<td><%= MID.getCelphone()%></td>
				</tr>
		<%
			} 
		%> --%>
	</table>
	</div>
	<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
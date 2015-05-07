<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui.min.js"></script>
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
			
				// 처음에 부서목록 출력해주기
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
	          	// 처음에 페이지 들어왔을때 전체사원의 목록이 나오게
	          $.ajax({
	        	  url : './Emp_Search/Ename.jsp',
	        	  dataType : "json",
	        	  data : {ename:$('#Ename').val()},
	        	  success : function(data){
	        		  $('#emplist').append(
								"<tr>"
							+	"<th>부서</th>"
							+	"<th>팀</th>"
							+	"<th>이름</th>"
							+	"<th>직급</th>"
							+	"<th>사내전화번호</th>"
							+	"<th>핸드폰</th>"
							+	"<th></th>"
							+	"</tr>"		
						);
						$.each(data,function(index,entry){
							$('#emplist').append(
								"<tr><td>" + entry.deptname + 
								"</td><td>" + entry.teamname + 
								"</td><td>" + entry.ename + 
								"</td><td>" + entry.gradename + 
								"</td><td>" + entry.emptel + 
								"</td><td>" + entry.celphone  + 
								"</td><td><button onclick='deleteAdmin("+entry.empno+")' class='btn btn-back btn-xs'>퇴사처리</button>"
								+ "</td></tr>"		
							);
						});
	        	  },
	        	  error: function (xhr,Options,thrownError) {
		          }
	          });
	          	// 팀을 선택하면 사원들 목록 출력
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
								+	"<th>부서</th>"
								+	"<th>팀</th>"
								+	"<th>이름</th>"
								+	"<th>직급</th>"
								+	"<th>사내전화번호</th>"
								+	"<th>핸드폰</th>"
								+	"<th></th>"
								+	"</tr>"			
							);
							$.each(data,function(index,entry){
								$('#emplist').append(
									"<tr><td>" + entry.deptname + 
									"</td><td>" + entry.teamname + 
									"</td><td>" + entry.ename + 
									"</td><td>" + entry.gradename + 
									"</td><td>" + entry.emptel + 
									"</td><td>" + entry.celphone  + 
									"</td><td><button onclick='deleteAdmin("+entry.empno+")' class='btn btn-back btn-xs'>퇴사처리</button>"
									+ "</td></tr>"		
								);
							});
						},
						error:function(data){alert("Error 발생");}
					});
			}); 
				// 부서가 바뀌면 
	          $('#deptlist').on("change",function(){
	        	  	// 팀 목록 출력
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
	        	  	// 사원 목록 출력
					$('#emplist').empty();
					$.ajax({
						url : "./Emp_Search/Search.jsp",
						data:{deptcode:$('#deptlist').val(), 
							teamcode:$('#teamlist').val()},
						dataType : "json",
						success : function(data){
							$('#emplist').append(
									"<tr>"
								+	"<th>부서</th>"
								+	"<th>팀</th>"
								+	"<th>이름</th>"
								+	"<th>직급</th>"
								+	"<th>사내전화번호</th>"
								+	"<th>핸드폰</th>"
								+	"<th></th>"
								+	"</tr>"			
							);
							$.each(data,function(index,entry){
								$('#emplist').append(
									"<tr><td>" + entry.deptname + 
									"</td><td>" + entry.teamname + 
									"</td><td>" + entry.ename + 
									"</td><td>" + entry.gradename + 
									"</td><td>" + entry.emptel + 
									"</td><td>" + entry.celphone  + 
									"</td><td><button onclick='deleteAdmin("+entry.empno+")' class='btn btn-back btn-xs'>퇴사처리</button>"
									+ "</td></tr>"		
								);
							});
						},
						error:function(data){alert("Error 발생");}
					});
			}); 
	          
	        // 버튼이 눌리면 사원목록 출력  
	 		$('#btn').on("click",function(){
						$('#emplist').empty();
						$.ajax({
							url : "./Emp_Search/Ename.jsp",
							data:{ename:$('#Ename').val()},
							dataType : "json",
							success : function(data){
								$('#emplist').append(
										"<tr>"
									+	"<th>부서</th>"
									+	"<th>팀</th>"
									+	"<th>이름</th>"
									+	"<th>직급</th>"
									+	"<th>사내전화번호</th>"
									+	"<th>핸드폰</th>"
									+	"<th></th>"
									+	"</tr>"		
								);
								$.each(data,function(index,entry){
									$('#emplist').append(
										"<tr><td>" + entry.deptname + 
										"</td><td>" + entry.teamname + 
										"</td><td>" + entry.ename + 
										"</td><td>" + entry.gradename + 
										"</td><td>" + entry.emptel + 
										"</td><td>" + entry.celphone  + 
										"</td><td><button onclick='deleteAdmin("+entry.empno+")' class='btn btn-back btn-xs'>퇴사처리</button>"
										+ "</td></tr>"		
									);
								});
							},
							error:function(data){alert("Error 발생");}
						});
				}); 

		});
	</script>
</head>
<body>
<jsp:include page="../Main.jsp"></jsp:include>
   <div id="main" align="center">
   <div id="wrapper" style="width: 90%;">
   		<div align="left" style="height: 50px;"><h3>퇴사처리</h3></div>
		<div align="center" style="margin-bottom: 0px;">
			<div style=" float: left;"><select id="deptlist" class="form-control" style="width:150px; margin-left: 30px; margin-right: 20px; margin-bottom: 10px;"></select></div>
			<div style=" float: left;"><select id="teamlist" class="form-control" style="width:250px; margin-right: 150px;">
				<option>부서를 선택하세요</option>
			</select>
			</div>
			<div style=" float: left;"><input type="text" class="form-control" style="width:200px; margin-right: 10px;" placeholder="이름으로 검색" id="Ename"></div>
			<div style=" float: left;"><input type="button" value="검색" id="btn" class="btn btn-primary btn-md"></div>
			</div>
			<div style="width:90%; height: 500px; overflow: scroll; float: none;">
			<table id="emplist" class="table">
			</table>
			</div>
	</div>
	</div>
<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
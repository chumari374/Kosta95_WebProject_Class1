<%@page import="DTO.MemberInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!-- (��������)����������� ������ -->
<!-- �ڽ��� �����Ҽ��ִ� ������ input text�� �ְ�, �����Ҽ����� ������ �����ֱ⸸ -->
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
	$.ajax({
        url : './Emp_Search/Dept.jsp',
        dataType : "json",
        success : function(data){
      	  var options="";
            $.each(data, function(index,dlist){
            	if(dlist.deptname==member.deptname){
            	   options += "<option value="+dlist.deptcode+">"+dlist.deptname+"</option>";
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
	
	 $('#deptlist').on("change",function(){
 	  	// �� ��� ���
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
	<table height="400px" width="500px">
		<tr>
			<td colspan="2" style="border-bottom: 2px solid #0469AF"><h4>${member.ename}���� �������</h4></td>
		</tr>
		<tr>
			<td>
				<table height="300px" width="200px">
					<tr height="220px">
						<td align="center"><img src="http://192.168.7.235:8090/PROJECT/Upload/${member.p_picture}" width="200px" height="200px"></td>
					</tr>
					<tr>
						<td align="center" style="background-image: url('img/���2.png');">" ${member.p_content} "</td>
					</tr>
				</table>
			</td>
			<td>
				<table height="300px" width="300px" id="emp">
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>�����ȣ</td>
						<td>${member.empno}</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>�̸�</td>
						<td>${member.ename}</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>�������</td>
						<td>${member.birth}</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>����</td>
						<td>${member.sex}</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>�ڵ���</td>
						<td>${member.celphone}</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>�̸���</td>
						<td>${member.email}</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>�ҼӺμ�</td>
						<td>
							<select id="deptlist">
							</select>
							<%-- ${member.deptname} --%>
						</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>�Ҽ���</td>
						<td>
							<select id="teamlist">
							</select>
							<%-- ${member.teamname} --%>
						</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>����</td>
						<td>
							<select id="gradelist">
								<option value="1">��ǥ�̻�</option>
								<option value="2">����</option>
								<option value="3">����</option>
								<option value="4" selected>���</option>
							</select>
							<%-- ${member.gradename} --%>
						</td>
					</tr>
					<tr>
						<td>�系��ȭ��ȣ</td>
						<td><input type="text" value="${member.emptel}"><%-- ${member.emptel} --%></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" class="btn btn-primary" value="�����ϱ�" onclick="editAdmin(${member.empno})">&nbsp;
			<input type="button" class="btn btn-default" value="���" onclick="window.close()"></td>
		</tr>
	</table>
</center>
</body>
</html>
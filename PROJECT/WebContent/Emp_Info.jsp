<%@page import="DTO.EmpDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- �Խ����̳� ����˻����� '���������������'�� �������� ������ ȭ�� -->
<!-- 
select e.empno, e.ename, a.celphone, a.email, d.deptname, e.teamname, g.gradename, ds.emptel, a.p_picture, a.p_content
from emp e
join domain_set ds
on e.empno = ds.empno
join accounts a
on e.empno = a.empno
join dept d
on e.deptcode = d.deptcode
join grade g
on e.grade = g.grade
where e.empno = ?; // �����ȣ
 -->
<% 

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">



table {
   border: 2px solid grey;
   border-radius: 5px;
   margin: 10px;
}

		
    th {
    
    background-color: #D5D5D5;
    
    }

	tr, td {
		border-bottom: 1px solid grey;
 		border-collapse: collapse;
 		background-color: #F6F6F6;
 
 		
 		
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

	<table width="500px" height="300px">
		<tr>
			<th colspan="3" align="center">���� �������</th>
		</tr>
		<tr>
			<td rowspan="5">�����ʻ���</td>
			<td>�����ȣ</td>
			<td></td>
		</tr>
		<tr>
			<td>�̸�</td>
			<td></td>
		</tr>
		<tr>
			<td>�ڵ���</td>
			<td></td>
		</tr>
		<tr>
			<td>�̸���</td>
			<td></td>
		</tr>
		<tr>
			<td>�ҼӺμ�</td>
			<td></td>
		</tr>
		<tr>
			<td rowspan="3">�����ʸ޼���</td>
			<td>�Ҽ���</td>
			<td></td>
		</tr>
		<tr>
			<td>����</td>
			<td></td>
		</tr>
		<tr>
			<td>�系��ȭ��ȣ</td>
			<td></td>
		</tr>
		<tr>
			<td colspan="3" align="center"><input type="button" value="�ݱ�"></td>
		</tr>
	</table>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!-- �μ��Խ��� ������ -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
		<div class="col-md-9">
    	 <table class="table table-list-search">
                    <thead>
                      
                         <tr>
			<td colspan="5" align="right">
				<select>
					<option>����</option>
					<option>����</option>
					<option>�ۼ���</option>
				</select>
				&nbsp;
				<input type="text">
				&nbsp;
				<input type="button" value="�˻�">
			</td>
		</tr>
                    </thead>
                    <tbody>
                      <tr>
                           <td>�۹�ȣ</td>
                           <td>����</td>
                           <td>�ۼ���</td>
                           <td>�ۼ���</td>
                           <td>��ȸ��</td>
                        </tr>
                       
		<!-- �������� ���� -->
		<!-- WebJSP7_BasicBoard > board_list.jsp ���� -->
		<tr>
				<td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
		</tr>
		<tr>
				<td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
		</tr>
		<tr>
				<td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
		</tr>
		<tr>
			<td colspan="4" align="center"> &lt; 1 2 3 4 5 6 7 8 9 10 &gt; </td>
			<td align="center"><input type="button" value="�۾���" onclick="location.href='<%=request.getContextPath()%>/CompBoardWrite.cp'"></td>
		</tr>
                    </tbody>
	
	</table>
	</div>
	</div>
	</div>
</body>
</html>
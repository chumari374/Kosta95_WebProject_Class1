<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<style>
		#message_list_table {border:1px solid black;border-collapse: collapse}
		#message_list_table th {border:1px solid black; text-align:center;}
	</style>
</head>

<body>
<h3>����������</h3>
<table id="message_list_table" width="60%" height="50%">
			<tr>
				<th width="15%">������ȣ</th>
				<th width="15%">�޴»��</th>
				<th width="15%">�ۼ���</th>
				<th>����</th>
			</tr>
<%-- 	<%
		for(int i=0;i<messageList.size();i++){
			MessageDTO ml=(MessageDTO)messageList.get(i);
	%> --%>
	<tr>
		<td>
			<%-- <%=ml.getMsgnum()%> --%>
		</td>
		<td>
			<%-- <%=ml.getSendempno() %> --%>
		</td>
		<td>
		 <%--   <%=ml.getEmpno() %> --%>
		</td>
		<td>
			<%-- <a href="MessageDetailAction.mb?msgnum=<%=ml.getMsgnum()%>">
				<%=ml.getTitle()%>
			</a> --%>
		</td>
	</tr>
<%-- 	<%} %> --%>
		</table>
</body>
</html>
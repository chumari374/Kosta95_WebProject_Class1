<%@page import="DTO.MemberInfoDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List MemberList = (List)request.getAttribute("MemberList");
%>
	<table>
<% 	
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
%>
	</table>
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
		body {font-size: 62.5%;}
		table, tr, td{
			border: 1px solid gray;
			border-collapse: collapse;
			padding: 5px;
			padding-left: 10px; 
			padding-right: 10px;
		}
		.ui-menu { width: 90px; }
	</style>
	<script type="text/javascript">
		$(function(){
			$('ul').menu();
		});
	</script>
</head>
<body>
	<table width="60%">
		<tr>
			<td colspan="1" align="center" width="60">
				<ul>
					<li>선택
						<ul>
							<li>개발부
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
				</ul>
			</td>
			<td colspan="5">
				<input type="text" placeholder="이름으로 검색">&nbsp;<input type="button" value="검색">
			</td>
		</tr>
		<!-- 동적으로 구성 -->
		<tr>
			<td>부서</td>
			<td>팀</td>
			<td>이름</td>
			<td>직급</td>
			<td>사내전화번호</td>
			<td>핸드폰</td>
		</tr>
			
	<%
		for(int i=0;i<MemberList.size();i++){
			MemberInfoDTO MID = (MemberInfoDTO)MemberList.get(i);
	%>
		
		<tr>
			<td><%= MID.getDeptname() %></td>
			<td><%= MID.getTeamname() %></td>
			<td><%= MID.getEname() %></td>
			<td><%= MID.getGradename() %></td>
			<td><%= MID.getTeamname() %></td>
			<td><%= MID.getCelphone()%><input type="button" value="쪽지"></td>
		</tr>
	<%} %>
	</table>
</body>
</html>
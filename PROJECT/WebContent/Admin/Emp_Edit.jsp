<%@page import="DTO.MemberInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
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
</head>
<body style="background-color: #EFEFEF">
	<center>
<%-- 	<table width="500px" height="300px">
		<tr>
			<th colspan="3" align="center">${member.ename}님의 사원정보</th>
		</tr>
		<tr>
			<td rowspan="6" align="center"><img src="http://192.168.7.235:8090/PROJECT/Upload/${member.p_picture}" width="80px" height="80px"><br>프로필사진</td>
			<td>사원번호</td>
			<td>${member.empno}</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>${member.ename}</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${member.birth}</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>${member.sex}</td>
		</tr>
		<tr>
			<td>핸드폰</td>
			<td>${member.celphone}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${member.email}</td>
		</tr>
		<tr>
			<td rowspan="4" align="center">" ${member.p_content} "<!-- 프로필메세지 --></td>
			<td>소속부서</td>
			<td>${member.deptname}</td>
		</tr>
		<tr>
			<td>소속팀</td>
			<td>${member.teamname}</td>
		</tr>
		<tr>
			<td>직급</td>
			<td>${member.gradename}</td>
		</tr>
			<tr>
			<td>사내전화번호</td>
			<td>${member.emptel}</td>
		</tr>
		<tr>
			<td colspan="3" align="center"><input type="button" value="닫기" onclick="window.close()"></td>
		</tr>
	</table> --%>
	<table height="400px" width="500px">
		<tr>
			<td colspan="2" style="border-bottom: 2px solid #0469AF"><h4>${member.ename}님의 사원정보</h4></td>
		</tr>
		<tr>
			<td>
				<table height="300px" width="200px">
					<tr height="220px">
						<td align="center"><img src="http://192.168.7.235:8090/PROJECT/Upload/${member.p_picture}" width="200px" height="200px"></td>
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
							<select>
								<option value="200">개발부</option>
								<option value="300">총무부</option>
								<option value="400">영업부</option>
							</select>
							<%-- ${member.deptname} --%>
						</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>소속팀</td>
						<td>${member.teamname}</td>
					</tr>
					<tr style="border-bottom: 1px solid #A2A2A2">
						<td>직급</td>
						<td>${member.gradename}</td>
					</tr>
					<tr>
						<td>사내전화번호</td>
						<td>${member.emptel}</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" class="btn btn-primary" value="수정하기" onclick="editAdmin(${member.empno})">&nbsp;
			<input type="button" class="btn btn-default" value="닫기" onclick="window.close()"></td>
		</tr>
	</table>
</center>
</body>
</html>
<%@page import="DAO.SignDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="DTO.SignDTO"%>
<%
	List getSignList = (List) request.getAttribute("getsignlist");
	int listcount = (Integer) request.getAttribute("getsignlistcount");
	int nowpage = (Integer) request.getAttribute("page");
	int maxpage = (Integer) request.getAttribute("maxpage");
	int startpage = (Integer) request.getAttribute("startpage");
	int endpage = (Integer) request.getAttribute("endpage");

	System.out.println(listcount + "/ " + nowpage + " / " + maxpage
			+ " / ");
	System.out.println(startpage + " / " + endpage);

	SignDAO signdao = new SignDAO();

	int ing = (nowpage / 5) + 1; // 계층을 계산함 1~5 1단계 6~10 2단계 ...
	int level = ing;// 위와 같은 의미로 쓰임
	int end = level * 5;//단계에 5를 곱하면 현재 페이지의 끝페이지 알수 있음

	if (nowpage % 5 == 0) {//그러나 5의 배수일 경우는 1단계 떨어뜨려줌  그렇지않으면 다음단계로 계산됌
		level = ing - 1;
		end = level * 5;
	}

	String status = request.getParameter("status");
	if (request.getParameter("status") == null) {
		status = "전체";
	}

	System.out.println("status : " + request.getParameter("status"));
%>

<html>
<head>
<script type="text/javascript">
	function goUrl(url){
		window.location.href = url;
	}
	function info(empno){
		window.open('Member.info?empno='+empno,'상세정보', 'width=600 height=424')
	}
</script>
<style type="text/css">
/* //페이징 부분*/
/* 숫자 페이지 부분 */
input.page {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	padding: 4px 10px;
	background-color: #F6F6F6;
	-moz-border-radius: 30px;
	-webkit-border-radius: 30px;
	border-radius: 0px;
	border: 1px solid #3196dc;
}
/* 현재 페이지 */
input.pageC {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	padding: 4px 10px;
	background-color: #B2EBF4;
	-moz-border-radius: 30px;
	-webkit-border-radius: 30px;
	border-radius: 0px;
	border: 1px solid #3196dc;
}
/* [이전] 페이지 */
input.pageP {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	padding: 4px 10px;
	background-color: #F6F6F6;
	-moz-border-radius: 30px;
	-webkit-border-radius: 30px;
	border-bottom-left-radius: 10px;
	border-top-left-radius: 10px;
	border-top-right-radius: 0px;
	border-bottom-right-radius: 0px;
	border: 1px solid #3196dc;
}
/* [다음] 페이지 */
input.pageN {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	padding: 4px 10px;
	background-color: #F6F6F6;
	-moz-border-radius: 30px;
	-webkit-border-radius: 30px;
	border-bottom-left-radius: 0px;
	border-top-left-radius: 0px;
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
	border: 1px solid #3196dc;
}
</style>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../../js/myscript.js"></script>
<title>받은 결재함</title>
</head>

<body>
	<jsp:include page="../Main.jsp"></jsp:include>
	<div id="main" align="center">
		<!-- 게시판 리스트 -->

		<table class="table" style="width: 80%; margin-top: 50px;">
			<%
				if (listcount > 0) {
			%>
			<tr align="center" valign="middle">
				<td colspan="5">받은 결재함</td>
				<td align=right><select
					onchange="goUrl(this.options[this.selectedIndex].value)">
						<option value="getSignList.hong">선택</option>
						<option value="getSignList.hong?status=전체">전체</option>
						<option value="getSignList.hong?status=상부 보고중">상부 보고중</option>
						<option value="getSignList.hong?status=대기">대기</option>
						<option value="getSignList.hong?status=승인">승인</option>
						<option value="getSignList.hong?status=취소">취소</option>
				</select></td>
			</tr>

			<tr align="center" valign="middle" bordercolor="#333333">
				<td style="font-family: Tahoma; font-size: 10pt;" width="10%"
					height="26">
					<div align="center"><b>결재 번호</b></div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;" width="37%">
					<div align="center"><b>제목</b></div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;" width="14%">
					<div align="center"><b>기안자</b></div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;" width="17%">
					<div align="center"><b>송부자</b></div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;" width="11%">
					<div align="center"><b>날짜</b></div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;" width="11%">
					<div align="center"><b>상태</b></div>
				</td>
			</tr>

			<%
				for (int i = 0; i < getSignList.size(); i++) {
						SignDTO signdto = (SignDTO) getSignList.get(i);
			%>
			<tr align="center" valign="middle" bordercolor="#333333"
				onmouseover="this.style.backgroundColor='F8F8F8'"
				onmouseout="this.style.backgroundColor=''">
				<td height="23" style="font-family: Tahoma; font-size: 10pt;">
					<%=signdto.getSignnum()%>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;"><a
					href="DetailGetSignList.hong?num=<%=signdto.getSignnum()%>">
						<div align="center"><%=signdto.getTitle()%></div>
				</a></td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<a href="#"><div align="center" onclick="info(<%=signdto.getStarter()%>)"><%=signdao.getEmpname(signdto.getStarter())%></div></a>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<a href="#"><div align="center" onclick="info(<%=signdto.getEmpno()%>)"><%=signdao.getEmpname(signdto.getEmpno())%></div></a>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center"><%=signdto.getWrite_date()%></div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center"><%=signdto.getStatus()%></div>
				</td>
			</tr>
			<%
				}
			%>
			<tr align=center height=20>
				<td colspan=7 style="font-family: Tahoma; font-size: 10pt;">
					<%
						if (level <= 1) {
					%> <input type="button" value="이전" class="pageP"><%
 	} else {
 %>
					<a href="getSignList.hong?status=<%=status%>&page=<%=level * 5 - 5%>"><input
						type="button" value="이전 " class="pageP"></a> <%
 	}
 %> <%
 	for (int i = level * 5 - 4; i <= end; i++) {
 			if (i == nowpage) {
 %> <input type="button" value="<%=i%>"
					style="background-color: #B2EBF4" class="pageC"> <%
 	} else {
 				if (i <= maxpage) {
 %> <a href="getSignList.hong?status=<%=status%>&page=<%=i%>"><input
						type="button" value="<%=i%>" class="page"></a> <%
 	} 
 			}
 %> <%
 	}
 %> <%
 	if (level >= (maxpage / 5) + 1) {
 %> <input type="button" value="다음" class="pageN">
					<%
						} else {
					%> <a
					href="getSignList.hong?status=<%=status%>&page=<%=level * 5 + 1%>"><input
						type="button" value="다음" class="pageN"></a> <%
 	}
 %>
				</td>
			</tr>
			<%
				} else {
			%>
			<tr align="center" valign="middle">
				<td colspan="4">받은 결재함</td>
				<td align=right><font size=2><select
						onchange="goUrl(this.options[this.selectedIndex].value)">
							<option value="getSignList.hong">선택</option>
							<option value="getSignList.hong?status=전체">전체</option>
							<option value="getSignList.hong?status=상부 보고중">상부 보고중</option>
							<option value="getSignList.hong?status=대기">대기</option>
							<option value="getSignList.hong?status=승인">승인</option>
							<option value="getSignList.hong?status=취소">취소</option>
					</select></font></td>
			</tr>
			<tr>
				<td colspan="5" align="center">결제가 없습니다</td>
			</tr>
			<%
				}
			%>

		</table>
	</div>
	<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int ceo = (Integer)(session.getAttribute("grade"));
	String ad = (String)session.getAttribute("admin");
	String empno = (String.valueOf(session.getAttribute("empno"))); 
	String ename = (String)session.getAttribute("ename");
	String teamcode = (String.valueOf(session.getAttribute("teamcode")));
	String teamname = (String)session.getAttribute("teamname");
	String deptcode = (String.valueOf(session.getAttribute("deptcode")));
	String grade = (String.valueOf(session.getAttribute("grade")));
	String admin = (String.valueOf(session.getAttribute("admin")));
	
	String gradeName = "";
	String adminCheck = "";
	/* 직급, 관리자 */
	if (grade.equals("1")){
		gradeName = "대표이사";
	} else if (grade.equals("2")) {
		gradeName = "부장";
	} else if (grade.equals("3")) {
		gradeName = "팀장";
	} else if (grade.equals("4")) {
		gradeName = "사원";
	}

	if (admin.equals("true") ) {
		adminCheck = ", 관리자";
	} else if (admin.equals("true")){
		adminCheck = "";
	}
	
	System.out.println(grade + " " + admin);
	System.out.println(gradeName + " " + adminCheck);
%>
<!-- 메인페이지 -->
<!DOCTYPE HTML>
<HTML>
<HEAD>
<meta charset="UTF-8">
<TITLE>index</TITLE>
<script type="text/javascript" src="chatting/js/async.js"></script>
<link type="text/css" rel="stylesheet" href="css/mystyle.css">
<script type="text/javascript" src="js/myscript.js"></script>
<style type="text/css">
input.css3button {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #383838;
	padding: 4px 10px;
	background: -moz-linear-gradient(top, #f7f7f7 0%, #ebebeb 50%, #dbdbdb 50%, #dbdbdb);
	background: -webkit-gradient(linear, left top, left bottom, from(#f7f7f7),
		color-stop(0.50, #ebebeb), color-stop(0.50, #dbdbdb), to(#dbdbdb));
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	border-radius: 5px;
	border: 1px solid #c7c7c7;
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
<script type="text/javascript">
	getip2();
</script>
</HEAD>

<BODY>
	<header>
		${sessionScope.empno}, ${sessionScope.ename}, ${sessionScope.teamname}, <%=gradeName %><%=adminCheck %>
	</header>

	<nav>&nbsp;</nav>

	<aside id="left">

		<h4 onclick="javascript:location.href='SubMain.jsp'">
			<b>KOSTA INTRANET </b>
		</h4>
		<div id="leftdiv1">
			<br>
			<p></p>
			<p>
				<img
					src="http://192.168.7.241:8090/PROJECT/Upload/${sessionScope.p_picture}"
					width="80px" height="80px">
			</p>
			<p>${sessionScope.ename }님 로그인하셨습니다.</p>
			<p>
				<input type="button" class="css3button" value="로그아웃"
					onclick="logout('<%=request.getContextPath()%>')">
			</p>

		</div>

		<div id="leftdiv2">

			<ul>
				<li><span class="glyphicon glyphicon-folder-close"
					aria-hidden="true"></span>&nbsp;사내
					<ul class="submenu">
						<li><a href="CompNoticeList.cn">공지사항</a></li>
						<li><a href="CompDataBoardList.cf">자료실</a></li>
						<li><a href="CompBoardList.cp">게시판</a></li>
					</ul></li>


				<li><span class="glyphicon glyphicon-folder-close"
					aria-hidden="true"></span>&nbsp;부서
					<ul class="submenu">
						<li><a href="DeptBoardList.dp">부서 게시판</a></li>
						<li><a href="#"
							onclick="chatting_window('${sessionScope.ename}')">팀 게시판</a></li>
						<li><a href="#" onclick="alert('WARNING!!! YOUR COMPUTER IS HACKED BY ANNONYMOUSE SHUT DOWN SYSTEM RIGHT NOW.')">자료실(공사중)</a></li>
					</ul></li>

				<li><span class="glyphicon glyphicon-file" aria-hidden="true"></span>&nbsp;결재
					<ul class="submenu">
						<!--                  <li><a href="#">결재 현황</a></li>           -->

						<%
							if(ceo != 1){
						%>
						<li><a href="SignWrite.hong">결재 기안</a></li>
						<li><a href="sendSignList.hong">보낸 결재</a></li>
						<%
							}
						%>


						<li><a href="getSignList.hong">받은 결재</a></li>
						<!--                  <li><a href="#">완료 결재함</a></li>     -->
					</ul></li>

				<li><a href="MemberList.info"><span
						class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;사원검색</a>
				</li>

				<li><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;마이페이지
					<ul class="submenu">
						<li><a href="Account_Edit.mp">개인정보 수정</a></li>
						<li><a href="Recieved.mb">받은메세지함</a></li>
						<li><a href="Sent.mb">보낸메세지함</a></li>
						<li><a href="SchedulePage.mp">일정관리</a></li>
					</ul></li>

				<%
					if(ad.equals("true")){
				%>
				<li><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>&nbsp;
					관리자페이지
					<ul class="submenu">
						<li><a href="MemberAdd.admin">신입사원 추가</a></li>
						<li><a href="MemberList.admin">사원정보 수정</a></li>
						<li><a href="MemberDelete.admin">퇴사처리</a></li>
					</ul></li>
				<%
					}
				%>
			</ul>

		</div>
	</aside>

	<input type="hidden" id="ip">
	<!--     <div id="main" align="center" > -->
	<!--     사내 공지사항 -->
	<!-- <!-- <div id="div1">사내 공지사항</div> -->
	<!--     <div id="div2">...div2</div> -->
	<!--     <div id="div3">...div3</div> -->
	<!--     <div id="div4">...div4</div> -->
	<!--     </div> -->

	<!--     <footer>Copyright (c) 2015 KOSTA</footer> -->
</HTML>

<%@page import="DAO.SignDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="DTO.SignDTO"%>
<%
	SignDAO signdao = new SignDAO();
	List sendSignList = (List) request.getAttribute("sendsignlist");
	int listcount = (Integer) request.getAttribute("sendsignlistcount");
	int nowpage = (Integer) request.getAttribute("page");
	int maxpage = (Integer) request.getAttribute("maxpage");
	int startpage = (Integer) request.getAttribute("startpage");
	int endpage = (Integer) request.getAttribute("endpage");
	
	int ing = (nowpage/5)+1; // 계층을 계산함 1~5 1단계 6~10 2단계 ...
	int level = ing;// 위와 같은 의미로 쓰임
 	int end = level*5;//단계에 5를 곱하면 현재 페이지의 끝페이지 알수 있음
	
	if(nowpage%5==0){//그러나 5의 배수일 경우는 1단계 떨어뜨려줌  그렇지않으면 다음단계로 계산됌
		level = ing-1;
		end = level*5;
	}

	System.out.println(listcount + "/ " + nowpage + " / " + maxpage
			+ " / ");
	System.out.println(startpage + " / " + endpage);

	String status = request.getParameter("status");
%>

<html>
<head>
<title>보낸 결재함</title>

<script language='javascript'>
	function noEvent() {
		if (event.keyCode == 116) {
			event.keyCode = 2;
			return false;
		} else if (event.ctrlKey
				&& (event.keyCode == 78 || event.keyCode == 82)) {
			return false;
		}
	}
	document.onkeydown = noEvent;

	function goUrl(url) {
		window.location.href = url;

	}
</script>

</head>

<body oncontextmenu="return false">
	<jsp:include page="../Main.jsp"></jsp:include>
	<div id="main" align="center">
		<!-- 게시판 리스트 -->

		<table width=50% border="0" cellpadding="0" cellspacing="0">
			<%
				if (listcount > 0) {
			%>
			<tr align="center" valign="middle">
				<td colspan="4">보낸 결재함</td>
				<td align=right><select
					onchange="goUrl(this.options[this.selectedIndex].value)">
						<option value="sendSignList.hong">선택</option>
						<option value="sendSignList.hong?status=전체">전체</option>
						<option value="sendSignList.hong?status=대기">대기</option>
						<option value="sendSignList.hong?status=승인">승인</option>
						<option value="sendSignList.hong?status=취소">취소</option>
				</select></td>
			</tr>

			<tr align="center" valign="middle" bordercolor="#333333">
				<td style="font-family: Tahoma; font-size: 8pt;" width="8%"
					height="26">
					<div align="center">결재 번호</div>
				</td>
				<td style="font-family: Tahoma; font-size: 8pt;" width="50%">
					<div align="center">제목</div>
				</td>
				<td style="font-family: Tahoma; font-size: 8pt;" width="14%">
					<div align="center">기안자</div>
				</td>
				<td style="font-family: Tahoma; font-size: 8pt;" width="17%">
					<div align="center">결재 / 검토자</div>
				</td>
				<td style="font-family: Tahoma; font-size: 8pt;" width="11%">
					<div align="center">날짜</div>
				</td>
				<td style="font-family: Tahoma; font-size: 8pt;" width="11%">
					<div align="center">상태</div>
				</td>
			</tr>

			<%
				for (int i = 0; i < sendSignList.size(); i++) {
						SignDTO signdto = (SignDTO) sendSignList.get(i);
			%>
			<tr align="center" valign="middle" bordercolor="#333333"
				onmouseover="this.style.backgroundColor='F8F8F8'"
				onmouseout="this.style.backgroundColor=''">
				<td height="23" style="font-family: Tahoma; font-size: 10pt;">
					<%=signdto.getSignnum()%>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;"><a
					href="DetailSendSignList.hong?num=<%=signdto.getSignnum()%>"><div
							align="center"><%=signdto.getTitle()%></div></a></td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center"><%=signdao.getEmpname(signdto.getStarter())%></div>
				</td>
				<td style="font-family: Tahoma; font-size: 10pt;">
					<div align="center"><%=signdao.getEmpname(signdto.getGetsign())%></div>
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
			<!-- 페이징처리 시작 -->
	<tr align=center height=20>
		<td colspan="4" style="font-family:Tahoma;font-size:10pt;">
			<%if(level<=1){ %>
			<input type="button" value="이전" >&nbsp;
			<%}else{ %>
			<a href ="sendSignList.hong?status=<%=status %>&page=<%=level*5-5 %>"><input type="button" value="이전 "></a>&nbsp;
			<%} %>
			
			<%for(int i=level*5-4;i<= end ;i++){
				if(i==nowpage){%>
				<input type="button" value="<%=i %>" style="background-color: #B2EBF4">&nbsp;
				<%}else{ 
					if(i<=maxpage){
				%>
					<a href="sendSignList.hong?status=<%=status %>&page=<%=i %>"><input type="button" value="<%=i %>"></a>&nbsp;
				<%
					}
				 }
				%>
			<%} %>
			
			<%if(level>=(maxpage/5)+1){ %>
			<input type="button" value="다음">
			<%}else{ %>
			<a href="sendSignList.hong?status=<%=status %>&page=<%=level*5+1 %>"><input type="button" value="다음"></a>
			<%} %>
		</td>
		<td align="right">
	   		<a href="SignWrite.hong"><input type="button" value="글쓰기"></a>
		</td>
	</tr>
	<!-- 페이징처리 끝 -->
			<%
				} else {
			%>
			<tr align="center" valign="middle">
				<td colspan="4">보낸 결재함</td>
				<td align=right><select
					onchange="goUrl(this.options[this.selectedIndex].value)">
						<option value="sendSignList.hong">선택</option>
						<option value="sendSignList.hong?status=전체">전체</option>
						<option value="sendSignList.hong?status=대기">대기</option>
						<option value="sendSignList.hong?status=승인">승인</option>
						<option value="sendSignList.hong?status=취소">취소</option>
				</select></td>
				<td align="center">보낸 결재가 없습니다</td>
			</tr>
			<%
				}
			%>

		</table>
	</div>
	<jsp:include page="../Footer.jsp"></jsp:include>
</body>
</html>
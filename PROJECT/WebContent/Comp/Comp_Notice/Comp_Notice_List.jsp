<%@page import="DTO.C_N_BrdDTO"%>
<%@page import="java.util.List"%>
<%@page import="DTO.C_BrdDTO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	List boardList=(List)request.getAttribute("boardlist");//현재페이지 보드리스트 
	int listcount=(Integer)request.getAttribute("listcount");//총 게시글 수
	int nowpage=(Integer)request.getAttribute("page");//현재 페이지
	int maxpage=(Integer)request.getAttribute("maxpage");//최대 페이지수
	int startpage=(Integer)request.getAttribute("startpage");// 
	int endpage=(Integer)request.getAttribute("endpage");//페이지에 띄울 게시글 start~end
	
	int ing = (nowpage/5)+1; // 계층을 계산함 1~5 1단계 6~10 2단계 ...
	int level = ing;// 위와 같은 의미로 쓰임
 	int end = level*5;//단계에 5를 곱하면 현재 페이지의 끝페이지 알수 있음
	
	if(nowpage%5==0){//그러나 5의 배수일 경우는 1단계 떨어뜨려줌  그렇지않으면 다음단계로 계산됌
		level = ing-1;
		end = level*5;
	}
	

%>
<!-- 사내게시판 페이지 -->
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
<script type="text/javascript" src="../../js/myscript.js"></script>
<style>
   #title {
      margin: 30px;
      margin-bottom: 10px;
   }
</style>
</head>
<body>
<jsp:include page="../../Main.jsp"></jsp:include>
   <div id="main" align="left">
<div id="title"><h3>사내 공지사항</h3></div>
<div class="container" style="margin-left: 100px;" >
	<div class="row">
		<div>
    	<table class="table" style="width: 70%;">
<%
if(listcount > 0){
%>
	<tr align="center" valign="middle">
		<td colspan="4">사내 공지사항</td>
		<td align=right>
			<font size=2>글 개수 : ${listcount }</font>
		</td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
			<div align="center">번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="50%">
			<div align="center">제목</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="14%">
			<div align="center">작성자</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="17%">
			<div align="center">날짜</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="11%">
			<div align="center">조회수</div>
		</td> 
	</tr>
	
	<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<%
		for(int i=0;i<boardList.size();i++){
			C_N_BrdDTO bl=(C_N_BrdDTO)boardList.get(i);
	%>
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			<%=bl.getNum()%>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
			<a href="CompNoticeDetailAction.cn?num=<%=bl.getNum()%>&page=<%=nowpage%>">
				<%=bl.getTitle()%>
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
<%-- 			<div align="center" onclick="info(<%=bl.getEmpno()%>)"><%=bl.getEname() %></div> --%>
			<a href="#" onclick="info(<%=bl.getEmpno()%>)"><%=bl.getEname() %></a>
<!-- Admin -->
			<!-- Member.info?empno= -->
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=bl.getWrite_date() %></div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=bl.getCount() %></div>
		</td>
	</tr>
	<%} %>
	<!-- 페이징처리 시작 -->
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<%if(level<=1){ %>
			<input type="button" value="이전" >&nbsp;
			<%}else{ %>
			<a href ="CompNoticeList.cn?page=<%=level*5-5 %>"><input type="button" value="이전 "></a>&nbsp;
			<%} %>
			
			<%for(int i=level*5-4;i<= end ;i++){
				if(i==nowpage){%>
				<input type="button" value="<%=i %>" style="background-color: #B2EBF4">&nbsp;
				<%}else{ 
					if(i<=maxpage){
				%>
					<a href="CompNoticeList.cn?page=<%=i %>"><input type="button" value="<%=i %>"></a>&nbsp;
				<%
					}
				 }
				%>
			<%} %>
			
			<%if(level>=(maxpage/5)+1){ %>
			<input type="button" value="다음">
			<%}else{ %>
			<a href="CompNoticeList.cn?page=<%=level*5+1 %>"><input type="button" value="다음"></a>
			<%} %>
		</td>
	</tr>
	<!-- 페이징처리 끝 -->
	<%
    }
	else
	{
	%>
	<tr align="center" valign="middle">
		<td colspan="4">사내 공지사항</td>
		<td align=right>
			<font size=2>등록된 글이 없습니다.</font>
		</td>
	</tr>
	<%
	} 
	%>
	<tr align="right">
	
	
		<td colspan="5">
	 
	   		<c:if test="${sessionScope.admin == true}">
            <a href="CompNoticeWrite.cn"><input type="button" value="글쓰기"></a>
         </c:if>
		</td>
	</tr>
</table>
	</div>
	</div>
	</div>
	</div>
	<jsp:include page="../../Footer.jsp"></jsp:include>
</body>
</html>

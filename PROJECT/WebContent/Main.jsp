<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 메인페이지 -->
<%
	Object empno = session.getAttribute("empno");
	Object ename = session.getAttribute("ename");
	String session_val = empno+"/"+ename;
	
	out.print("<script>");
	out.print("console.log('"+session_val+"')");
	out.print("</script>");
%>
<!DOCTYPE HTML>
<HTML>
<HEAD>
   <meta charset="UTF-8">
   <TITLE> index </TITLE>
   <link type="text/css" rel="stylesheet" href="css/mystyle.css">
   <style>
   </style>
   <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

</HEAD>

<BODY>
   <header>
   2015년 3월 27일 월요일 현재 접속자수 10명 
   </header>

   <nav>
   &nbsp;
   </nav> 

   <aside id="left">
      <h4><b>KOSTA 인트라넷</b></h4>
      <div id="leftdiv1">
                  <p>회원 Login 정보 표시</p>
                  <p><img src="img/S_10.jpg" width="80px" height="80px"></p>
                  <p>20100390님 로그인 하셨습니다.</p>
                  <p><input type="button" value="로그아웃"></p>
      
      </div>
      <div id="leftdiv2">
          <ul>
            <li><a href="http://www.google.com"><span class="glyphicon glyphicon-folder-close" aria-hidden="true"></span>&nbsp;사내</a></li>
            <li><a href="http://www.google.com"><span class="glyphicon glyphicon-folder-close" aria-hidden="true"></span>&nbsp;부서</a></li>
            <li><a href="http://www.google.com"><span class="glyphicon glyphicon-file" aria-hidden="true"></span>&nbsp;결재</a></li>
            <li><a href="http://www.google.com"><span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;사원검색</a></li>
            <li><a href="http://www.google.com"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;마이페이지</a></li>
            <li><a href="http://www.google.com"><span class="glyphicon glyphicon-wrench" aria-hidden="true"></span>&nbsp;관리자페이지</a></li>
          </ul>
      </div>
    </aside>


    <section id="main">
    사내 공지사항
<!-- <div id="div1">사내 공지사항</div>
    <div id="div2">...div2</div>
    <div id="div3">...div3</div>
    <div id="div4">...div4</div> -->
    </section>
    
    <footer>Copyright (c) 2015 KOSTA</footer>

</HTML>

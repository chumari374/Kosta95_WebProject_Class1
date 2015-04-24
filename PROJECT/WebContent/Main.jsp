<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 메인페이지 -->
<!DOCTYPE HTML>
<HTML>
<HEAD>
   <meta charset="UTF-8">
   <TITLE> index </TITLE>
   <link type="text/css" rel="stylesheet" href="css/mystyle.css">
   <style>
body {
background-color: #5f5f5f !important;
}
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
   <nav class="navbar navbar-default">
  <div class="container-fluid">
   
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
     <a class="navbar-brand" href="#"><b><i><font style="color:#2F9D27; font-size:15pt; font-family:맑은 고딕">KOSTA</font></i></b></a>
    </div>

   
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Link</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
      
    </div>
  </div>
</nav>
   </header>

   <aside id="left">
<div id="MainMenu">
    <a href="#demo3" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">사내</a>
    <div class="collapse" id="demo3">
        <a href="#" class="list-group-item" data-parent="#SubMenu1">공지사항</a>
              <a href="#" class="list-group-item" data-parent="#SubMenu1">자료실</a>
              <a href="#" class="list-group-item" data-parent="#SubMenu1">게시판</a>

      </div>
    <a href="#demo4" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">부서</a>
    <div class="collapse" id="demo4">
      <a href="" class="list-group-item">부서 게시판</a>
      <a href="" class="list-group-item">팀 게시판</a>
      <a href="" class="list-group-item">자료실</a>
    </div>
  </div>
    <a href="#demo5" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">결재</a>
     <div class="collapse" id="demo5">
      <a href="" class="list-group-item">결재 현황</a>
      <a href="" class="list-group-item">결재 기한</a>
      <a href="" class="list-group-item">보낸 결재</a>
            <a href="" class="list-group-item">받은 결재</a>
      <a href="" class="list-group-item">사원검색</a>
      <a href="" class="list-group-item">완료 결재함</a>
    </div>
    <a href="#demo7" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">사원검색</a>
        <a href="#demo8" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">마이 페이지</a>
     <div class="collapse" id="demo8">
      <a href="" class="list-group-item">개인정보 수정</a>
      <a href="" class="list-group-item">메세지함</a>
      <a href="" class="list-group-item">일정관리</a>
    </div>
        <a href="#demo6" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">관리자 페이지</a>
     <div class="collapse" id="demo6">
      <a href="" class="list-group-item">사원정보 수정</a>
    </div>
    </aside>

    <section id="main">
    </section>
    

</HTML>
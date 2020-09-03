<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
     // 화면 상단에 위치하는 메뉴처리 (모든페이지에 공유)
     // 로그인 체크(세션 id 값이 있는지 없는지 체크)
     request.setCharacterEncoding("UTF-8");
     String userID = (String)session.getAttribute("userID");
%>

<header>
	<!-- 내비게이션 바 -->
	<nav class="navbar navbar-expand-lg navbar-inverse navbar-fixed-top">
		<!-- 사이트 로고 -->
		<a class="navbar-brand" href="../index.jsp"><img src="../images/logo.png" width="20"></a>
		<!-- 모바일 버튼 -->
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			<span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
		</button>
		<!-- 하위 메뉴 -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<!-- 제목 옆에 들어가는 탭 -->
			<ul class="nav navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="../index.jsp">MovieHere</a></li>
				<li class="nav-item"><a class="nav-link" href="../new/movieList.jsp">영화소개</a></li>
				<li class="nav-item"><a class="nav-link" href="../review/review.jsp">영화리뷰</a></li>
				<li class="nav-item"><a class="nav-link" href="../bbs/bbs.jsp">자유게시판</a></li>
			</ul>
			<!-- 로그인/로그아웃 버튼 -->
			<form class="navbar-form navbar-right">
				<div class="btn-group">
				<%
					if(userID == null) {
				%>
				<button class="btn btn-danger dropdown-toggle" data-toggle="dropdown">로그인</button>&nbsp;&nbsp;&nbsp;
					<ul class="dropdown-menu" role="menu">
						<li><a href="../user/login.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp;로그인</a></li>
						<li><a href="../user/join.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;회원가입</a></li>
				<%
					} else {
				%>
				<button class="btn btn-danger dropdown-toggle" data-toggle="dropdown">로그아웃</button>&nbsp;&nbsp;&nbsp;
					<ul class="dropdown-menu" role="menu">
						<li><a href="../user/logoutAction.jsp"><span class="glyphicon glyphicon-log-out"></span>&nbsp;로그아웃</a></li>
						<li><a href="../my/myInfo.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;회원정보</a></li>
				<%
					}
				%>
					</ul>
				</div>
			</form>	
			<!-- 검색창 -->
			<form action="review.jsp" method="get" class="navbar-form mr-auto">
				<input type="text" name="search" class="form-control" placeholder="리뷰를 검색해보세요!">
				<button type="submit" class="btn btn-default">
					<span class="glyphicon glyphicon-search"></span>검색
				</button>
			</form>
		</div>
	</nav>
</header>
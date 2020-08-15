<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
	<header>
		<!-- 내비게이션 바 -->
		<nav class="navbar navbar-expand-lg navbar-inverse navbar-fixed-top">
			<!-- 사이트 로고 -->
			<a class="navbar-brand" href="index.jsp">
				<img src="./images/logo.png" width="20">
			</a>
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			<!-- 하위 메뉴 -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<!-- 제목 옆에 들어가는 탭 -->
				<ul class="nav navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="index.jsp">MovieHere</a></li>
					<li class="nav-item"><a class="nav-link" href="#">영화소개</a></li>
					<li class="nav-item"><a class="nav-link" href="#">영화예매</a></li>
					<li class="nav-item"><a class="nav-link" href="review.jsp">영화리뷰</a></li>
					<li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
				</ul>
					<form class="navbar-form navbar-right">
						<div class="btn-group">
							<button type="button" class="btn btn-danger">설정</button>
							<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
								<span class="caret"></span>
							</button>&nbsp;&nbsp;&nbsp;
							<ul class="dropdown-menu" role="menu">
						    	<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
						    	<li><a href="logoutAction.jsp"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
						    	<li><a href="join.jsp"><span class="glyphicon glyphicon-ok"></span> 회원가입</a></li>
						    	<li><a href="myPage.jsp"><span class="glyphicon glyphicon-user"></span> 회원정보</a></li>
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
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
						<div class="dropdown">
							<button class="btn btn-danger dropdown-toggle" type="button" data-toggle="dropdown">회원메뉴<span class="caret"></span></button>
								<ul class="dropdown-menu">
									<li><a href="login.jsp">로그인</a></li>
									<li><a href="logoutAction.jsp">로그아웃</a></li>
									<li><a href="myPage.jsp">회원정보</a></li>
								</ul>
						</div>
					</form>
					
				<!-- 검색창 -->
				<form class="navbar-form mr-auto">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="영화 제목을 입력하세요!">
					</div>
					<button type="submit" class="btn btn-default">
						<span class="glyphicon glyphicon-search"></span>검색
					</button>
				</form>
			</div>
		</nav>
	</header>
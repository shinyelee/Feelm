<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
					<li class="nav-item"><a class="nav-link" href="#">영화리뷰</a></li>
					<li class="nav-item"><a class="nav-link" href="#">게시판</a></li>
				</ul>
				<%
					// if(userID == null) {
				%>
				<!-- 아이디 == null이면 로그인 필요하므로 로그인 버튼 보이게 함 -->
					<form class="navbar-form navbar-right">
						<button type="submit" class="btn btn-danger">로그인</button>
					</form>
				<%		
					// } else {
				%>
				<!-- 아이디 != null이면 로그인 된 상태이므로 로그아웃 버튼 보이게 함 -->
				<!-- <form class="navbar-form navbar-right">
						<button type="submit" class="btn btn-danger">로그아웃</button>
					</form> -->
				<%		
					// }
				%>
				<!-- 검색창 -->
				<form class="navbar-form mr-auto">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="영화 제목을 입력하세요!">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form>
			</div>
		</nav>
	</header>
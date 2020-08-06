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
					<li class="nav-item active"><a class="nav-link" href="index.jsp">MovieHere</a></li>
					<li class="nav-item"><a class="nav-link" href="#">영화소개</a></li>
					<li class="nav-item"><a class="nav-link" href="#">영화예매</a></li>
					<li class="nav-item"><a class="nav-link" href="#">한줄리뷰</a></li>
					<li class="nav-item"><a class="nav-link" href="#">자유게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="#">사진게시판</a></li>
				</ul>
				<!-- 드롭다운 영역 -->
				<%
					// if(userID == null) {
				%>
				<!-- 내비게이션바 우측 드롭다운 영역 -->
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<!-- #은 링크 없는거나 마찬가지(자기자신) -->
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">접속하기<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="login.jsp">로그인</a></li>
							<li><a href="join.jsp">회원가입</a></li>
						</ul>
					</li>	
				</ul>
				<%		
					// } else {
				%>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false">회원관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="myPage.jsp">내 정보</a></li>
							<li><a href="logout.jsp">로그아웃</a></li>
						</ul>
					</li>	
				</ul>
				<%		
					// }
				%>
				<!-- 검색창 -->
				<form class="navbar-form navbar-right">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="영화 제목을 입력하세요!">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form>
			</div>
		</nav>
	</header>
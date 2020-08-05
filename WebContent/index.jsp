<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | index</title>
	<!-- 부트스트랩, 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
<!-- 헤더 -->
	<header>
		<!-- 내비게이션 바 -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<!-- 사이트 로고 -->
			<a class="navbar-brand" href="#">
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
					<li class="nav-item active"><a class="nav-link" href="#">MovieHere</a></li>
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
							<li><a href="#">로그인</a></li>
							<li><a href="#">회원가입</a></li>
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
							<li><a href="#">내 정보</a></li>
							<li><a href="#">로그아웃</a></li>
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
					<button type="submit" class="btn btn-danger">검색</button>
				</form>
			</div>
		</nav>
	</header>
<!-- 메인 이미지 -->
	<style type="text/css">
		.jumbotron {
			background-image: url('images/cover_sf.jpg');
			background-size: cover;
			text-shadow: black 0.2em 0.2em 0.2em;
			color: white;
		}
	</style>
		<!-- 커버 페이지 -->
		<div class="container">
			<div class="jumbotron">
				<h1 class="text-center">Moviehere</h1>
				<p class="text-center">Moviehere는 국내 최대 규모 영화 리뷰 커뮤니티입니다.</p>
				<p class="text-center">다른 사람들과 의견을 자유롭게 교환하고 다양한 영화도 함께 만나보세요!</p>
				<!-- 로그인 페이지로 이동하는 버튼 -->
				<p class="text-center"><a class="btn btn-danger btn-lg" href="#">바로가기</a></p>
			</div>
		</div>
		<!-- 스틸컷 돌아가는 부분-->
		<div class="container">
			<div id="myCarousel" class="carousel slide" data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ol>
				<!-- 스틸컷 이미지 삽입 -->
				<div class="carousel-inner">
					<div class="item active">
						<img src="images/cover_crimeScene.jpg">
					</div>
					<div class="item">
						<img src="images/cover_drama.jpg">
					</div>
					<div class="item">
						<img src="images/cover_earthInvasion.jpg">
					</div>
				</div>
				<!-- 스틸컷 넘기는 버튼 -->
				<a class="left carousel-control" href="#myCarousel" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left"></span>
				</a>
				<a class="right carousel-control" href="#myCarousel" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right"></span>
				</a>
			</div>
		</div>
<!-- 메인 콘텐츠 -->

<!-- 푸터 -->
	<footer style="background-color: #222222; color: #ffffff">
		<div class="container"><br>
			<div class="row">
				<div class="col-sm-3" style="text-align: center;"><h5>Copyright &copy; 2020</h5><h5>이미연(MiYeon Lee)</h5></div>
				<div class="col-sm-3" style="text-align: center;"><h4>홈페이지 소개</h4><p>국내 최대 규모 영화 리뷰 커뮤니티 Moviehere입니다.</p></div>
				<div class="col-sm-3" style="text-align: center;"><h4 style="text-align: center">내비게이션</h4>
					<div class="list-group">
						<a href="#" class="list-group-item">메뉴이름</a>
						<a href="#" class="list-group-item">메뉴이름</a>
						<a href="#" class="list-group-item">메뉴이름</a>
						<a href="#" class="list-group-item">메뉴이름</a>
						<a href="#" class="list-group-item">메뉴이름</a>
					</div>
				</div>
				<div class="col-sm-3" style="text-align: center;"><h4 style="text-align: center">내비게이션2</h4>
					<div class="list-group">
						<a href="#" class="list-group-item">메뉴이름2</a>
						<a href="#" class="list-group-item">메뉴이름2</a>
						<a href="#" class="list-group-item">메뉴이름2</a>
						<a href="#" class="list-group-item">메뉴이름2</a>
						<a href="#" class="list-group-item">메뉴이름2</a>
					</div>
				</div>
			</div>
		</div>
	</footer>
<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="./js/popper.min.js"></script>
	<script src="./js/jquery-3.5.1.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>
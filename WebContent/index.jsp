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
	<style type="text/css">
		.jumbotron {
			background-image: url('images/cover_sf.jpg');
			background-size: cover;
			text-shadow: black 0.2em 0.2em 0.2em;
			color: white;
		}
		a, a:hover {
			color: #ffffff;
		}
	</style>
</head>
<body>

<!-- 헤더 -->
<jsp:include page="header.jsp" flush="false" />
<!-- 메인 이미지 -->

<!-- 커버 페이지 -->
<div class="container">
	<div class="jumbotron">
		<h1 class="text-center">Moviehere</h1>
		<p class="text-center">Moviehere는 국내 최대 규모 영화 리뷰 커뮤니티입니다.</p>
		<p class="text-center">다른 사람들과 의견을 자유롭게 교환하고 다양한 영화도 함께 만나보세요!</p>
		<!-- 로그인 페이지로 이동하는 버튼 -->
		<p class="text-center"><a class="btn btn-danger btn-lg" href="review.jsp">바로가기</a></p>
	</div>
</div>
<!-- 유튜브 예고편 삽입 -->
	<div class="container">
		<iframe width="100%" height="100%" src="https://www.youtube.com/embed/xUDhdCsLkjU" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
		<iframe width="100%" height="100%" src="https://www.youtube.com/embed/MoMd7ae98hk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
		<iframe width="100%" height="100%" src="https://www.youtube.com/embed/xUDhdCsLkjU" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
		<iframe width="100%" height="100%" src="https://www.youtube.com/embed/MoMd7ae98hk" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
	</div>
<!-- 공지사항 -->
<div class="container">
	<table class="table table-default">
		<thead>
			<tr>
				<th class="mobile" style="width:55px; text-align:center;">번호</th>
				<th style="text-align:center;">공지사항</th>
				<th class="mobile" style="width:80px; text-align:center;">작성자</th>
				<th class="mobile" style="width:120px; text-align:center;">날짜</th>
			</tr>
		</thead>
		<!-- 글의 순서에 따라 번호를 붙이는 게시물 형식 만들기 -->
		<tbody>
			<tr>
				<td style="text-align: center;">3</td>
				<td>신규 영화 시사회 참여자를 모집합니다.</td>
				<td style="text-align: center;">운영자</td>
				<td style="text-align: center;">2018-05-05</td>
			</tr>
			<tr>
				<td style="text-align: center;">2</td>
				<td>영화 예매 웹 사이트에 오신 것을 환영합니다.</td>
				<td style="text-align: center;">운영자</td>
				<td style="text-align: center;">2018-05-04</td>
			</tr>
			<tr>
				<td style="text-align: center;">1</td>
				<td>영화 예매 웹 사이트가 개설되었습니다.</td>
				<td style="text-align: center;">운영자</td>
				<td style="text-align: center;">2018-05-03</td>
			</tr>
		</tbody>
	</table>
</div>
<!-- 스틸컷 돌아가는 부분-->
<div class="container">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
		</ol>
		<!-- 스틸컷 이미지 삽입 -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="images/cover_crimeScene.jpg">
			</div>
			<div class="item">
				<img src="images/cover_retro.jpg">
			</div>
			<div class="item">
				<img src="images/cover_earthInvasion.jpg">
			</div>
			<div class="item">
				<img src="images/cover_drama.jpg">
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
<jsp:include page="footer.jsp" flush="false" />
<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="./js/popper.min.js"></script>
	<script src="./js/jquery-3.5.1.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | poster</title>
	<!-- 부트스트랩, 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/custom.css">
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" flush="false" />

<div class="container">
	<!-- Content -->
	<div class="row">
		<div class="col-md-3">
			<img src="../images/movie_image_TENET.jpg" class="img-thumbnail">
			<h5>테넷</h5>
		</div>
		<div class="col-md-3">
			<img src="../images/movie_image_Oh! My Gran.jpg" class="img-thumbnail">
			<h5>오! 문희</h5>
		</div>
		<div class="col-md-3">
			<img src="../images/movie_image_DELIVER US FROM EVIL.jpg" class="img-thumbnail">
			<h5>다만 악에서 구하소서</h5>
		</div>
		<div class="col-md-3">
			<img src="../images/movie_image_OK! MADAM.jpg" class="img-thumbnail">
			<h5>오케이 마담</h5>
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			<img src="../images/movie_image_Jjanggu.jpg" class="img-thumbnail">
			<h5>짱구는 못말려 극장판</h5>
		</div>
		<div class="col-md-3">
			<img src="../images/movie_image_Ghost of war.jpg" class="img-thumbnail">
			<h5>고스트 오브 워</h5>
		</div>
		<div class="col-md-3">
			<img src="../images/movie_image_Moving On.jpg" class="img-thumbnail">
			<h5>남매의 여름밤</h5>
		</div>
		<div class="col-md-3">
			<img src="../images/movie_image_FUKUOKA.jpg" class="img-thumbnail">
			<h5>후쿠오카</h5>
		</div>
	</div>
</div><br>

<!-- 푸터 -->
<jsp:include page="../inc/footer.jsp" flush="false" />
	<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="../js/popper.min.js"></script>
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
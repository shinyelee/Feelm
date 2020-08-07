<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | login</title>
	<!-- 부트스트랩, 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/custom.css">
	<!-- 점보트론 내 폰트 설정 -->
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

	<!-- 로그인 양식 -->
	<div class="container"> <!-- 로그인창 레이아웃 설정이라고 생각하면 됨 -->
		<div class="col-lg-6 col-lg-offset-3">
			<div class="jumbotron" style="padding-top: 20px;">
			 	<form method="post" action="loginAction.jsp"> <!-- 해당 페이지로 정보 전송 -->
			 		<h3 style="text-align: center:">로그인이 필요합니다.</h3> <!-- 가운데 정렬 -->
			 		<!-- 아이디, 비밀번호 입력창 -->
			 		<div class="form-group"> <!-- 아이디 == userID -->
			 			<input type="text" class="form-control" placeholder="아이디를 입력해주세요" name="userID" maxlength="25">	
			 		</div>
			 		<div class="form-group"> <!-- 비밀번호 == userPassword -->
			 			<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" name="userPassword" maxlength="25">	
			 		</div>
			 		<!-- 로그인 버튼 -->
			 		<input type="submit" class="btn btn-danger form-control" value="로그인">
			 		<a href="join.jsp">* 아직 Moviehere의 회원이 아니신가요?</a>
			 	</form>
			</div>
		</div>
	</div>
	
<!-- 푸터 -->
<jsp:include page="footer.jsp" flush="false" />
<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="./js/popper.min.js"></script>
	<script src="./js/jquery-3.5.1.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>
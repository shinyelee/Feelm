<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | jogin</title>
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

	<!-- 회원가입 양식 -->
	<div class="container">
		<div class="col-lg-4"></div>
			<div class="jumbotron" style="padding-top: 20px;">
			 	<form method="post" action="joinAction.jsp"> <!-- 데이터를 joinAction.jsp로 보냄 -->
			 		<h3 style="text-align: center:">회원가입이 필요합니다.</h3>
			 		<!-- 아이디, 비밀번호, 이름, 성별, 이메일 입력창 -->
			 		<div class="form-group">
			 			<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">	
			 		</div>
			 		<div class="form-group">
			 			<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">	
			 		</div>
			 		<div class="form-group"> <!-- 이름 입력란 추가 -->
			 			<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20">	
			 		</div>
			 		<div class="form-group" style="text-align: center;"> <!-- 성별 선택 버튼 추가 -->
			 			<div class="btn-group" data-toggle="buttons">
			 				<label class="btn btn-danger active"> <!-- active 써 넣어서 성별 기본값을 남자로 설정 -->
			 					<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
			 				</label>
			 				<label class="btn btn-danger">
			 					<input type="radio" name="userGender" autocomplete="off" value="여자" checked>여자
			 				</label>
			 			</div>
			 		</div>
			 		<div class="form-group"> <!-- 이메일 입력란 추가 -->
			 			<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="20">	
			 		</div>
			 		<!-- 회원가입 버튼 -->
			 		<input type="submit" class="btn btn-danger form-control" value="회원가입">
			 		<a href="login.jsp">* 이미 Moviehere의 회원입니다.</a>
			 	</form>
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
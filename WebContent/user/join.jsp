<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | join</title>
	<!-- 부트스트랩, 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/custom.css">
	<!-- 점보트론 CSS 설정 -->
	<style type="text/css">
		.jumbotron {
			background-image: url('../images/cover_sf.jpg');
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
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	// 로그인 여부 확인
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어 있습니다.')");
		script.println("location.href = '../index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" flush="false" />
	<!-- 회원가입 양식 -->
	<div class="container">
		<div class="col-lg-6 col-lg-offset-3">
			<div class="jumbotron" style="padding-top: 20px;">
			 	<form method="post" action="joinAction.jsp"> <!-- 데이터를 joinAction.jsp로 보냄 -->
			 		<h3 style="text-align: center:">회원가입이 필요합니다.</h3>
			 		<!-- 아이디, 비밀번호, 휴대전화, 이메일 입력창 -->
			 		<div class="form-group">
			 			<label>아이디</label>
			 			<input type="text" class="form-control" placeholder="12자 이내여야 합니다" name="userID" maxlength="12" autofocus>	
			 		</div>
			 		<div class="form-group">
			 			<label>비밀번호</label>
			 			<input type="password" class="form-control" placeholder="20자 이내여야 합니다" name="userPassword" maxlength="20">	
			 		</div>
			 		<div class="form-group">
			 			<label>휴대전화</label>
			 			<input type="tel" class="form-control" placeholder="양식 : 010-XXXX-XXXX" name="userPhone" maxlength="20">	
			 		</div>
			 		<div class="form-group">
			 			<label>이메일</label>
			 			<input type="email" class="form-control" placeholder="가입하려면 이메일 인증이 필요합니다" name="userEmail" maxlength="64">	
			 		</div>
			 		<!-- 회원가입 버튼 -->
			 		<input type="submit" class="btn btn-danger form-control" value="가입하기">
			 		<a href="login.jsp">* Moviehere의 회원입니다</a>
			 	</form>
			</div>
		</div>
	</div>
<!-- 푸터 -->
<jsp:include page="../inc/footer.jsp" flush="false" />
	<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="../js/popper.min.js"></script>
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
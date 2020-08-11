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

<%

	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어 있습니다.');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();	
	}

	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
	if(emailChecked == false) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'emailSendConfirm.jsp'");
		script.println("</script>");
		script.close();		
		return;
	}

%>

<!-- 헤더 -->
<jsp:include page="header.jsp" flush="false" />

	<!-- 회원가입 양식 -->
	<div class="container">
		<div class="col-lg-6 col-lg-offset-3">
			<div class="jumbotron" style="padding-top: 20px;">
			 	<form method="post" action="joinAction.jsp"> <!-- 데이터를 joinAction.jsp로 보냄 -->
			 		<h3 style="text-align: center:">회원가입이 필요합니다.</h3>
			 		<!-- 아이디, 비밀번호, 이메일 입력창 -->
			 		<div class="form-group">
			 			<input type="text" class="form-control" placeholder="아이디를 입력해주세요" name="userID" maxlength="25">	
			 		</div>
			 		<div class="form-group">
			 			<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" name="userPassword" maxlength="25">	
			 		</div>
			 		<div class="form-group">
			 			<input type="email" class="form-control" placeholder="이메일 주소를 입력해주세요" name="userEmail" maxlength="50">	
			 		</div>
			 		<!-- 회원가입 버튼 -->
			 		<input type="submit" class="btn btn-danger form-control" value="회원가입">
			 		<a href="login.jsp">* 이미 Moviehere의 회원이신가요?</a>
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
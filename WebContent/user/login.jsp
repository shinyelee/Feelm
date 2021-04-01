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
	<title>로그인</title>
	<!-- 부트스트랩, 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/custom.css">
	<!-- 점보트론 CSS -->
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
		script.println("alert('이미 로그인이 되어 있습니다.');");
		script.println("location.href = '../index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>

<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" flush="false" />
	<!-- 로그인 양식 -->
	<div class="container"> <!-- 로그인창 레이아웃 설정이라고 생각하면 됨 -->
		<div class="col-lg-6 col-lg-offset-3">
			<div class="jumbotron" style="padding-top: 20px;">
			 	<form method="post" action="loginAction.jsp"> <!-- 해당 페이지로 정보 전송 -->
			 		<h3 style="text-align: center:">로그인이 필요합니다.</h3> <!-- 가운데 정렬 -->
			 		<div class="form-group"> <!-- 아이디 -->
			 			<input type="text" class="form-control" placeholder="아이디를 입력하세요" name="userID" maxlength="12" autofocus>	
			 		</div>
			 		<div class="form-group"> <!-- 비밀번호 -->
			 			<input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="userPassword" maxlength="20">	
			 		</div>
			 		<!-- 로그인 버튼 -->
			 		<input type="submit" class="btn btn-danger form-control" value="로그인">
			 		<a href="join.jsp">* 아직 Feelm의 회원이 아닙니다</a>
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
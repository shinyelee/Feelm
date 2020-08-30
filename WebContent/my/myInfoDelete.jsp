<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | myInfoDelete</title>
	<!-- 부트스트랩, 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/custom.css">
	<!-- 점보트론 내 폰트 설정 -->
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
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = '../user/login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" flush="false" />
	<!-- 탈퇴 요청 양식 -->
	<div class="container">
		<div class="col-lg-6 col-lg-offset-3">
			<div class="jumbotron" style="padding-top: 20px;">
			 	<form action="myInfoDeleteAction.jsp" method="post" name="myInfoDelete"> <!-- 데이터를 myInfoDeleteAction.jsp로 보냄 -->
			 		<h3 style="text-align: center:">회원탈퇴</h3>
			 		<!-- 아이디, 비밀번호 입력창 -->
			 		<div class="form-group">
			 			<label>아이디 확인</label>
			 			<input type="text" class="form-control" name="userID" maxlength="12" value="<%=userID %>" readonly>
			 		</div>
			 		<div class="form-group">
			 			<label>비밀번호 확인</label>
			 			<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" name="userPassword" value="" maxlength="20" autofocus>	
			 		</div>
						정말로 탈퇴하시겠습니까?
			 		<!-- 탈퇴 요청 버튼 -->
					<input type="button" class="btn btn-default" onclick="location.href = 'myInfo.jsp'" value="취소">
					<input type="submit" class="btn btn-danger" value="탈퇴">
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
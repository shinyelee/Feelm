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
	<title>회원정보</title>
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
	UserDTO user = new UserDAO().getUser(userID);
	if (!userID.equals(user.getUserID())) { // 접속자 정보가 다르면 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')"); // 회원정보 수정 권한 없음 
		script.println("location.href = 'index.jsp'"); // 메인 페이지로 보냄
		script.println("</script>");
	}
%>

<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" flush="false" />
	<!-- 회원정보 수정 양식 -->
	<div class="container">
		<div class="col-lg-6 col-lg-offset-3">
			<div class="jumbotron" style="padding-top: 20px;">
			 	<form method="post" action="myInfoUpdate.jsp?userID=<%=userID %>" id="fr" name="fr"> <!-- 데이터를 joinAction.jsp로 보냄 -->
			 		<h3 style="text-align: center:">회원정보</h3>
			 		<!-- 아이디, 비밀번호, 휴대전화 입력창 -->
			 		<div class="form-group">
			 			<label>아이디</label>
			 			<input type="text" class="form-control" name="userID" maxlength="12" value="<%=user.getUserID() %>" readonly>
			 		</div>
			 		<div class="form-group">
			 			<label>비밀번호 변경</label>
			 			<input type="password" class="form-control" placeholder="20자 이내여야 합니다" name="userPassword" maxlength="20" value="<%=user.getUserPassword() %>"autofocus>	
			 		</div>
			 		<div class="form-group">
			 			<label>전화번호 변경</label>
			 			<input type="tel" class="form-control" placeholder="010-XXXX-XXXX" name="userPhone" maxlength="20" value="<%=user.getUserPhone() %>">	
			 		</div>
			 		<div class="form-group">
			 			<label>이메일</label>
			 			<input type="email" class="form-control" name="userEmail" maxlength="64" value="<%=user.getUserEmail() %>" readonly>	
			 		</div>
			 	<%
				 	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
					if(emailChecked == true) { 
				%>
					<div class="form-group">
			 			<label>회원등급</label>
			 			<input type="text" class="form-control" name="userLevel" maxlength="64" value="정회원" readonly>	
			 		</div>
				<%
					} else {
				%>
					<div class="form-group">
			 			<label>회원등급</label>
			 			<input type="text" class="form-control" name="userLevel" maxlength="64" value="준회원" readonly>	
			 		</div>
		 		<%
					}
				%>
			 		<!-- 회원정보 수정 버튼 -->
			 		<input type="button" class="btn btn-default" onclick="location.href = 'myInfoDelete.jsp'" value="탈퇴">
			 		<input type="reset" class="btn btn-default cancel" value="리셋">
			 		<input type="submit" class="btn btn-danger pull-right" value="수정">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Moviehere | logoutAction</title>
</head>
<body>
	<%
		session.invalidate(); // 로그아웃 (세션 빼앗음)
	%>
	<script>
		alert('로그아웃 되었습니다.');
		location.href = "index.jsp";
	</script>
</body>
</html>
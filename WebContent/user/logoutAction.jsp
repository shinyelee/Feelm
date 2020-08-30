<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	session.invalidate(); // 로그아웃 (세션 빼앗음)
%>
<script>
	alert('로그아웃 되었습니다.');
	location.href = "../index.jsp";
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="review.ReviewDAO" %>
<%@ page import="likey.LikeyDAO" %>
<%@ page import="java.io.PrintWriter" %>
	
<%!	// 스크립틀릿 아니고 표현식(=) 아니고 선언(!)임 느낌표에 주의
	// 공감 중복&주작 막기 위해 사용자 IP주소 가져옴
	public static String getClientIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if(ip == null || ip.length() == 0) {
		   ip = request.getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0) {
		   ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0) {
		   ip = request.getRemoteAddr();
		}
		return ip;
	}
%>	
<%
	String userID = null;
	// 로그인 여부 확인
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = '../user/login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	// 공감 수행
	request.setCharacterEncoding("UTF-8");
	String reviewID = null;
	if (request.getParameter("reviewID") != null) {
		reviewID = request.getParameter("reviewID");
	}
	ReviewDAO reviewDAO = new ReviewDAO();
	LikeyDAO likeyDAO = new LikeyDAO();
	int result = likeyDAO.like(userID, reviewID, getClientIP(request));
	if (result == 1) { // 정상일 때
		result = reviewDAO.like(reviewID);
		if(result == 1) { // 공감 +1
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'review.jsp'");
			script.println("</script>");
			script.close();
		} else { // DB 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}
	} else { // 이미 공감함
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 공감한 리뷰입니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	}
%>
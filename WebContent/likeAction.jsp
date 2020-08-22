<!-- deleteAction.jsp 복붙 후 수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="review.ReviewDAO" %>
<%@ page import="likey.LikeyDAO" %>
<%@ page import="java.io.PrintWriter" %>
	
	<%!
		public static String getClientIP(HttpServletRequest request) { // 사용자 IP주소 가져옴
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
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) { // 로그아웃 상태
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'login.jsp'"); // 로그인 페이지로
			script.println("</script>");
			script.close();
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		String reviewID = null;
		if (request.getParameter("reviewID") != null) {
			reviewID = request.getParameter("reviewID");
		}
		ReviewDAO reviewDAO = new ReviewDAO(); // 초기화
		LikeyDAO likeyDAO = new LikeyDAO(); // 초기화
		int result = likeyDAO.like(userID, reviewID, getClientIP(request));
		if (result == 1) {
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

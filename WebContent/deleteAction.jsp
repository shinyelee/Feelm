<!-- reportAction.jsp 복붙 후 수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="review.ReviewDAO" %>
<%@ page import="likey.LikeyDTO" %>
<%@ page import="java.io.PrintWriter" %>

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
		if(request.getParameter("reviewID") != null) {
			reviewID = request.getParameter("reviewID");
		}
		ReviewDAO reviewDAO = new ReviewDAO();
		if(userID.equals(reviewDAO.getUserID(reviewID))) {
			int result = new ReviewDAO().delete(reviewID);
			if (result == 1) { // 삭제 성공
				// session.setAttribute("userID", userID);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('리뷰를 삭제했습니다.')");
				script.println("location.href = 'review.jsp'");
				script.println("</script>");
				script.close();
				return;
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('오류로 인해 리뷰 삭제에 실패했습니다.')");
				script.println("history.back();");
				script.println("</script>");
				script.close();
				return;
			}
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('삭제 권한이 없습니다.')");
			script.println("location.href = 'review.jsp'");
			script.println("</script>");
			script.close();
		}
	%>

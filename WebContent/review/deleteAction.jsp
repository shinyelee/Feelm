<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="review.ReviewDAO" %>
<%@ page import="likey.LikeyDTO" %>
<%@ page import="java.io.PrintWriter" %>

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
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	// 리뷰 삭제
	request.setCharacterEncoding("UTF-8");
	String reviewID = null;
	if(request.getParameter("reviewID") != null) {
		reviewID = request.getParameter("reviewID");
	}
	ReviewDAO reviewDAO = new ReviewDAO();
	if(userID.equals(reviewDAO.getUserID(reviewID))) {
		int result = new ReviewDAO().delete(reviewID);
		if (result == 1) { // 리뷰 삭제 성공
			// session.setAttribute("userID", userID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('리뷰를 삭제했습니다.')");
			script.println("location.href = 'review.jsp'");
			script.println("</script>");
			script.close();
			return;
		} else { // 오류 발생하면 리뷰 삭제 실패
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류로 인해 리뷰 삭제에 실패했습니다.')");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
	} else { // 접속자가 글쓴이 아니어도 삭제 실패
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제 권한이 없습니다.')");
		script.println("location.href = 'review.jsp'");
		script.println("</script>");
		script.close();
	}
%>

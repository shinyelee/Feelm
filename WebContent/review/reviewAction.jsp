<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="review.ReviewDTO" %>
<%@ page import="review.ReviewDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<% 
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	// 로그인 여부 확인
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) { // 만약 로그인 안 된 상태라면
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = '../user/login.jsp'"); // 로그인 페이지로.
		script.println("</script>");
		script.close();
		return;
	}
	// ?에 해당하는 항목들
	// reviewID(리뷰 번호)는 자동+1 증가하니 제외
	// userID는 위에서 정의했으니 제외
	// reviewDate(리뷰 공감)는 기본값이 0이니 제외
	String movieTitle = null;
	String movieGenre = null;
	String shortReview = null;
	String fullReview = null;
	String movieScore = null;
	String reviewDate = null;
	// 리뷰 등록
	if (request.getParameter("movieTitle") != null) {
		movieTitle = request.getParameter("movieTitle");
	}
	if (request.getParameter("movieGenre") != null) {
		movieGenre = request.getParameter("movieGenre");
	}
	if (request.getParameter("shortReview") != null) {
		shortReview = request.getParameter("shortReview");
	}
	if (request.getParameter("fullReview") != null) {
		fullReview = request.getParameter("fullReview");
	}
	if (request.getParameter("movieScore") != null) {
		movieScore = request.getParameter("movieScore");
	}
	if (request.getParameter("reviewDate") != null) {
		reviewDate = request.getParameter("reviewDate");
	}
	// 만약 어느 하나라도 빈 값이 있으면 리뷰 등록 불가
	if (movieTitle == null || movieGenre == null || shortReview == null || fullReview == null || movieScore == null || reviewDate == null || 
		movieTitle.equals("") || movieGenre.equals("") || shortReview.equals("") || fullReview.equals("") || movieScore.equals("") || reviewDate.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	ReviewDAO reviewDAO = new ReviewDAO();
	int result = reviewDAO.write(new ReviewDTO(0, userID, movieTitle, movieGenre, shortReview, fullReview, movieScore, reviewDate, 0));
	if (result == -1) { // 하나라도 값이 이상하면
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('리뷰 등록에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	} else { // 리뷰 등록 성공
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('리뷰가 등록되었습니다.')");
		script.println("location.href = 'review.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>
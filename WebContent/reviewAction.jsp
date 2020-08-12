<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

	<% 
		request.setCharacterEncoding("UTF-8");
		String userID = null; // 로그인 상태
		// 사용자가 아이디 입력했으면 userID에 데이터 담아줌
		if (request.getParameter("userID") != null) {
			userID = (String) request.getParameter("userID");
			System.out.println(userID);
		}
		
		if (userID == null) { // 만약 로그인 안 된 상태라면
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("history.back()"); // 다음 단계로 넘어가지 않고 회원가입창에 머무름
			script.println("</script>");
			script.close();
			return;
		}
		// ?에 해당하는 항목들
		// reviewID는 자동+1 증가하니 제외
		// userID는 위에서 정의함
		// reviewDate는 자동 0이니 제외
		String movieTitle = null;
		String shortReview = null;
		String fullReview = null;
		String movieScore = null;
		String reviewDate = null;
		
		if (request.getParameter("movieTitle") != null) {
			movieTitle = request.getParameter("movieTitle");
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
		
		if (movieTitle == null || shortReview == null || fullReview == null || movieScore == null || reviewDate == null || 
			movieTitle.equals("") || shortReview.equals("") || fullReview.equals("") || movieScore.equals("")|| reviewDate.equals("")) {
			// 만약 어느 하나라도 빈 값이 있으면
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			// return; 넣으면 오류뜨므로 삭제
			ReviewDAO reviewDAO = new ReviewDAO(); // reviewDAO 객체로 선언
			// 회원가입 수행 -> 한 명의 사용자 객체를 담아줌
			int result = reviewDAO.write(new ReviewDTO(0, userID, movieTitle, shortReview, fullReview, movieScore, reviewDate, 0));
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('리뷰 등록에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
				script.close();
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('리뷰가 등록되었습니다.')");
				script.println("location.href = 'review.jsp'");
				script.println("</script>");
				script.close();
			} // return; 넣으면 오류뜨므로 삭제
		}
	%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %> <!-- 데이터베이스 접근 위해 추가 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  
	request.setCharacterEncoding("UTF-8");
	// 게시글 수정 기능 구현
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) { // 로그아웃 -> 로그인 페이지로 이동
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('게시글을 수정하려면 로그인이 필요합니다.')"); 
		script.println("location.href = '../login.jsp'"); 
		script.println("</script>");			
		} 		
	
	int bbsID = 0; // 존재하는 글
	if (request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	if (bbsID == 0) { // 존재하지 않는 글
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 글입니다.')"); // 경고창 띄우고 
		script.println("location.href = 'bbs.jsp'"); // 게시판 페이지로 보냄
		script.println("</script>");
	}

	Bbs bbs = new BbsDAO().getBbs(bbsID);
	if (!userID.equals(bbs.getUserID())) { // 접속자와 작성자가 다르면 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')"); // 글 수정 권한 없음 
		script.println("location.href = 'bbs.jsp'"); // 게시판 페이지로 보냄
		script.println("</script>");
	} else {
		if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null ||
			request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")) { // 공란 있음
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')"); // 경고창 띄움
			script.println("history.back()"); // 이전 페이지로 돌려보냄
			script.println("</script>");
		} else {
			BbsDAO bbsDAO = new BbsDAO(); // 공란 없음 -> 게시글 수정
			int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
			if (result == -1) { // 데이터베이스 오류
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('게시글 수정에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else { // 게시글 수정 성공
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('게시글이 수정되었습니다.')");
				script.println("location.href = 'bbs.jsp'"); // 게시글을 수정했으므로 게시판 페이지로 이동
				script.println("</script>");
			} 
		}
	}
%>
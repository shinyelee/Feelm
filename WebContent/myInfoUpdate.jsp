<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) { // 로그아웃 -> 로그인 페이지로 이동
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원정보를 수정하려면 로그인이 필요합니다.')"); 
		script.println("location.href = 'login.jsp'"); 
		script.println("</script>");			
	} 
	
	UserDTO user = new UserDAO().getUser(userID);
	if (!userID.equals(user.getUserID())) { // 접속자와 작성자가 다르면 
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')"); // 회원정보 수정 권한 없음 
			script.println("history.back()");
			script.println("</script>");
		} else {
			if (request.getParameter("userPassword") == null || request.getParameter("userPhone") == null || request.getParameter("userEmail") == null || 
				request.getParameter("userPassword").equals("") || request.getParameter("userPhone").equals("") || request.getParameter("userEmail").equals("")) { // 공란 있음
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력하지 않은 항목이 있습니다.')"); // 경고창 띄움
				script.println("history.back()"); // 이전 페이지로 돌려보냄
				script.println("</script>");
			} else {
				UserDAO userDAO = new UserDAO();
				int result = userDAO.update(userID, request.getParameter("userPassword"), request.getParameter("userPhone"), request.getParameter("userEmail"));
				if (result == -1) { // 데이터베이스 오류
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('회원정보 수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else { // 게시글 수정 성공
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('회원정보가 수정되었습니다.')");
					script.println("location.href = 'myInfo.jsp'"); // 게시글을 수정했으므로 게시판 페이지로 이동
					script.println("</script>");
				} 
			}
		}
%>
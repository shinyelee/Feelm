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
	// 로그인 여부 확인
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) { // 로그아웃 -> 로그인 페이지로 이동
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')"); 
		script.println("location.href = '../user/login.jsp'"); 
		script.println("</script>");			
	} 
	// 회원정보 수정
	UserDTO user = new UserDAO().getUser(userID);
	if (!userID.equals(user.getUserID())) { // 접속ID 정보와 DB ID 정보 불일치하면 회원정보 수정 불가
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
	} else { // 정보 같으나 빈 칸 남아있어도 수정 불가
		if (request.getParameter("userPassword") == null || request.getParameter("userPhone") == null || request.getParameter("userEmail") == null || 
			request.getParameter("userPassword").equals("") || request.getParameter("userPhone").equals("") || request.getParameter("userEmail").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력하지 않은 항목이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else { // 정보 같음
			UserDAO userDAO = new UserDAO();
			int result = userDAO.update(userID, request.getParameter("userPassword"), request.getParameter("userPhone"), request.getParameter("userEmail"));
			if (result == -1) { // DB 꺼져있거나 오류 발생해도 수정 불가
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원정보 수정에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else { // 회원정보 수정 성공
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원정보가 수정되었습니다.')");
				script.println("location.href = 'myInfo.jsp'");
				script.println("</script>");
			} 
		}
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<% 
	request.setCharacterEncoding("UTF-8"); // 한글 인코딩
	String userID = null;
	String userPassword = null;
	
	// 중복 로그인 방지
	if (request.getParameter("userID") != null) {
		userID = (String) request.getParameter("userID");
		System.out.println(userID);
	}
	if (request.getParameter("userPassword") != null) {
		userPassword = (String) request.getParameter("userPassword");
		System.out.println(userPassword);
	}
	
	// 만약 아이디, 비밀번호 중 어느 하나라도 빈 값이 있으면 로그인 불가
	if (userID == null || userPassword == null || userID.equals("") || userPassword.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
		} else { // 아이디와 비밀번호를 모두 입력했다면 올바른지 확인
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(userID, userPassword);
		if (result == 1) { // 아이디와 비밀번호가 일치하면 로그인
			session.setAttribute("userID", userID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 되었습니다.')");
			script.println("location.href = '../index.jsp'");
			script.println("</script>");
			script.close();
			return;
		} else if (result == 0) { // 비밀번호가 불일치하면 로그인 불가
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 다릅니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		} else if (result == -1) { // 아이디가 불일치해도 로그인 불가
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		} else if (result == -2) { // 데이터베이스가 꺼져있거나 오류 발생
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		} 
	}
%>
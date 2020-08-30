<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

<% 
	request.setCharacterEncoding("UTF-8");
	// 회원가입
	String userID = null;
	String userPassword = null;
	String userPhone = null;
	String userEmail = null;
	// 입력값 저장ㄴㄱ
	if (request.getParameter("userID") != null) {
		userID = (String) request.getParameter("userID");
		System.out.println(userID);
	}
	if (request.getParameter("userPassword") != null) {
		userPassword = (String) request.getParameter("userPassword");
		System.out.println(userPassword);
	}
	if (request.getParameter("userPhone") != null) {
		userPhone = (String) request.getParameter("userPhone");
		System.out.println(userPhone);
	}
	if (request.getParameter("userEmail") != null) {
		userEmail = (String) request.getParameter("userEmail");
		System.out.println(userEmail);
	}
	// 만약 아이디, 비밀번호, 휴대전화, 이메일 중 어느 하나라도 빈 값이 있으면 회원가입 불가
	if (userID == null || userPassword == null || userPhone == null || userEmail == null || 
		userID.equals("") || userPassword.equals("") || userPhone.equals("") || userEmail.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	} else { // 빈 값 없으면 회원가입 수행
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(new UserDTO(userID, userPassword, userPhone, userEmail, SHA256.getSHA256(userEmail), false));
		if (result == -1) { // 아이디 중복이면 회원가입 불가
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		} else { // 빈 값 없고 아이디 중복 아니면 회원가입을 위한 인증메일 발송 가능
			session.setAttribute("userID", userID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('인증 메일을 발송했습니다.')");
			script.println("location.href = 'emailSendAction.jsp'");
			script.println("</script>");
			script.close();
		}
	}
%>
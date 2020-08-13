<!-- joinAction.jsp 페이지 통째로 복사 후 수정 -->
<%@ page import="java.io.PrintWriter"%>
<%@ page import="util.SHA256"%>
<%@ page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String code = request.getParameter("code"); // 메일 인증 위한 해시 코드
	UserDAO userDAO = new UserDAO();
	String userID = null;
	if (session.getAttribute("userID") != null) { // 로그인 한 상태면 세션 부여
		userID = (String) session.getAttribute("userID");
	}
	
	if (userID == null) { // 로그아웃 상태인 경우
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = 'login.jsp'"); // 로그인 페이지로 보냄
		script.println("</script>");
		script.close();
		// return;
	}
	String userEmail = userDAO.getUserEmail(userID);
	boolean rightCode = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
	if (rightCode == true) { // 인증 성공시
		userDAO.setUserEmailChecked(userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원가입이 완료되었습니다.');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();		
		// return;
	} else { // 인증 실패시
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 코드입니다.');");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();		
		// return;
	}
%>

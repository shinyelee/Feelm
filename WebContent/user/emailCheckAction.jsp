<!-- joinAction.jsp 페이지 통째로 복사 후 수정 -->
<%@ page import="java.io.PrintWriter"%>
<%@ page import="util.SHA256"%>
<%@ page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	// 메일 인증 절차
	String code = request.getParameter("code"); // 메일 인증 위한 해시 코드
	UserDAO userDAO = new UserDAO();
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
		// return;
	}
	String userEmail = userDAO.getUserEmail(userID);
	boolean rightCode = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
	if (rightCode == true) { // 메일 인증 확인되면 회원가입 수행
		userDAO.setUserEmailChecked(userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증이 완료되었습니다.')");
		script.println("location.href = '../index.jsp'");
		script.println("</script>");
		script.close();		
		// return;
	} else { // 메일 인증 실패하면 회원가입 불가
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 실패했습니다.')");
		script.println("location.href = '../index.jsp'");
		script.println("</script>");
		script.close();		
		// return;
	}
%>

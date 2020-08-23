<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) { // 로그아웃 상태
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = 'login.jsp'"); // 로그인 페이지로
		script.println("</script>");
		script.close();
		return;
	}
/*	
	request.setCharacterEncoding("UTF-8");
	String userPassword = null;
	if(request.getParameter("userID") != null) {
		userPassword = request.getParameter("userID");
	}
	UserDAO userDAO = new UserDAO();
	if(userID.equals(userDAO.getUser(userID))) {
		int result = new UserDAO().delete(userID);
		if (result == 1) { // 삭제
			session.invalidate();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('정상적으로 탈퇴처리 되었습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
			script.close();
			return;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류로 인해 탈퇴에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		}
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 일치하지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();	
	}
*/
%>

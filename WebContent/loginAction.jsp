<!-- joinAction.jsp 복붙 후 수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

	<% 
		request.setCharacterEncoding("UTF-8");
		// 이미 로그인 된 경우 중복 막아줌
		String userID = null;
		String userPassword = null;
		// 사용자가 아이디 입력했으면 userID에 데이터 담아줌
		if (request.getParameter("userID") != null) {
			userID = (String) request.getParameter("userID");
			System.out.println(userID);
		}
		if (request.getParameter("userPassword") != null) {
			userPassword = (String) request.getParameter("userPassword");
			System.out.println(userPassword);
		}
		
		if (userID == null || userPassword == null || userID.equals("") || userPassword.equals("")) {
			// 만약 아이디, 비밀번호 중 어느 하나라도 빈 값이 있으면
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()"); // 다음 단계로 넘어가지 않고 로그인창에 머무름
			script.println("</script>");
			script.close();
			return;
		} else { // 아이디와 비밀번호 모두 입력
			UserDAO userDAO = new UserDAO(); // userDAO 객체로 선언
			int result = userDAO.login(userID, userPassword);
			if (result == 1) { // 아이디와 비밀번호 일치
				session.setAttribute("userID", userID); // 세션값 부여
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('로그인 되었습니다.')");
				script.println("location.href = 'index.jsp'");
				script.println("</script>");
				script.close();
				return;
			} else if (result == 0){ // 비밀번호 불일치
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('비밀번호가 다릅니다.')");
				script.println("history.back()");
				script.println("</script>");
				script.close();
				return;
			} else if (result == -1){ // 아이디 불일치
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('존재하지 않는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
				script.close();
				return;
			} else if (result == -2){ // 데이터베이스 오류
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
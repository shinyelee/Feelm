<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="java.io.PrintWriter" %>

	<% 
		request.setCharacterEncoding("UTF-8");
		// 회원가입 처리
		// 회원가입할 때 기입하는 항목
		String userID = null;
		String userPassword = null;
		String userEmail = null;
		
		// 사용자가 아이디 입력했으면 userID에 데이터 담아줌
		if (request.getParameter("userID") != null) {
			userID = (String) request.getParameter("userID");
			System.out.println(userID);
		}
		if (request.getParameter("userPassword") != null) {
			userPassword = (String) request.getParameter("userPassword");
			System.out.println(userPassword);
		}
		if (request.getParameter("userEmail") != null) {
			userEmail = (String) request.getParameter("userEmail");
			System.out.println(userEmail);
		}
		
		if (userID == null || userPassword == null || userEmail == null || 
			userID.equals("") || userPassword.equals("") || userEmail.equals("")) {
			// 만약 아이디, 비밀번호, 이메일 중 어느 하나라도 빈 값이 있으면
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()"); // 다음 단계로 넘어가지 않고 회원가입창에 머무름
			script.println("</script>");
			script.close();
			} else { // return; 넣으면 오류뜨므로 삭제
			    UserDAO userDAO = new UserDAO(); // userDAO 객체로 선언
			    // 회원가입 수행 -> 한 명의 사용자 객체를 담아줌
				int result = userDAO.join(new UserDTO(userID, userPassword, userEmail, SHA256.getSHA256(userEmail), false));
				if (result == -1) { // 입력사항 다 채웠으나 아이디 중복으로 회원가입 불가한 경우
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('이미 존재하는 아이디입니다.')");
					script.println("history.back()");
					script.println("</script>");
					script.close();
				} else { // 입력사항 다 채웠고 아이디 중복이 아닌 경우
					session.setAttribute("userID", userID); // 세션값 부여
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('인증 메일을 발송했습니다.')");
					script.println("location.href = 'emailSendAction.jsp'"); // 이메일 인증을 위해 이메일 발송 페이지로 넘어감
					script.println("</script>");
					script.close();
				} // return; 넣으면 오류뜨므로 삭제
			}
	%>
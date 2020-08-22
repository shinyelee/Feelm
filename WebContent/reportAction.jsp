<!-- emailSendAction.jsp 복붙 후 수정 -->
<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page import="javax.mail.internet.MimeMessage"%>
<%@ page import="javax.mail.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Properties" %>
<%@ page import="user.UserDAO" %>
<%@ page import="util.SHA256" %>
<%@ page import="util.Gmail" %>
<%@ page import="java.io.PrintWriter" %>

	<%
		UserDAO userDAO = new UserDAO(); // 변수 만듦
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) { // 로그아웃 상태니
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = 'login.jsp'"); // 로그인 페이지로 보냄
			script.println("</script>");
			script.close();
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		String reportTitle = null;
		String reportContent = null;
		if (request.getParameter("reportTitle") != null) {
			reportTitle = request.getParameter("reportTitle");
		}
		if (request.getParameter("reportContent") != null) {
			reportContent = request.getParameter("reportContent");
		}
		if (reportTitle == null || reportContent == null ||  
			reportTitle.equals("") || reportContent.equals("")) {
			// 만약 어느 하나라도 빈 값이 있으면
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('신고메일을 접수했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}
		// 관리자에게 보내는 이메일 메시지
		String host = "http://localhost:8088/Moviehere/"; // 로컬호스트 주소
		String from = "구글ID"; // 신고메일 발송하는 아이디(총 관리자)
		String to = "네이버ID"; // 신고메일 받는 아이디(게시판 관리자)
		String subject = "Moviehere에서 신고 메일이 접수되었습니다.";
		String content = "신고자: " + userID +
						 "<br>신고 제목: " + reportTitle +
						 "<br>신고 내용: " + reportContent;
		// 구글 SMTP 서버에 접속하기 위한 정보, 정해져 있는 값 그대로 넣으면 됨
		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try{
		    Authenticator auth = new Gmail(); // 지메일 인증 수행하는 세팅
		    Session ses = Session.getInstance(p, auth);
		    ses.setDebug(true);
		    MimeMessage msg = new MimeMessage(ses); // 메일 발송
		    msg.setSubject(subject); // 메일 제목
		    Address fromAddr = new InternetAddress(from); // 보내는 사람
		    msg.setFrom(fromAddr);
		    Address toAddr = new InternetAddress(to); // 받는 사람
		    msg.addRecipient(Message.RecipientType.TO, toAddr);
		    msg.setContent(content, "text/html;charset=UTF-8"); // 메일 내용, 인코딩
		    Transport.send(msg); // 메시지 전송
		} catch(Exception e) { // 오류 발생시
		    e.printStackTrace(); // 출력
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.')");
			script.println("history.back()"); // 이전 페이지로 돌려보냄
			script.println("</script>");
			script.close();		
		    return;
		}
	%>

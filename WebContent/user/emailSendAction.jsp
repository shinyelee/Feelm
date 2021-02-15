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
	request.setCharacterEncoding("UTF-8");
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
		return;
	}
	// 이메일 인증 여부 확인
	boolean emailChecked = userDAO.getUserEmailChecked(userID);
	if (emailChecked == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 인증을 완료한 회원입니다.')");
		script.println("location.href = '../index.jsp'");
		script.println("</script>");
		script.close();		
		return;
	}	
	// 사용자에게 보내는 이메일 메시지
	String host = "http://localhost:8088/Moviehere/"; // 로컬호스트 주소 : 이 주소면 다른 컴퓨터에서는 메일 인증 안 됨
	// String host = "http://192.168.7.20:8088/Moviehere/"; // 학원 발표용 주소
	String from = "구글아이디@gmail.com"; // 인증메일 발송하는 이메일
	String to = userDAO.getUserEmail(userID); // 인증메일 받는 이메일(신규유저)
	String subject = "Moviehere 가입 확인 이메일입니다.";
	String content = "다음 링크를 클릭해 인증을 완료하세요." +
	"<a href='" + host + "user/emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";
	// 구글 SMTP 서버에 접속하기 위한 정보
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
	try {
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
	} catch (Exception e) { // 오류 발생
	    e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 가입된 이메일이거나 주소가 올바르지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();		
	    return;
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | emailSendAction</title>
	<!-- 부트스트랩, 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/custom.css">
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" flush="false" />
	<!-- 이메일 확인 요청 문구 -->
	<div class="container">
		<div class="col-lg-6 col-lg-offset-3">
			<div class="alert alert-danger mt-4" role="alert">
				이메일을 확인해주세요. 리뷰 게시판은 메일 인증 후 접근 가능합니다.
			</div>
		</div>
	</div>	
<!-- 푸터 -->
<jsp:include page="../inc/footer.jsp" flush="false" />
<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="../js/popper.min.js"></script>
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
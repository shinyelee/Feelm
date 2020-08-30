<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Moviehere | bbsWriteAction</title>
</head>
<body>
<%  
	String userID = null;
	// 로그인 여부 확인
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')"); 
		script.println("location.href = '../user/login.jsp'"); 
		script.println("</script>");			
	} else { // 로그인 된 경우 제목이나 내용 빈 값 있으면 게시글 등록 불가
		if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			BbsDAO bbsDAO = new BbsDAO(); // 공란 없음 -> 게시글 작성
			int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
			if (result == -1) { // 데이터베이스 오류
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('게시글 작성에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else { // 게시글 작성 성공
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('게시글이 등록되었습니다.')");
				script.println("location.href = 'bbs.jsp'"); // 게시글을 등록했으므로 게시판 페이지로 이동
				script.println("</script>");
			}
		}
	}	
%>
</body>
</html>
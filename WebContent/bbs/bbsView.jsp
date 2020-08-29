<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %> <!-- 데이터베이스 접근 위해 추가 -->
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | bbsView</title>
	<!-- 부트스트랩, 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../css/custom.css">
	<!-- 하이퍼링크로 인해 제목이 밑줄 친 파란색으로 표시되는 것 방지 -->
	<style type="text/css">
		a, a:hover {
			color: #000000;
			text-decoration: none;
		}
		table th {
  			background-color: #eeeeee;
		}
	</style>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("location.href = '../login.jsp'");
			script.println("</script>");
			script.close();
			return;
		}
		
		// 매개변수, 기본세팅 처리
		int bbsID = 0; // 존재하는 글
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) { // 존재하지 않는 글
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 글입니다.')"); 
			script.println("location.href = 'bbs.jsp'"); 
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>
<!-- 헤더 -->
<jsp:include page="../header.jsp" flush="false" />
	<!-- 게시글 하나 보여주는 영역 -->
	<div class="container">
	<div class="row"> <!-- form 태그 삭제함 -->
			<table class="table table-default" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr> <!-- 글 제목 -->
						<th colspan="2" style="background-color: #eeeeee; text-align: center;"><%=bbs.getBbsTitle() %></th>
					</tr>
				</thead>
				<tbody> <!-- 작성자, 작성일 -->
					<tr>
						<td style="text-align: left;>">작성자 | <%=bbs.getUserID() %></td>
						<td style="text-align: right;>">작성일 | <%=bbs.getBbsDate().substring(2, 10) %></td>
					</tr>
					<tr> <!-- 글 내용 출력 -->
						<td colspan="2" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<a href="bbs.jsp" class="btn btn-danger">목록</a>
			<%	// 글 수정/삭제기능
				if(userID != null && userID.equals(bbs.getUserID())) { // 접속한 userID가 빈 값이 아닌 로그인 상태인 동시에 작성자와 일치할 때
			%>
					<a href="bbsUpdate.jsp?bbsID=<%=bbsID %>" class="btn btn-default pull-right">수정</a> <!-- 글 수정 페이지로 보냄 -->
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="bbsDeleteAction.jsp?bbsID=<%=bbsID %>" class="btn btn-default pull-right">삭제</a> <!-- 글 삭제 페이지로 보냄 -->
			<%
				}
			%>
	</div>
	</div>
<!-- 푸터 -->
<jsp:include page="/footer.jsp" flush="false" />
<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
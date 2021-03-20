<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>자유게시판</title>
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
	// 로그인 여부 확인
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = '../user/login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	// 페이징
	int pageNumber = 1; // 1은 기본 페이지
	if (request.getParameter("pageNumber") != null) { // 현재 페이지가 몇 페이지인지 알려주기 위해
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
%>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" flush="false" />
	<!-- 게시판(게시글 목록) 영역 -->
	<div class="container">
		<div class="row">
			<table class="table table-default" style="border: 1px solid #dddddd">
				<thead>
					<tr><!-- 양식 -->
						<th colspan="1" style="text-align: left;">번호</th>
						<th colspan="10" style="text-align: center;">제목</th>
						<th colspan="1" style="text-align: right;">작성일&nbsp;&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					<%  // 게시글 가져오기
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++) {
					%>
					<tr><!-- 내용 -->
						<td colspan="1" style="text-align: left;">
							<%= list.get(i).getBbsID() %>
						</td>
						<td colspan="10" style="text-align: center;">
							<a href="bbsView.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle() %></a>
						</td>
						<td colspan="1" style="text-align: right;">
							<%= list.get(i).getBbsDate().substring(2, 10) %>
						</td>
					<%		
						}
					%>
					</tr>
				</tbody>
			</table>
				<div class="container">
					<%	// 페이징
						int startPage = (pageNumber / 10) * 10 + 1;
						if (pageNumber % 10 == 0) startPage -= 10;
						int targetPage = new BbsDAO().targetPage(pageNumber);
						if (startPage != 1) {
					%>
						<a href="bbs.jsp?pageNumber=<%=startPage - 1 %>" class="btn btn-default btn-sm">&lt;</a>
					<%
						} else {
					%>
						<button type="button" class="btn btn-default btn-sm" disabled>&lt;</button>
					<%	
						} for (int i = startPage; i < pageNumber; i++) {
					%>
						<a href="bbs.jsp?pageNumber=<%=i %>" class="btn btn-default btn-sm"><%=i %></a>
					<%
						} 
					%>
						<a href="bbs.jsp?pageNumber=<%=pageNumber %>" class="btn btn-danger btn-sm"><%=pageNumber %></a>
					<%
						for (int i = pageNumber + 1; i <= targetPage + pageNumber; i++) {
							if (i < startPage + 10) {
					%>
						<a href="bbs.jsp?pageNumber=<%=i %>" class="btn btn-default btn-sm"><%=i %></a>
					<% 
							}
						} if (targetPage + pageNumber > startPage + 9) {
					%>
						<a href="bbs.jsp?pageNumber=<%=startPage + 10 %>" class="btn btn-default btn-sm">&gt;</a>
					<%
						} else {
					%>
						<button type="button" class="btn btn-default btn-sm" disabled>&gt;</button>
					<%
						}
					%>
				<a href="bbsWrite.jsp" class="btn btn-danger btn-sm pull-right">쓰기</a><br>
			</div>
		</div>
	</div><br>
<!-- 푸터 -->
<jsp:include page="../inc/footer.jsp" flush="false" />
	<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
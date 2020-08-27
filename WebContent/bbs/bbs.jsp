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
	<title>Moviehere | bbs</title>
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
		// 페이징
		int pageNumber = 1; // 1은 기본 페이지
		if (request.getParameter("pageNumber") != null) { // 현재 페이지가 몇 페이지인지 알려주기 위해
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
<!-- 헤더 -->
<jsp:include page="/header.jsp" flush="false" />
	<!-- 게시판(게시글 목록) 영역 -->
	<div class="container">
		<div class="row">
			<table class="table table-default" style="border: 1px solid #dddddd">
				<thead>
					<tr><!-- 양식 -->
						<th colspan="1" style="background-color: #eeeeee; text-align: left;">번호</th>
						<th colspan="10" style="background-color: #eeeeee; text-align: center;">제목</th>
						<th colspan="1" style="background-color: #eeeeee; text-align: right;">작성일&nbsp;&nbsp;</th>
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
			<%	// 페이징 - 이전버튼, 다음버튼 생성
				if(pageNumber != 1) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-default btn-arraw-left">이전</a>
			<%
				} if(bbsDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-default btn-arraw-left">다음</a>
			<%		
				}
			%>
			<a href="bbsWrite.jsp" class="btn btn-danger pull-right">쓰기</a>
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
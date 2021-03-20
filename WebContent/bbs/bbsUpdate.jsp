<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %> <!-- 데이터베이스 접근 위해 추가 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>글 수정하기</title>
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
	request.setCharacterEncoding("UTF-8");	
	String userID = null;
	// 로그인 여부 확인
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = '../inc/login.jsp'");
		script.println("</script>");
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
	if (!userID.equals(bbs.getUserID())) { // 접속자와 작성자가 다르면 글 수정 불가
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	}
%>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" flush="false" />	
	<!-- 게시글 수정 영역 -->
	<div class="container">
		<div class="row">
			<form method="post" action="bbsUpdateAction.jsp?bbsID=<%=bbsID %>">
				<table class="table table-default" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr> <!-- 수정 양식 -->
							<th style="text-align: center;">수정하기</th>
						</tr>
					</thead>
					<tbody>
						<tr> <!-- 수정 내용 -->
							<td><input type="text" class="form-control" placeholder="제목을 입력하세요. 45자까지 작성 가능합니다." name="bbsTitle" maxlength="45" value="<%=bbs.getBbsTitle() %>"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="내용을 입력하세요. 2048자까지 작성 가능합니다." name="bbsContent" maxlength="2048" style="height: 300px;"><%=bbs.getBbsContent() %></textarea></td>
						</tr>
					</tbody>
				</table>
				<div class="container">
					<input type="submit" class="btn btn-danger pull-right" value="수정">
					<a href="bbsView.jsp?bbsID=<%=bbsID %>" class="btn btn-default pull-left">취소</a>
				</div>
			</form>
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
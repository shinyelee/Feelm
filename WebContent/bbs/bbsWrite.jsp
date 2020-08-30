<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | bbsWrite</title>
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
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = '../inc/login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" flush="false" />
	<!-- 게시글 작성 영역 -->
	<div class="container">
		<div class="row">
			<form method="post" action="bbsWriteAction.jsp">
				<table class="table table-default" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr> <!-- 양식 -->
							<th style="text-align: center;">글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr> <!-- 내용 -->
							<td><input type="text" class="form-control" placeholder="제목을 입력하세요. 45자까지 작성 가능합니다." name="bbsTitle" maxlength="45"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="내용을 입력하세요. 2048자까지 작성 가능합니다." name="bbsContent" maxlength="2048" style="height: 300px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<button type="button" class="btn btn-default pull-left"><a href="bbs.jsp">취소</a></button>
				<input type="submit" class="btn btn-danger pull-right" value="등록">
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
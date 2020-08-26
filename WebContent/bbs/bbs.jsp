<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
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
					<tr><!-- 내용 -->
						<td colspan="1" style="text-align: left;">1</td>
						<td colspan="10" style="text-align: center;">안녕하세요</td>
						<td colspan="1" style="text-align: right;">20-08-26</td>
					</tr>
				</tbody>
			</table>
			<a href="bbsWrite.jsp" class="btn btn-danger pull-right">등록</a>
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
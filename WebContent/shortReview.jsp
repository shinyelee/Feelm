<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | 한줄리뷰</title>
	<!-- 부트스트랩 CSS 추가 -->
	<link rel="stylesheet" href="./css/bootstrap.css"></link>
	<!-- 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="./css/custom.css"></link>
</head>
<body>
<!-- 한줄리뷰 등록창 -->
<section class="container">
	<form method="get" action="./index.jsp" class="form-inline mt-3">
	<!-- 장르 드롭다운 -->
		<select name="genreDivide" class="form-control mx-1 mt-2">
			<option value="전체">전체</option>
			<option value="액션">액션</option>
			<option value="코미디">코미디</option>
			<option value="멜로">멜로</option>
		</select>
		<!-- 내용 -->
		<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요.">
		<!-- 검색, 작성, 신고 버튼 -->
		<button type="submit" class="btn btn-danger mx-1 mt-2">검색</button>
		<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="registerModal">작성</a>
		<a class="btn btn-warning mx-1 mt-2" data-toggle="modal" href="reportModal">신고</a>
	</form>
</section>
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal">평가 등록</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body"></div>
		</div>
	</div>
</div>
<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="./js/popper.min.js"></script>
	<script src="./js/jquery-3.5.1.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>
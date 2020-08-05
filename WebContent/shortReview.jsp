<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | index</title>
	<!-- 부트스트랩, 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
<!-- 한줄리뷰 등록창 -->
<section class="container">
	<form method="get" action="./index.jsp" class="form-inline mt-3">
	<!-- 장르 드롭다운 -->
		<select name="내용미정" class="form-control mx-1 mt-2">
			<option value="내용미정">내용미정</option>
			<option value="내용미정">내용미정</option>
			<option value="내용미정">내용미정</option>
			<option value="내용미정">내용미정</option>
		</select>
		<!-- 내용 -->
		<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요.">
		<!-- 검색, 작성, 신고 버튼 -->
		<button type="submit" class="btn btn-danger mx-1 mt-2">검색</button>
		<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="registerModal">작성</a>
		<a class="btn btn-warning mx-1 mt-2" data-toggle="modal" href="reportModal">신고</a>
	</form>
</section>
<!-- 모달창 -->
<!-- https://www.youtube.com/watch?v=m-kaYzOuimE&list=PLRx0vPvlEmdAdWCQeUPnyMZ4PsW3dGuFB&index=5 -->
<!-- 13분 5초 -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal">리뷰 등록</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="./reviewRegisterAction.jsp" method="post">
					<div class="form-row">
						<div class="form-group col-sm-6">
							<label>미정1</label>
							<input type="text" name="미정1" class="form-control" maxlength="50">
						</div>
						<div class="form-group col-sm-6">
							<label>미정2</label>
							<input type="text" name="미정2" class="form-control" maxlength="50">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-sm-4">
							<label>주제1</label>
							<select name="주제1" class="form-control">
								<option value="내용1">내용1</option>
								<option value="내용1">내용1</option>
								<option value="내용1">내용1</option>
							</select>
						</div>
						<div class="form-group col-sm-4">
							<label>주제2</label>
							<select name="주제2" class="form-control">
								<option value="내용2">내용2</option>
								<option value="내용2">내용2</option>
								<option value="내용2">내용2</option>
							</select>
						</div>
						<div class="form-group col-sm-4">
							<label>주제3</label>
							<select name="주제3" class="form-control">
								<option value="내용3">내용3</option>
								<option value="내용3">내용3</option>
								<option value="내용3">내용3</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label>주제4</label>
						<input type="text" name="주제4" class="form-control" maxlength="50">
					</div>
					<div class="form-group">
						<label>내용4</label>
						<textarea name="내용4" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="./js/jquery-3.5.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>
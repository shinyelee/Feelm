<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | shortReview</title>
	<!-- 부트스트랩, 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
<!-- 헤더 -->
<jsp:include page="header.jsp" flush="false" />

<!-- 한줄리뷰 등록창 -->
<section class="container">
	<form method="get" action="index.jsp" class="form-inline mt-3">
	<!-- 장르 드롭다운 -->
		<select name="movieGenre" class="form-control mx-1 mt-2">
			<option value="장르1">장르1</option>
			<option value="장르2">장르2</option>
			<option value="장르3">장르3</option>
			<option value="장르4">장르4</option>
		</select>
		<!-- 내용 -->
		<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요.">
		<!-- 검색, 작성, 신고 버튼 -->
		<button type="submit" class="btn btn-default mx-1 mt-2">검색</button>
		<a class="btn btn-default mx-1 mt-2" data-toggle="modal" href="#registerModal">작성</a>
		<a class="btn btn-default mx-1 mt-2" data-toggle="modal" href="#reportModal">신고</a>
	</form>

</section>
<!-- 작성 모달창 -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" style="text-align: center;" id="modal">리뷰 등록</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form action="shortReviewRegisterAction.jsp" method="post">
					<div class="form-group">
						<label>주제1</label>
						<input type="text" name="주제1" class="form-control" maxlength="50">
					</div>
					<div class="form-group">
						<label>주제2</label>
						<input type="text" name="주제2" class="form-control" maxlength="50">
					</div>
					<div class="form-group">
						<label>주제3</label>
						<input type="text" name="주제3" class="form-control" maxlength="50">
					</div>
					<div class="form-group">
						<label>주제4</label>
						<textarea name="내용4" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<button type="submit" class="btn btn-default" data-dismiss="modal">등록</button> 
			</div>
		</div>
	</div>
</div>			
<!-- 리뷰 신고 모달창 -->
<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal">리뷰 신고</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="close"></button>
			</div>
			<div class="modal-body">
				<form action="ShortReviewReportAction.jsp" method="post">
					<div class="form-group">
						<label>주제1</label>
						<input type="text" name="주제1" class="form-control" maxlength="50">
					</div>
					<div class="form-group">
						<label>주제2</label>
						<input type="text" name="주제2" class="form-control" maxlength="50">
					</div>
					<div class="form-group">
						<label>주제3</label>
						<input type="text" name="주제3" class="form-control" maxlength="50">
					</div>
					<div class="form-group">
						<label>주제4</label>
						<textarea name="내용4" class="form-control" maxlength="2048" style="height: 180px;"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-default" data-dismiss="modal">신고</button> 
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 푸터 -->
<jsp:include page="footer.jsp" flush="false" />
<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="./js/jquery-3.5.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>
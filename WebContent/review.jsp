<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | review</title>
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
		<!-- 검색창 -->
		<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요.">
		<!-- 검색, 작성, 신고 버튼 -->
		<button type="submit" class="btn btn-default mx-1 mt-2">검색</button>
		<a class="btn btn-default mx-1 mt-2" data-toggle="modal" href="#registerModal">등록</a>
		<a class="btn btn-default mx-1 mt-2" data-toggle="modal" href="#reportModal">신고</a>
	</form>
</section>
<!-- 한줄평 양식 만들어보기 -->


<section class="container">
</section>


<!-- 페이지네이션 -->
<section class="container">
	<ul class="pagination justify-content-center mt-3">
		<li class="page-item"><a class="page-link" href="#">이전</a></li>
		<li class="page-item"><a class="page-link" href="#">다음</a></li>
	</ul>
</section>
<!-- 등록 모달창 -->
<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" style="text-align: center;" id="modal">리뷰 등록</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form action="reviewRegisterAction.jsp" method="post">
					<div class="form-row">
						<div class="form-group col-sm-9">
							<label>영화제목</label>
							<input type="text" name="movieTitle" class="form-control" maxlength="50">
						</div>
						<div class="form-group col-sm-3">
							<label>별점</label>
							<select name="movieScore" class="form-control">
								<option value="star1" selected>★☆☆☆☆</option>
								<option value="star2">★★☆☆☆</option>
								<option value="star3">★★★☆☆</option>
								<option value="star4">★★★★☆</option>
								<option value="star5">★★★★★</option>
							</select>
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-sm-12">
							<label>한줄감상</label>
							<input type="text" name="shortReview" class="form-control" maxlength="50" placeholder="최대 50자까지 작성 가능합니다.">
						</div>
						<div class="form-group col-sm-12">
							<label>장문감상</label>
							<textarea name="fullReview" class="form-control" maxlength="2000" placeholder="최대 2000자까지 작성 가능합니다." style="height: 250px;"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-default" data-dismiss="modal">등록</button> 
					</div>
				</form>
			</div>
		</div>
	</div>
</div>		
<!-- 신고 모달창 -->
<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="modal">리뷰 신고</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="close"></button>
			</div>
			<div class="modal-body">
				<form action="reviewReportAction.jsp" method="post">
					<div class="form-row">
						<div class="form-group col-sm-9">
							<label>글제목</label>
							<input type="text" name="reportTitle" class="form-control" maxlength="50">
						</div>
						<div class="form-group col-sm-3">
							<label>아이디</label>
							<input type="text" name="userID" class="form-control" maxlength="50">
						</div>
					</div>
					<div class="form-row">
						<div class="form-group col-sm-12">
							<label>신고내용</label>
							<textarea name="reportContent" class="form-control" maxlength="500" placeholder="최대 500자까지 작성 가능합니다. 신고 내용을 구체적으로 적어주세요." style="height: 125px;"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-default" data-dismiss="modal">접수</button> 
						</div>
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
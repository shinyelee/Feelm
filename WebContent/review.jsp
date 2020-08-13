<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
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
	<!-- 하이퍼링크로 인해 제목이 밑줄 친 파란색으로 표시되는 것 방지 -->
	<style type="text/css">
		a, a:hover {
			color: #000000;
			text-decoration: none;
		}
	</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");	
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.');");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
	if(emailChecked == false) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'emailSendConfirm.jsp'");
		script.println("</script>");
		script.close();		
		return;
	}
%>
<!-- 헤더 -->
<jsp:include page="header.jsp" flush="false" />
<!-- 한줄리뷰 목록 -->
<div class="container">
	<form method="get" action="reviewAction.jsp" class="form-inline mt-3">
	<!-- 장르 드롭다운 -->
		<select name="movieGenre" class="form-control mx-1 mt-2">
			<option value="전체">전체</option>
			<option value="드라마/멜로">드라마/멜로</option>
			<option value="가족/코미디">가족/코미디</option>
			<option value="느와르/액션">느와르/액션</option>
			<option value="스릴러/공포">스릴러/공포</option>
			<option value="SF/판타지">SF/판타지</option>
			<option value="애니메이션">애니메이션</option>
			<option value="다큐멘터리">다큐멘터리</option>
		</select>
		<!-- 최신/추천 드롭다운 -->
		<select name="searchType" class="form-control mx-1 mt-2">
			<option value="최신순">최신순</option>
			<option value="추천순">추천순</option>
		</select>
		<!-- 검색창 -->
		<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="내용을 입력하세요.">
		<!-- 검색, 작성, 신고 버튼 -->
		<button type="submit" class="btn btn-default mx-1 mt-2">검색</button>
		<a class="btn btn-default mx-1 mt-2" data-toggle="modal" href="#registerModal">등록</a>
		<a class="btn btn-default mx-1 mt-2" data-toggle="modal" href="#reportModal">신고</a>
	</form>
</div>
<%
/*	ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
	reviewList = new ReviewDAO().getList(movieGenre, searchType, search, pageNumber);
	if(reviewList != null) {
		for(int i = 0; i < reviewList.size(); i++) {
			if(i == 5) break;
			ReviewDTO review = reviewList.get(i);
		}
	} */
%>
<!-- 등록된 리뷰 양식 -->
<br>
<div class="container">
	<div class="row">
			<table class="table table-default" style="border: 1px solid #dddddd">
				<thead>
					<tr>
						<!-- 영화제목 -->
						<th colspan="10" style="text-align: center;">다만 악에서 구하소서&nbsp;<small>&nbsp;(느와르/액션)</small></th>
						<!-- 별점 -->
						<th colspan="1" style="text-align: center;">
							<span style="color: red;">3 ★★★☆☆</span>
						</th>
						<%
							//if(userID != null && userID.equals(user.getUserID())) { // 접속한 userID가 빈 값이 아닌 로그인 상태인 동시에 작성자와 일치할 때
						%>
						<!-- 자기 글은 공감할 수 없도록 삭제 버튼 보이게 함
						<th colspan="1" style="text-align: center;">
							<button type="button" class="btn btn-default btn-xs"><a onclick="return confirm('게시글을 삭제합니다.')" href="reviewDeleteAction.jsp?reviewID=">삭제</a></button>
						</th> -->
						<%		
							//} else {
						%>
						<!-- 다른 사람 글은 공감할 수 있도록 공감 버튼 보이게 함 -->
						<th colspan="1" style="text-align: center;">
							<button type="button" class="btn btn-default btn-xs"><a onclick="return confirm('게시글에 공감합니다.')" href="reviewLikeAction.jsp?reviewID=">0 공감</a></button>
						</th>
						<%	
							//}
						%>
					</tr>
					<tr>
						<!-- 한줄감상, 작성자, 작성일 -->
						<td colspan="10" style="text-align: center;">신명난 카메라와 캐릭터, 언뜻언뜻 기시감.</td>
						<td colspan="1" style="text-align: center;">박평식</td>
						<td colspan="1" style="text-align: center;">20-08-05</td>
					</tr>
				</thead>
				<tbody>
					<tr> <!-- 장문감상 -->
						<td colspan="12" style="text-align: left;">신명난 카메라와 캐릭터, 언뜻언뜻 기시감. 신명난 카메라와 캐릭터, 언뜻언뜻 기시감. 신명난 카메라와 캐릭터, 언뜻언뜻 기시감. 신명난 카메라와 캐릭터, 언뜻언뜻 기시감. 신명난 카메라와 캐릭터, 언뜻언뜻 기시감. 신명난 카메라와 캐릭터, 언뜻언뜻 기시감.</td>
					</tr>
				</tbody>
		</table>
	</div>
</div>	
</div>
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
				<form action="reviewAction.jsp" method="post">
						<div class="form-group col-sm-12">
							<label>영화제목</label>
							<input type="text" name="movieTitle" class="form-control" maxlength="50">
						</div>
						<div class="form-group col-sm-3">
							<label>장르</label>
							<select name="movieGenre" class="form-control">
								<option value="드라마/멜로" selected>드라마/멜로</option>
								<option value="가족/코미디">가족/코미디</option>
								<option value="느와르/액션">느와르/액션</option>
								<option value="스릴러/공포">스릴러/공포</option>
								<option value="SF/판타지">SF/판타지</option>
								<option value="애니메이션">애니메이션</option>
								<option value="다큐멘터리">다큐멘터리</option>
							</select>
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
						<div class="form-group col-sm-3">
							<label>작성자</label>
								<input type="text" name="userID" class="form-control" maxlength="25">
						</div>
						<div class="form-group col-sm-3">
							<label>작성일</label>
								<input type="text" name="reviewDate" class="form-control" maxlength="25">
						</div>
						<div class="form-group col-sm-12">
							<label>한줄감상</label>
							<input type="text" name="shortReview" class="form-control" maxlength="25" placeholder="최대 25자까지 작성 가능합니다.">
						</div>
						<div class="form-group col-sm-12">
							<label>장문감상</label>
							<textarea name="fullReview" class="form-control" maxlength="2000" placeholder="최대 2000자까지 작성 가능합니다." style="height: 250px;"></textarea>
						</div>&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-default" data-dismiss="modal">등록</button> 
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
				<h5 class="modal-title" style="text-align: center;" id="modal">리뷰 신고</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="close"></button>
			</div>
			<div class="modal-body">
				<form action="reviewReportAction.jsp" method="post">
					<div class="form-group col-sm-12">
						<label>글제목</label>
						<input type="text" name="reportTitle" class="form-control" maxlength="25">
					</div>
					<div class="form-group col-sm-12">
						<label>신고내용</label>
						<textarea name="reportContent" class="form-control" maxlength="500" placeholder="최대 500자까지 작성 가능합니다. 신고 내용을 구체적으로 적어주세요." style="height: 125px;"></textarea>
					</div>&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-default" data-dismiss="modal">접수</button> 
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
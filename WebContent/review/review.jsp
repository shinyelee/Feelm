<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="review.ReviewDAO"%>
<%@ page import="review.ReviewDTO"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | review</title>
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
	String movieGenre = "전체"; // 검색창 기본 정렬 순서
	String searchType = "최신순";
	String search = "";
	int pageNumber = 0;
	if(request.getParameter("movieGenre") != null) {
		movieGenre = request.getParameter("movieGenre");
	}
	if(request.getParameter("searchType") != null) {
		searchType = request.getParameter("searchType");
	}
	if(request.getParameter("search") != null) {
		search = request.getParameter("search");
	}
	if(request.getParameter("pageNumber") != null) {
		try {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} catch (Exception e) {
			System.out.println("검색 페이지 번호 오류");
		}
	}
	
	String userID = null;
	// 로그인 여부 확인
	if(session.getAttribute("userID") != null) {
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
	
	boolean emailChecked = new UserDAO().getUserEmailChecked(userID);
	if(emailChecked == false) { // 이메일 인증 안 된 경우
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = '../user/emailSendConfirm.jsp'");
		script.println("</script>");
		script.close();		
		return;
	}
%>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" flush="false" />
	<!-- 한줄리뷰 목록 -->
	<div class="container">
		<form method="get" action="review.jsp" class="form-inline mt-3">
			<!-- 장르 드롭다운 -->
			<select name="movieGenre" class="form-control mx-1 mt-2">
				<option value="전체">전체</option>
				<option value="드라마/멜로" <% if(movieGenre.equals("드라마/멜로")) out.println("selected"); %>>드라마/멜로</option>
				<option value="가족/코미디" <% if(movieGenre.equals("가족/코미디")) out.println("selected"); %>>가족/코미디</option>
				<option value="느와르/액션" <% if(movieGenre.equals("느와르/액션")) out.println("selected"); %>>느와르/액션</option>
				<option value="스릴러/공포" <% if(movieGenre.equals("스릴러/공포")) out.println("selected"); %>>스릴러/공포</option>
				<option value="SF/판타지" <% if(movieGenre.equals("SF/판타지")) out.println("selected"); %>>SF/판타지</option>
				<option value="애니메이션" <% if(movieGenre.equals("애니메이션")) out.println("selected"); %>>애니메이션</option>
				<option value="다큐멘터리" <% if(movieGenre.equals("다큐멘터리")) out.println("selected"); %>>다큐멘터리</option>
			</select>
			<!-- 최신/공감 드롭다운 -->
			<select name="searchType" class="form-control mx-1 mt-2">
				<option value="최신순">최신순</option>
				<option value="공감순" <% if(searchType.equals("공감순")) out.println("selected"); %>>공감순</option>
			</select>
			<!-- 검색창 -->
			<input type="text" name="search" class="form-control mx-1 mt-2" value="<%=search %>" placeholder="리뷰를 검색해보세요!" autofocus>
			<button type="submit" class="btn btn-default mx-1 mt-2">
				<span class="glyphicon glyphicon-search"></span>검색
			</button>
			<!-- 작성, 신고 버튼 -->
			<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#registerModal">쓰기</a>
			<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">신고</a>
		</form>
	</div>
	<br>
	<%
		ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		reviewList = new ReviewDAO().getList(movieGenre, searchType, search, pageNumber);
		if(reviewList != null)
			for(int i = 0; i < reviewList.size(); i++) {
				if(i == 5) break;
				ReviewDTO review = reviewList.get(i);
	%>
	<!-- 등록된 리뷰 양식 -->
	<div class="container">
		<div class="row">
				<table class="table table-default" style="border: 1px solid #dddddd">
					<thead>
						<tr>
							<!-- 별점 -->
							<th colspan="1" style="color: red;">
								<%=review.getMovieScore() %>
							</th>
							<!-- 영화제목, 장르 -->
							<th colspan="10" style="text-align: center;">
								<%=review.getMovieTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>&nbsp;
								<small>&nbsp;(<%=review.getMovieGenre() %>)</small>
							</th>
							<!-- 리뷰 공감/삭제 -->
							<th colspan="1">
								<%
	 								if(userID.equals(review.getUserID())) {
								%>
								<button type="button" class="btn btn-default btn-xs pull-right">
									<a onclick="return confirm('게시글을 삭제합니다.')" href="deleteAction.jsp?reviewID=<%=review.getReviewID() %>">삭제</a>
								</button>
								<button type="button" class="btn btn-default btn-xs pull-right" disabled>
									<a onclick="return confirm('게시글에 공감합니다.')" href="likeAction.jsp?reviewID=<%=review.getReviewID() %>"><%=review.getLikeCount() %>&nbsp;공감</a>
								</button>
								<%
									} else {
								%>
								<button type="button" class="btn btn-default btn-xs pull-right">
									<a onclick="return confirm('게시글에 공감합니다.')" href="likeAction.jsp?reviewID=<%=review.getReviewID() %>"><%=review.getLikeCount() %>&nbsp;공감</a>
								</button>
								<%
									}
								%>
							</th>
						</tr>
						<tr>
							<!-- 작성자, 한줄감상, 관람일 -->
							<td colspan="1"><%=review.getUserID() %></td>
							<td colspan="10" style="text-align: center;"><%=review.getShortReview().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
							<td colspan="1" style="text-align: right;"><%=review.getReviewDate().substring(2, 11) %></td>
						</tr>
					</thead>
					<tbody>
						<tr> <!-- 장문감상 -->
							<td colspan="12"><%=review.getFullReview().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
						</tr>
					</tbody>
			</table>
		</div>
	</div>
	<%
			}
	%>
	<!-- 페이지네이션 -->
	<div class="container">
		<ul class="pagination justify-content-center mt-3">
			<li class="page-item">
			<%
				if(pageNumber <= 0) {
			%>     
				<a class="page-link disabled">이전</a>
			<%
				} else {
			%>
				<a class="page-link" href="review.jsp?movieGenre=<%=URLEncoder.encode(movieGenre, "UTF-8") %>&searchType=<%=URLEncoder.encode(searchType, "UTF-8") %>&search=<%=URLEncoder.encode(search, "UTF-8") %>&pageNumber=<%=pageNumber - 1 %>">이전</a>
			<%
				}
			%>
			</li>
			<li class="page-item">
			<%
				if(reviewList.size() < 6) {
			%>     
				<a class="page-link disabled">다음</a>
			<%
				} else {
			%>
				<a class="page-link" href="review.jsp?movieGenre=<%=URLEncoder.encode(movieGenre, "UTF-8") %>&searchType=<%=URLEncoder.encode(searchType, "UTF-8") %>&search=<%=URLEncoder.encode(search, "UTF-8") %>&pageNumber=<%=pageNumber + 1 %>">다음</a>
			<%
				}
			%>
			</li>
		</ul>
	</div>
	<!-- 등록 모달창 -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" style="text-align: center;" id="modal">리뷰 등록</h5>
				</div>
				<div class="modal-body">
					<form action="reviewAction.jsp" method="post">
							<div class="form-group col-sm-12">
								<label>영화제목</label>
								<input type="text" name="movieTitle" class="form-control" maxlength="28" placeholder="최대 2048자까지 작성 가능합니다." autofocus>
							</div>
						<div class="form-row">
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
									<option value="★☆☆☆☆" selected>★☆☆☆☆</option>
									<option value="★★☆☆☆">★★☆☆☆</option>
									<option value="★★★☆☆">★★★☆☆</option>
									<option value="★★★★☆">★★★★☆</option>
									<option value="★★★★★">★★★★★</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>작성자</label>
								<input type="text" name="userID" class="form-control" maxlength="20" value="<%=userID %>" readonly>
							</div>
							<div class="form-group col-sm-3">
								<label>관람일</label>
								<input type="date" name="reviewDate" class="form-control" maxlength="20" placeholder="선택" >
							</div>
						</div>	
							<div class="form-group col-sm-12">
								<label>한줄감상</label>
								<input type="text" name="shortReview" class="form-control" maxlength="28" placeholder="최대 28자까지 작성 가능합니다.">
							</div>
							<div class="form-group col-sm-12">
								<label>장문감상</label>
								<textarea type="text" name="fullReview" class="form-control" maxlength="2048" placeholder="최대 2048자까지 작성 가능합니다." style="height: 250px;"></textarea>
							</div>&nbsp;&nbsp;&nbsp;
						<div class="modal-footer">	
							<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-danger">쓰기</button> 
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
					<h5 class="modal-title" style="text-align: center;" id="modal">리뷰 신고</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="close"></button>
				</div>
				<div class="modal-body">
					<form action="reportAction.jsp" method="post">
						<div class="form-group col-sm-12">
							<label>신고제목</label>
							<input type="text" name="reportTitle" class="form-control" maxlength="64" autofocus>
						</div>
						<div class="form-group col-sm-12">
							<label>신고내용</label>
							<textarea name="reportContent" class="form-control" maxlength="2048" placeholder="신고 내용을 구체적으로 적어주세요." style="height: 125px;"></textarea>
						</div>&nbsp;&nbsp;&nbsp;
					<div class="modal-footer">	
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-danger">접수</button> 
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<!-- 푸터 -->
<jsp:include page="../inc/footer.jsp" flush="false" />
	<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../js/popper.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
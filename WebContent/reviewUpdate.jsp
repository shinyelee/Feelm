<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="review.ReviewDAO"%>
<%@ page import="review.ReviewDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | reviewUpdate</title>
	<!-- 부트스트랩, 커스텀 CSS 추가 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/custom.css">
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
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	int reviewID = 0; // 존재하는 글
	if (request.getParameter("reviewID") != null) {
		reviewID = Integer.parseInt(request.getParameter("reviewID"));
	}
	if (reviewID == 0) { // 존재하지 않는 글
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 글입니다.')"); // 경고창 띄우고 
		script.println("location.href = 'review.jsp'"); // 게시판 페이지로 보냄
		script.println("</script>");
	}
	
/*	Review review = new ReviewDAO().getReview(reviewID);
	if (!userID.equals(review.getUserID())) { // 접속자 정보가 다르면 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')"); // 회원정보 수정 권한 없음 
		script.println("location.href = 'review.jsp'"); // 메인 페이지로 보냄
		script.println("</script>");
	}	*/
%>
<!-- 헤더 -->
<jsp:include page="header.jsp" flush="false" />
<!-- 한줄리뷰 목록 -->
<div class="container">
	<form method="get" action="review.jsp" class="form-inline mt-3">
		<!-- 장르 드롭다운 -->
		<select name="movieGenre" class="form-control mx-1 mt-2">
			<option value="전체">전체</option>
			<option value="드라마/멜로" <% //if(movieGenre.equals("드라마/멜로")) out.println("selected"); %>>드라마/멜로</option>
			<option value="가족/코미디" <% //if(movieGenre.equals("가족/코미디")) out.println("selected"); %>>가족/코미디</option>
			<option value="느와르/액션" <% //if(movieGenre.equals("느와르/액션")) out.println("selected"); %>>느와르/액션</option>
			<option value="스릴러/공포" <% //if(movieGenre.equals("스릴러/공포")) out.println("selected"); %>>스릴러/공포</option>
			<option value="SF/판타지" <% //if(movieGenre.equals("SF/판타지")) out.println("selected"); %>>SF/판타지</option>
			<option value="애니메이션" <% //if(movieGenre.equals("애니메이션")) out.println("selected"); %>>애니메이션</option>
			<option value="다큐멘터리" <% //if(movieGenre.equals("다큐멘터리")) out.println("selected"); %>>다큐멘터리</option>
		</select>
		<!-- 최신/공감 드롭다운 -->
		<select name="searchType" class="form-control mx-1 mt-2">
			<option value="최신순">최신순</option>
			<option value="공감순" <% //if(searchType.equals("공감순")) out.println("selected"); %>>공감순</option>
		</select>
		<!-- 검색창 -->
		<input type="text" name="search" class="form-control mx-1 mt-2" value="<%=//search %>" placeholder="리뷰를 검색해보세요!" autofocus>
		<button type="submit" class="btn btn-default mx-1 mt-2">
			<span class="glyphicon glyphicon-search"></span>검색
		</button>
		<!-- 작성, 신고 버튼 -->
		<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#registerModal">등록</a>
		<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">신고</a>
	</form>
</div>
<br>
<%
/*	ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
	reviewList = new ReviewDAO().getList(movieGenre, searchType, search, pageNumber);
	if(reviewList != null)
		for(int i = 0; i < reviewList.size(); i++) {
			if(i == 5) break;
			ReviewDTO review = reviewList.get(i);	*/
%>
<!-- 등록된 리뷰 양식 -->
<div class="container">
	<div class="row">
		<form action="reviewUpdateAction.jsp" method="post" name="reviewUpdate">
			<table class="table table-default" style="border: 1px solid #dddddd">
				<thead>
					<tr>
						<!-- 별점 -->
						<th colspan="1" style="color: red;">
							<%=//review.getMovieScore() %>
						</th>
						<!-- 영화제목, 장르 -->
						<th colspan="10" style="text-align: center;">
							<%=//review.getMovieTitle() %>&nbsp;<small>&nbsp;(<%=//review.getMovieGenre() %>)</small>
						</th>
						<!-- 취소, 등록 버튼 -->
						<th colspan="1">
							<button type="button" class="btn btn-default btn-xs">
								<a href="review.jsp">취소</a>
							</button>
							<button type="submit" class="btn btn-default btn-xs">
								등록
							</button>
							
						</th>
					</tr>
					<tr>
						<!-- 한줄감상, 작성자, 관람일 -->
						<td colspan="1"><%=//review.getUserID() %></td>
						<td colspan="10" style="text-align: center;"><%=//review.getShortReview() %></td>
						<td colspan="1" style="text-align: right;"><%=//review.getReviewDate().substring(2, 11) %></td>
					</tr>
				</thead>
				<tbody>
					<tr> <!-- 장문감상 -->
						<td colspan="12"><%=//review.getFullReview() %></td>
					</tr>
				</tbody>
			</table>
		</form>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name");
	String subject=request.getParameter("subject");
	String filename1=request.getParameter("filename1");
	String filename2=request.getParameter("filename2");
	String origfilename1=request.getParameter("origfilename1");
	String origfilename2=request.getParameter("origfilename2");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | fileCheck</title>
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
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" flush="false" />
	<!-- 게시글 작성 영역 -->
	<div class="container">
		<div class="row">		
			<table class="table table-default" style="text-align: center; border: 1px solid #dddddd">
				<thead> <!-- 양식 -->
					<tr>
						<th colspan="2" style="text-align: center;" class="td_title">파일 업로드 확인</th>
					</tr>
				</thead>
				<tbody> <!-- 내용 -->
					<tr>
						<td style="text-align: left;">제목 | <%=subject %></td>
						<td style="text-align: right;">ID | <%=name %></td>	
					</tr>
					<tr>
						<td colspan="2">
							다운로드 | <a href="file_down.jsp?file_name=<%=filename1 %>"><%=origfilename1 %></a>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							다운로드 | <a href="file_down.jsp?file_name=<%=filename2 %>"><%=origfilename2 %></a>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="container">
				<button type="button" class="btn btn-default pull-left"><a href="../index.jsp">홈으로</a></button>
			</div>
		</div>
	</div><br>	
<!-- 푸터 -->
<jsp:include page="../inc/footer.jsp" flush="false" />
	<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="../js/popper.min.js"></script>
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
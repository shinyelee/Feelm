<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<!-- 반응형 웹으로 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Moviehere | fileUploadForm</title>
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
		.btn-file {
			position: relative;
			overflow: hidden;
		}
		.btn-file input[type=file] {
			position: absolute;
			top: 0;
			right: 0;
			min-width: 100%;
			min-height: 100%;
			font-size: 100px;
			text-align: right;
			filter: alpha(opacity=0);
			opacity: 0;
			outline: none;
			background: white;
			cursor: inherit;
			display: block;
		}
	</style>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" flush="false" />
	<!-- 게시글 작성 영역 -->
	<div class="container">
		<div class="row">
			<section id="uploadFormArea">
				<form method="post" action="fileUpload.jsp" enctype="multipart/form-data">
					<table class="table table-default" style="text-align: center; border: 1px solid #dddddd">
						<thead> <!-- 양식 -->
							<tr>
								<th colspan="2" style="text-align: center;" class="td_title">파일 업로드 양식</th>
							</tr>
						</thead>
						<tbody> <!-- 내용 -->
							<tr>
								<td><input type="text" class="form-control" name="subject" id="subject" placeholder="제목을 입력하세요" maxlength="45" autofocus required></td>
								<td><input type="text" class="form-control" name="name" id="name" placeholder="ID를 입력하세요" maxlength="12" required></td>	
							</tr>
							<tr>
								<td colspan="2"><input type="file" class="form-control" name="fileName1" id="fileName1"></td>
							</tr>
							<tr>
								<td colspan="2"><input type="file" class="form-control" name="fileName2" id="fileName2"></td>
							</tr>
						</tbody>
					</table>
					<div class="container">
						<button type="button" class="btn btn-default pull-left"><a href="../index.jsp">취소</a></button>
						<input type="submit" class="btn btn-danger pull-right" value="업로드">
					</div>
				</form>
			</section>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*" %>
<%
	String uploadPath=request.getRealPath("/upload");
	
	int size = 10*1024*1024;
	String name="";
	String subject="";
	String filename1="";
	String filename2="";
	String origfilename1="";
	String origfilename2="";
	
	try{
		MultipartRequest multi=new MultipartRequest(request,
							uploadPath,
							size, 
							"UTF-8",
				new DefaultFileRenamePolicy());

		name=multi.getParameter("name");
		subject=multi.getParameter("subject");
		
		Enumeration files=multi.getFileNames();
		
		String file1 =(String)files.nextElement();
		filename1=multi.getFilesystemName(file1);
		origfilename1= multi.getOriginalFileName(file1);
		
		String file2 =(String)files.nextElement();
		filename2=multi.getFilesystemName(file2);
		origfilename2=multi.getOriginalFileName(file2);
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
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
	</style>
</head>
<body>
<!-- 헤더 -->
<jsp:include page="../inc/header.jsp" flush="false" />
	<!-- hidden이라 화면에 보이지 않음 -->
	<form name="filecheck" action="fileCheck.jsp" method="post">
		<input type="hidden" name="name" value="<%=name%>">
		<input type="hidden" name="subject" value="<%=subject%>">
		<input type="hidden" name="filename1" value="<%=filename1%>">
		<input type="hidden" name="filename2" value="<%=filename2%>">
		<input type="hidden" name="origfilename1" value="<%=origfilename1%>">
		<input type="hidden" name="origfilename2" value="<%=origfilename2%>">
	</form>
	<!-- 실제로 보이는 영역 -->
	<div class="container">
		<div class="col-lg-6 col-lg-offset-3">
			<div class="alert alert-danger mt-4" role="alert">
				업로드 확인 및 다운로드 페이지로
				<a href="#" class="btn btn-danger" onclick="javascript:filecheck.submit()">이동</a>
			</div>
		</div>
	</div>	
<!-- 푸터 -->
<jsp:include page="../inc/footer.jsp" flush="false" />
	<!-- popper, jQuery, 부트스트랩 JS 추가 -->
	<script src="../js/popper.min.js"></script>
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
</body>
</html>
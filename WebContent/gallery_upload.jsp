<%@ page language="java" contentType="text/html; charset=UTF-8"

pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>이미지 업로드 게시판입니다.</title>

</head>

<body>

<p align="center"> 어서오세요. </p>

<td> 이미지를 선택해 주세요 </td>

<form method="post" enctype="multipart/form-data" action="gallery_act.jsp">

<input type="file" name="m_filename" size=40>

<table border="1" cellspacing="0" >

<tr>

<td> 작성자 </td>

<td>

<input type="text" name= "m_user" value="">

</td></tr>

<tr>

<td> 제목 </td>

<td>

<input type="text" name= "m_name" value="">

</td></tr>

<tr>

<td> 내용 </td>

<td> <textarea name="m_content" rows="5" cols="40"></textarea>

</td></tr>

</table>

<input type="submit" value="업로드"><br><br>

</form>

</body>

</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">

<head>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>

<%@ page import="java.sql.*" %>

<%

request.setCharacterEncoding("utf-8"); //한글을 사용하기 위해 인코딩 타입을 “utf-8”로 한다.

String realFolder1=""; //이 변수는 이클립스의 경로의 특정 디렉토리와 연결될 변수이다.

String m_filename = ""; //이미지 파일의 변수 이름이다.

String title=""; //제목(m_name) 변수를 받아 파라미터 값으로 특정 디렉토리와 웹페이지에 값을 보낸다.

String post=""; //내용(m_content) 변수를 받아 파라미터 값으로 특정 디렉토리와 웹페이지에 값을 보낸다.

String user=""; //작성자(m_user) 변수를 받아 파라미터 값으로 특정 디렉토리와 웹페이지에 값을 보낸다.

String info=""; //이 변수는 특정 이클립스 경로로 연결될 변수이다.

int maxSize = 1024*1024*5; //업로드 파일의 최대 크기

String encType = "utf-8"; //한글이 깨지지 않도록 “utf-8” 타입으로 인코딩

String savefile1="img"; //이 변수에 저장된 값은 이클립스 경로의 특정 디렉토리 “img” 폴더명이다.

 
ServletContext scontext = getServletContext();

//ServletContext의 인스턴스 변수 scontext를 선언한다.

realFolder1 = scontext.getRealPath(savefile1);

//realFolder1 변수는 이제 서버상의 실제 경로를 찾아낸다.

 
try{

MultipartRequest multi=new MultipartRequest(request, realFolder1, maxSize, encType, new DefaultFileRenamePolicy());

//파일 업로드. 폼에서 가져온 인자값을 얻기 위해 request 객체 전달, 업로드 경로, 파일 최대 크기, 한글처리, 파일 중복 처리, 이전 페이지의 form에서 입력한 값을 각각 가져온다.


Enumeration<?> files = multi.getFileNames();

//업로드한 파일을 Enumeration 타입으로 반환한다.

//Enumeration 형은 데이터를 가져올 때 유용한 인터페이스다. java.util 패키지에 정의되어 있어

//java.util.Enumeration을 import 시켜야 한다.

String file1 = (String)files.nextElement();

//업로드한 파일들의 이름을 얻어온다.

m_filename = multi.getFilesystemName(file1);

title=multi.getParameter("m_name");

//title 변수는 파일 업로드 클래스의 인스턴스 변수 multi를 이용하여 파라미터로 업로드 페이지에서 제목란에 입력한

//문자를 읽어온다.

post=multi.getParameter("m_content");

//post 변수는 파일 업로드 클래스의 인스턴스 변수 multi를 이용하여 파라미터로 업로드 페이지에서 내용란에 입력한 문자를 읽어온다.

user=multi.getParameter("m_user");

//user 변수는 파일 업로드 클래스의 인스턴스 변수 multi를 이용하여 파라미터로 업로드 페이지에서 작성자란에 입//력한 문자를 읽어온다.

info=title + ".txt"; //이클립스의 파일 저장 경로에 저장될 파일의 이름과 확장자를 “제목.txt”로 한다.

PrintWriter writer = null;

try{

String infoPath=application.getRealPath(info);

writer = new PrintWriter(infoPath);

//문자 파일 저장의 실제 경로를 지정한다.

writer.printf("작성자:%s%n",user);

writer.printf("제목:%s%n",title);

writer.printf(post);

//.txt 파일에 저장될 형태

}catch(IOException ioe){

out.println("데이터 못씀"); //예외 처리

}finally{

try{

writer.close();

} catch(Exception e){ //예외 처리


}

}


} catch(Exception e) {

e.printStackTrace();

}

String fullpath1 = realFolder1 + "\\" + m_filename; //실제 경로

 
 
%>

<title>이미지 게시판</title>

</head>

<body>

 
 
<table border="1" cellspacing="0">

<tr>

<td> 사진 </td>

<td>

<img src="<%=fullpath1%>" width=512 height=384>

</td></tr>

<tr>

<td> 작성자 </td>

<td>

<%=user%>

</td></tr>

<tr>

<td> 제목 </td>

<td>

<%=title%>

</td></tr>

<tr>

<td> 내용 </td>

<td>

<%=post%>

</td></tr>

</table>

<a href="gallery_upload.jsp"> 사진 업로드하기 </a>


</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
/*	request.setCharacterEncoding("UTF-8");
	String userID = (String)session.getAttribute("userID");
	if(userID == null) {
		  response.sendRedirect("login.jsp");
	  }
	String userPassword = request.getParameter("userPassword");
	UserDAO userDAO = new UserDAO();
	int check = userDAO.delete(userID, userPassword);
		if (check == 1) {
			session.invalidate();	*/
		%>
		<!--<script type="text/javascript">
			alert("정상적으로 탈퇴되었습니다.");
			location.href="index.jsp";
			</script>-->	  
		<%  
		//} else if (check == 0) {
		%>
		<!--<script type="text/javascript">
			 alert("비밀번호가 다릅니다. 다시 입력해주세요.");
			 location.href="myInfoDelete.jsp";
			</script>-->	  
		<%
		//} else { //result == -1
		%>
		<!--<script type="text/javascript">
			alert("오류로 인해 탈퇴에 실패했습니다.");
			location.href="myInfoDelete.jsp";
			</script>-->	  
		<%
		//}
		%>
		
		
		
		
		
<%
/*	request.setCharacterEncoding("UTF-8");
	String userID = (String)session.getAttribute("userID");
	if(userID == null) {
		response.sendRedirect("login.jsp");
	  }
	String userPassword = request.getParameter("userPassword");
	UserDAO userDAO = new UserDAO();
	int check = userDAO.delete(userID, userPassword);
		if (check == 1) {
			session.invalidate();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('정상적으로 탈퇴되었습니다.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
			script.close();
		} else if (check == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.')");
			script.println("location.href = 'myInfoDelete.jsp'");
			script.println("</script>");
			script.close();
		} else { // (check == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류로 인해 탈퇴에 실패했습니다.')");
			script.println("location.href = 'myInfoDelete.jsp'");
			script.println("</script>");
			script.close();
		}	*/
%>	





<%
/*	request.setCharacterEncoding("UTF-8");
	String userID = (String)session.getAttribute("userID");
	String userPassword = request.getParameter("userPassword");
	if(request.getParameter("userPassword") != null) {
		userPassword = request.getParameter("userPassword");
	}
	UserDAO userDAO = new UserDAO();
	if(userPassword.equals(userDAO.getUser(userPassword))) {
		int result = new UserDAO().delete(userID, userPassword);
		if (result == 1) { // 삭제 성공
			session.setAttribute("userID", userID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('탈퇴에 성공했습니다.')");
			script.println("location.href = 'review.jsp'");
			script.println("</script>");
			script.close();
		return;
		} else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류로 인해 탈퇴에 실패했습니다.')");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 다릅니다.')");
		script.println("location.href = 'review.jsp'");
		script.println("</script>");
		script.close();
	}	*/
%>
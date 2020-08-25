<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");

	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	UserDAO userDAO = new UserDAO();
	int check = userDAO.userCheck(userID, userPassword);
		if (check == 1) {
			userDAO.deleteUser(userID);
			session.invalidate();
		%>
		<script type="text/javascript">
			alert("정상적으로 탈퇴되었습니다.");
			location.href="index.jsp";
			</script>	  
		<%  
		} else if (check == 0) {
		%>
		<script type="text/javascript">
			 alert("비밀번호가 다릅니다. 다시 입력해주세요.");
			 location.href="myInfoDelete.jsp";
			</script>	  
		<%
		} else { // result == -1
		%>
		<script type="text/javascript">
			alert("오류로 인해 탈퇴에 실패했습니다.");
			location.href="myInfoDelete.jsp";
			</script>	  
		<%
		}
		%>

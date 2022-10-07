# 필름 Feelm

> 영화 커뮤니티 웹 프로젝트

![feelm_cover](https://user-images.githubusercontent.com/68595933/112328623-dd270780-8cf9-11eb-9a97-b486ecd6bcf3.PNG)

![feelm_1](https://user-images.githubusercontent.com/68595933/189870065-7a33395c-8a19-4b12-a92d-fc085828bb8e.PNG)

## 시작

- 각종 API를 활용한 영화 커뮤니티 웹 프로젝트입니다.
- [시연영상 바로가기][유튜브]

---

## 개발

### 기간

- 20.08.04. ~ 20.09.05.

### 목표

- JSP Model1로 구현해 봅니다.
- 반응형 화면으로 구현해 봅니다.

### 사용

- HTML5/CSS3
- JavaScript ES6
- Java 8
- jQuery 3.5
- Bootstrap 3
- MySQL 5.6
- Tomcat 8.5

---

## 기능

### 1. 지도(KakaoMaps API)

![map](https://user-images.githubusercontent.com/68595933/189836242-5b3aed24-a5b2-4b7b-aeba-35ffe9b14c4e.png)

- [카카오맵 API][지도 api]를 이용해 지도에 특정 위치를 표시합니다.

```javascript
// map.jsp

// 이미지 지도에 표시할 마커입니다
// 이미지 지도에 표시할 마커를 아래와 같이 배열로 넣어주면 여러개의 마커를 표시할 수 있습니다 
var markers = [
    {
        position: new kakao.maps.LatLng(35.158422, 129.062039)
    },
    {
        position: new kakao.maps.LatLng(35.158422, 129.062039), 
        text: 'Feelm 본사 위치' // text 옵션을 설정하면 마커 위에 텍스트를 함께 표시할 수 있습니다     
    }
];
var staticMapContainer  = document.getElementById('staticMap'), // 이미지 지도를 표시할 div  
    staticMapOption = { 
        center: new kakao.maps.LatLng(35.158422, 129.062039), // 이미지 지도의 중심좌표
        level: 3, // 이미지 지도의 확대 레벨
        marker: markers // 이미지 지도에 표시할 마커 
    };    
// 이미지 지도를 생성합니다
var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
```

### 2. 주간 박스오피스 순위(영화진흥위원회 OPEN API)

![box_office](https://user-images.githubusercontent.com/68595933/189843111-8d92988f-386f-4769-978d-6a756263a109.png)

- [영진위 API][영화 api]를 이용해 주간 박스오피스 순위를 받아옵니다.

```javascript
// weekly.html

	src="https://code.jquery.com/jquery-3.5.1.js" 
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" 
	crossorigin="anonymous">
	</script>
	
	<script src="weekly.js"></script>
	<script>
	for(var i=0; i<weekly.length; i++) {
		$('tbody').append('<tr>');
		$('tbody').append('<td>'+weekly[i]['rank']+'</td>')
		$('tbody').append('<td>'+weekly[i]['rankOldAndNew']+'</td>')
		$('tbody').append('<td>'+weekly[i]['openDt']+'</td>')
		$('tbody').append('<td>'+weekly[i]['movieNm']+'</td>')
		$('tbody').append('<td>'+weekly[i]['audiCnt']+'</td>')
		$('tbody').append('</tr>');
	}
  
// weekly.json

var weekly = [
	{"rnum":"1","rank":"1","rankInten":"0","rankOldAndNew":"OLD","movieCd":"20205144","movieNm":"미나리","openDt":"2021-03-03","salesAmt":"1236983170","salesShare":"31.5","salesInten":"6601770","salesChange":"0.5","salesAcc":"6384981890","audiCnt":"131774","audiInten":"1446","audiChange":"1.1","audiAcc":"702945","scrnCnt":"1012","showCnt":"9193"},
  // 이하 생략
]
```

### 3. 인증(Auth)

![login_logout](https://user-images.githubusercontent.com/68595933/189851704-a27ed709-2e7a-4ee2-9b41-2593d75679f6.png)

- 3.1. 로그인/로그아웃
  - 유효성 검사 후 로그인합니다.

```java
// UserDAO.java

	public int login(String userID, String userPassword) { // 로그인 시도 함수
		String SQL = "select userPassword from user where userID = ?";
		Connection conn = null; // 자바와 DB 연결
		PreparedStatement pstmt = null; // 특정한 SQL문 수행하도록 하는 클래스 
		ResultSet rs = null; // SQL문 수행 후 나온 결과값 처리(?에 데이터 대입)
		try {
			conn = DatabaseUtil.getConnection(); // DatabaseUtil 통해 Connection 객체 초기화
			pstmt = conn.prepareStatement(SQL); // SQL문 실행 준비
			pstmt.setString(1, userID); // 첫번째 ?에 userID 대입
			rs = pstmt.executeQuery(); // 쿼리문 실행(데이터 검색) 후 결과값 rs에 저장ㄴㄱ
			if (rs.next()) { // SQL문 실행 결과 userID가 DB에 존재하고
				if(rs.getString(1).equals(userPassword)) {// userPassword까지 DB 내 정보와 일치하면
					return 1; // 로그인 성공
				} else { // userPassword가 DB 내 정보와 불일치하면
					return 0; // 비밀번호 불일치 -> 로그인 실패
				}
			}
			return -1; // userID가 DB에 없으면(불일치) -> 로그인 실패
		} catch (Exception e) { // 예외 발생하면
			e.printStackTrace(); // 오류 출력
		} finally { // conn, pstmt, rs 자원 해제
			// try-catch 이하 생략
		}
		return -2; // DB 꺼져있거나 오류 발생 -> 로그인 실패
	}
```
```javascript
// login.jsp

	request.setCharacterEncoding("UTF-8");
	String userID = null;
	// 로그인 여부 확인
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어 있습니다.');");
		script.println("location.href = '../index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
// loginAction.jsp

        request.setCharacterEncoding("UTF-8"); // 한글 인코딩
	String userID = null;
	String userPassword = null;
	
	// 중복 로그인 방지
	if (request.getParameter("userID") != null) {
		userID = (String) request.getParameter("userID");
		System.out.println(userID);
	}
	if (request.getParameter("userPassword") != null) {
		userPassword = (String) request.getParameter("userPassword");
		System.out.println(userPassword);
	}
	
	// 만약 아이디, 비밀번호 중 어느 하나라도 빈 값이 있으면 로그인 불가
	if (userID == null || userPassword == null || userID.equals("") || userPassword.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
		} else { // 아이디와 비밀번호를 모두 입력했다면 올바른지 확인
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(userID, userPassword);
		if (result == 1) { // 아이디와 비밀번호가 일치하면 로그인
			session.setAttribute("userID", userID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 되었습니다.')");
			script.println("location.href = '../index.jsp'");
			script.println("</script>");
			script.close();
			return;
		} else if (result == 0) { // 비밀번호가 불일치하면 로그인 불가
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 다릅니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		} else if (result == -1) { // 아이디가 불일치해도 로그인 불가
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		} else if (result == -2) { // 데이터베이스가 꺼져있거나 오류 발생
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
			return;
		} 
	}
```
```javascript
// logoutAction.jsp

        session.invalidate(); // 로그아웃 (세션 빼앗음)
```

![join](https://user-images.githubusercontent.com/68595933/189851810-55f3b5e0-57a0-4480-87f9-a54b39ae4fce.png)

- 3.2. 회원가입
  - 유효성 검사 후 가입합니다.

```java
// UserDAO.java

	public int join(UserDTO user) { // 회원가입 수행하는 함수
		String SQL = "insert into user values (?, ?, ?, ?, ?, false)"; // 이메일체크 제외
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID()); // ?1 (아이디)
			pstmt.setString(2, user.getUserPassword()); // ?2 (비밀번호)
			pstmt.setString(3, user.getUserPhone()); // ?3 (휴대전화)
			pstmt.setString(4, user.getUserEmail()); // ?4 (이메일)
			pstmt.setString(5, user.getUserEmailHash()); // ?5 (이메일해시)
			return pstmt.executeUpdate(); // 쿼리문 실행(데이터 삽입or삭제) 후 결과값 rs에 저장ㄴㄱ
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// try-catch 이하 생략
		}
		return -1; // 회원가입 실패
	}
```
```javascript
// joinAction.jsp

	request.setCharacterEncoding("UTF-8");
	// 회원가입
	String userID = null;
	String userPassword = null;
	String userPhone = null;
	String userEmail = null;
	// 입력값 저장ㄴㄱ
	if (request.getParameter("userID") != null) {
		userID = (String) request.getParameter("userID");
		System.out.println(userID);
	}
	if (request.getParameter("userPassword") != null) {
		userPassword = (String) request.getParameter("userPassword");
		System.out.println(userPassword);
	}
	if (request.getParameter("userPhone") != null) {
		userPhone = (String) request.getParameter("userPhone");
		System.out.println(userPhone);
	}
	if (request.getParameter("userEmail") != null) {
		userEmail = (String) request.getParameter("userEmail");
		System.out.println(userEmail);
	}
	// 만약 아이디, 비밀번호, 휴대전화, 이메일 중 어느 하나라도 빈 값이 있으면 회원가입 불가
	if (userID == null || userPassword == null || userPhone == null || userEmail == null || 
		userID.equals("") || userPassword.equals("") || userPhone.equals("") || userEmail.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	} else { // 빈 값 없으면 회원가입 수행
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(new UserDTO(userID, userPassword, userPhone, userEmail, SHA256.getSHA256(userEmail), false));
		if (result == -1) { // 아이디 중복이면 회원가입 불가
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디 또는 이메일이 이미 존재합니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		} else { // 빈 값 없고 아이디 중복 아니면 회원가입을 위한 인증메일 발송 가능
			session.setAttribute("userID", userID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('인증 메일을 발송했습니다.')");
			script.println("location.href = 'emailSendAction.jsp'");
			script.println("</script>");
			script.close();
		}
	}
```

![email](https://user-images.githubusercontent.com/68595933/189889641-ece1d236-4c41-42c7-81e9-beefb9a10f7a.png)

- 3.3. 이메일 인증
  - [구글이메일][이메일 api]로 가입 인증 이메일을 보냅니다.

```java
// Gmail.java

public class Gmail extends Authenticator { // SMTP로 이메일 인증을 수행하는 클래스 상속
// Authenticator ctl+shift -> enter(javax.mail 선택)
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("구글아이디@gmail.com", "비밀번호"); // "구글아이디(지메일)", "구글비밀번호" 입력
	}
}

// SHA256.java

public class SHA256 { // 회원가입과 이메일 인증에 사용할 해시 데이터를 생성하는 클래스

	public static String getSHA256(String input) { // 해시 값 구하는 함수
		StringBuffer result = new StringBuffer();
		try { // 사용자가 입력한 값을 알고리즘을 적용해 반영
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			// 해킹을 방지하기 위해 salt값 반영
			byte[] salt = "Hello! This is Salt.".getBytes();
			digest.reset();
			digest.update(salt); // 해시 적용한 값 chars에 담아줌
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			for(int i = 0; i < chars.length; i++) { // 문자열 형태로 만들어줌
				String hex = Integer.toHexString(0xff & chars[i]);
				// 한자리 수인 경우 0을 붙여 16진수로 만들어줌
				if(hex.length() == 1) result.append("0");
				result.append(hex); // 위 결과값 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}
	
}

// UserDAO.java

	public String getUserEmail(String userID) { // 아이디값 -> 이메일 반환
		String SQL = "select userEmail from user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery(); // select는 Query, insert나 delete는 Update
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// try-catch 이하 생략
		}
		return null; // DB 오류
	}
```
```javascript
// emailSendAction.jsp

	request.setCharacterEncoding("UTF-8");
	UserDAO userDAO = new UserDAO();
	String userID = null;
	// 로그인 여부 확인
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	// 이메일 인증 여부 확인
	boolean emailChecked = userDAO.getUserEmailChecked(userID);
	if (emailChecked == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 인증을 완료한 회원입니다.')");
		script.println("location.href = '../index.jsp'");
		script.println("</script>");
		script.close();		
		return;
	}	
	// 사용자에게 보내는 이메일 메시지
	String host = "http://localhost:8088/Feelm/"; // 로컬호스트 주소 : 이 주소면 다른 컴퓨터에서는 메일 인증 안 됨
	// String host = "http://192.168.7.20:8088/Feelm/"; // 학원 발표용 주소
	String from = "구글아이디@gmail.com"; // 인증메일 발송하는 이메일
	String to = userDAO.getUserEmail(userID); // 인증메일 받는 이메일(신규유저)
	String subject = "Feelm 가입 확인 이메일입니다.";
	String content = "다음 링크를 클릭해 인증을 완료하세요." +
	"<a href='" + host + "user/emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";
	// 구글 SMTP 서버에 접속하기 위한 정보
	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com");
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
	try {
		Authenticator auth = new Gmail(); // 지메일 인증 수행하는 세팅
		Session ses = Session.getInstance(p, auth);
		ses.setDebug(true);
		MimeMessage msg = new MimeMessage(ses); // 메일 발송
		msg.setSubject(subject); // 메일 제목
		Address fromAddr = new InternetAddress(from); // 보내는 사람
		msg.setFrom(fromAddr);
		Address toAddr = new InternetAddress(to); // 받는 사람
		msg.addRecipient(Message.RecipientType.TO, toAddr);
		msg.setContent(content, "text/html;charset=UTF-8"); // 메일 내용, 인코딩
		Transport.send(msg); // 메시지 전송
	} catch (Exception e) { // 오류 발생
	    e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 가입된 이메일이거나 주소가 올바르지 않습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();		
	    return;
	}
```

![email_check](https://user-images.githubusercontent.com/68595933/189893188-36295453-37f0-422e-b0e7-8d794ad09f77.png)

- 3.4. 회원 등급
  - 이메일 인증을 진행하면 회원등급이 준회원에서 정회원으로 변경됩니다.
  - 인증하지 않으면 준회원으로 가입되며, 게시판 접근이 제한됩니다.

```java
// UserDAO.java

	public boolean getUserEmailChecked(String userID) { // 이메일 인증여부 확인 함수
		String SQL = "select userEmailChecked from user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getBoolean(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// try-catch 이하 생략
		}
		return false; // DB 오류
	}
	
	public boolean setUserEmailChecked(String userID) { // 특정 유저 이메일 인증 수행 함수
		String SQL = "update user set userEmailChecked = true where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL 세팅
			pstmt.setString(1, userID); // ? (아이디)
			pstmt.executeUpdate();
            return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// try-catch 이하 생략
		}
		return false; // DB 오류
	}
```
```javascript
// emailCheckAction.jsp

	request.setCharacterEncoding("UTF-8");
	// 메일 인증 절차
	String code = request.getParameter("code"); // 메일 인증 위한 해시 코드
	UserDAO userDAO = new UserDAO();
	String userID = null;
	// 로그인 여부 확인
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();
		// return;
	}
	String userEmail = userDAO.getUserEmail(userID);
	boolean rightCode = (new SHA256().getSHA256(userEmail).equals(code)) ? true : false;
	if (rightCode == true) { // 메일 인증 확인되면 정회원으로
		userDAO.setUserEmailChecked(userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증이 완료되었습니다.')");
		script.println("location.href = '../index.jsp'");
		script.println("</script>");
		script.close();		
		// return;
	} else { // 메일 인증 실패하면 준회원으로
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증에 실패했습니다.')");
		script.println("location.href = '../index.jsp'");
		script.println("</script>");
		script.close();		
		// return;
	}
	
// emailSendConfirm.jsp

	request.setCharacterEncoding("UTF-8");
	String userID = null;
	// 로그인 여부 확인
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('정회원만 접근 가능한 게시판 입니다.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
```

![my_info](https://user-images.githubusercontent.com/68595933/189902639-041e95ce-7e68-43bf-a5bc-d5950522f1f5.png)

- 3.5. 회원정보 수정
  - 회원정보 페이지에서 비밀번호와 전화번호를 수정합니다.

```java
// UserDAO.java

	public int update(String userID, String userPassword, String userPhone, String userEmail) { // 회원정보 수정하는 함수
		String SQL = "update user set userPassword = ?, userPhone = ?, userEmail = ? where userID = ?"; // 변경 가능한 항목만 표기
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userPassword);
			pstmt.setString(2, userPhone);
			pstmt.setString(3, userEmail);
			pstmt.setString(4, userID);
			return pstmt.executeUpdate(); // 쿼리문 실행(데이터 삽입or삭제) 후 결과값 rs에 저장ㄴㄱ
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// try-catch 이하 생략
		}
		return -1; // DB 오류
	}
```
```javascript
// myInfoUpdate.jsp

	// 회원정보 수정
	UserDTO user = new UserDAO().getUser(userID);
	if (!userID.equals(user.getUserID())) { // 접속ID 정보와 DB ID 정보 불일치하면 회원정보 수정 불가
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
	} else { // 정보 같으나 빈 칸 남아있어도 수정 불가
		if (request.getParameter("userPassword") == null || request.getParameter("userPhone") == null || request.getParameter("userEmail") == null || 
			request.getParameter("userPassword").equals("") || request.getParameter("userPhone").equals("") || request.getParameter("userEmail").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력하지 않은 항목이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else { // 정보 같음
			UserDAO userDAO = new UserDAO();
			int result = userDAO.update(userID, request.getParameter("userPassword"), request.getParameter("userPhone"), request.getParameter("userEmail"));
			if (result == -1) { // DB 꺼져있거나 오류 발생해도 수정 불가
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원정보 수정에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else { // 회원정보 수정 성공
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원정보가 수정되었습니다.')");
				script.println("location.href = 'myInfo.jsp'");
				script.println("</script>");
			} 
		}
	}
```

![withdrawal](https://user-images.githubusercontent.com/68595933/189905116-a1cc2197-eed4-4012-8869-b63da5a47563.png)

- 3.6. 회원탈퇴
  - 비밀번호 재확인 후 회원탈퇴합니다.

```java
// UserDAO.java

	public void deleteUser(String userID) throws Exception {
		Connection conn = null; // 자바와 DB 연결
		PreparedStatement pstmt = null; // 특정한 SQL문 수행하도록 하는 클래스 
		String SQL = null;
		try {
			conn = DatabaseUtil.getConnection(); // DatabaseUtil 통해 Connection 객체 초기화
			SQL = "delete from user where userID = ?";
			pstmt = conn.prepareStatement(SQL); // SQL문 실행 준비
			pstmt.setString(1, userID); //  userID 대입
			pstmt.executeUpdate();
		} catch (Exception e) { // 예외 발생하면
			e.printStackTrace(); // 오류 출력
		} finally { // conn, pstmt, rs 자원 해제
			// try-catch 이하 생략
		}
	}
```
```javascript
// myInfoDeleteAction

	request.setCharacterEncoding("UTF-8");
	// 회원정보 삭제 전 비밀번호 확인
	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	UserDAO userDAO = new UserDAO();
	int check = userDAO.userCheck(userID, userPassword);
		if (check == 1) { // 비밀번호 일치하면 정상 탈퇴
			userDAO.deleteUser(userID);
			session.invalidate();
// html 생략
		} else if (check == 0) { // 비밀번호 불일치하면 탈퇴 불가
// html 생략
		} else { // result == -1, 오류 발생해도 탈퇴 불가
// html 생략
		}
```

### 4. 영화리뷰(게시판1)

![review](https://user-images.githubusercontent.com/68595933/189850663-30281a18-c80c-438e-b194-e91e4bd276ea.PNG)

- 4.1. 게시글 CRUD
  - 리뷰 작성/읽기/삭제 가능합니다.
  - 내가 쓴 게시글만 삭제 버튼을 보여줍니다.
  - 리뷰는 한 페이지에 5개씩 출력되며 이전/다음 버튼을 통해 다른 페이지로 이동합니다.

```java
// ReviewDAO.java

public int write(ReviewDTO reviewDTO) { // 글쓰기 함수
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String SQL = "insert into review values (null, ?, ?, ?, ?, ?, ?, ?, 0);"; // null은 reviewID, 0은likey
			conn = DatabaseUtil.getConnection(); // DatabaseUtil 통해 Connection 객체 초기화
			pstmt = conn.prepareStatement(SQL); // SQL문 실행 준비
			// reviewID와 likeCount 제외 -> ? 6개
			pstmt.setString(1, reviewDTO.getUserID()); // ?에 아이디 대입
			pstmt.setString(2, reviewDTO.getMovieTitle()); // ?에 영화제목 대입
			pstmt.setString(3, reviewDTO.getMovieGenre()); // ?에 한줄리뷰 대입
			pstmt.setString(4, reviewDTO.getShortReview()); // ?에 한줄리뷰 대입
			pstmt.setString(5, reviewDTO.getFullReview()); // ?에 장문리뷰 대입
			pstmt.setString(6, reviewDTO.getMovieScore()); // ?에 리뷰별점 대입
			pstmt.setString(7, reviewDTO.getReviewDate()); // ?에 리뷰날짜 대입
			return pstmt.executeUpdate();
		} catch (Exception e) { // 예외 발생하면
			e.printStackTrace(); // 오류 출력
		} finally {
			// try-catch 이하 생략
		}
		return -1; // DB 꺼져있거나 오류
	}

	public int delete(String reviewID) { // 리뷰 삭제하는 함수
		String SQL = "delete from review where reviewID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(reviewID));
            return pstmt.executeUpdate(); // 삭제
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// try-catch 이하 생략
		}
		return -1; // DB 오류
	}
	
	public String getUserID(String reviewID) { // 사용자 아이디 가져오는 함수
		String SQL = "select userID from review where reviewID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(reviewID));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1); // 아이디 존재O
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// try-catch 이하 생략
		}
		return null; // 아이디 존재X
	}
```
```javascript
// deleteAction.jsp

	// 리뷰 삭제
	request.setCharacterEncoding("UTF-8");
	String reviewID = null;
	if(request.getParameter("reviewID") != null) {
		reviewID = request.getParameter("reviewID");
	}
	ReviewDAO reviewDAO = new ReviewDAO();
	if(userID.equals(reviewDAO.getUserID(reviewID))) {
		int result = new ReviewDAO().delete(reviewID);
		if (result == 1) { // 리뷰 삭제 성공
			// session.setAttribute("userID", userID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('리뷰를 삭제했습니다.')");
			script.println("location.href = 'review.jsp'");
			script.println("</script>");
			script.close();
			return;
		} else { // 오류 발생하면 리뷰 삭제 실패
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류로 인해 리뷰 삭제에 실패했습니다.')");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
	} else { // 접속자가 글쓴이 아니어도 삭제 실패
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('삭제 권한이 없습니다.')");
		script.println("location.href = 'review.jsp'");
		script.println("</script>");
		script.close();
	}
	
// review.jsp

		ArrayList<ReviewDTO> reviewList = new ArrayList<ReviewDTO>();
		reviewList = new ReviewDAO().getList(movieGenre, searchType, search, pageNumber);
		if(reviewList != null)
			for(int i = 0; i < reviewList.size(); i++) {
				if(i == 5) break;
				ReviewDTO review = reviewList.get(i);

// reviewAction.jsp

	// ?에 해당하는 항목들
	// reviewID(리뷰 번호)는 자동+1 증가하니 제외
	// userID는 위에서 정의했으니 제외
	// reviewDate(리뷰 공감)는 기본값이 0이니 제외
	String movieTitle = null;
	String movieGenre = null;
	String shortReview = null;
	String fullReview = null;
	String movieScore = null;
	String reviewDate = null;
	// 리뷰 등록
	if (request.getParameter("movieTitle") != null) {
		movieTitle = request.getParameter("movieTitle");
	}
	if (request.getParameter("movieGenre") != null) {
		movieGenre = request.getParameter("movieGenre");
	}
	if (request.getParameter("shortReview") != null) {
		shortReview = request.getParameter("shortReview");
	}
	if (request.getParameter("fullReview") != null) {
		fullReview = request.getParameter("fullReview");
	}
	if (request.getParameter("movieScore") != null) {
		movieScore = request.getParameter("movieScore");
	}
	if (request.getParameter("reviewDate") != null) {
		reviewDate = request.getParameter("reviewDate");
	}
	// 만약 어느 하나라도 빈 값이 있으면 리뷰 등록 불가
	if (movieTitle == null || movieGenre == null || shortReview == null || fullReview == null || movieScore == null || reviewDate == null || 
		movieTitle.equals("") || movieGenre.equals("") || shortReview.equals("") || fullReview.equals("") || movieScore.equals("") || reviewDate.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	}
	ReviewDAO reviewDAO = new ReviewDAO();
	int result = reviewDAO.write(new ReviewDTO(0, userID, movieTitle, movieGenre, shortReview, fullReview, movieScore, reviewDate, 0));
	if (result == -1) { // 하나라도 값이 이상하면
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('리뷰 등록에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	} else { // 리뷰 등록 성공
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('리뷰가 등록되었습니다.')");
		script.println("location.href = 'review.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
```

![suggestion](https://user-images.githubusercontent.com/68595933/189912278-a581416d-058a-4fdb-bdd9-5ba0fa460110.png)

- 4.2. 공감하기
  - 공감 버튼으로 리뷰를 추천합니다.
  - 공감은 1회만 가능하며, 내가 쓴 리뷰는 공감할 수 없습니다.

```java
// ReviewDAO.java

	public int like(String reviewID) { // 리뷰에 공감 적용하는 함수
		String SQL = "update review set likeCount = likeCount + 1 where reviewID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(reviewID));
            return pstmt.executeUpdate(); // 공감
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// try-catch 이하 생략
		}
		return -1; // DB 오류
	}

// LikeyDAO.java

	public int like(String userID, String reviewID, String userIP) {
		String SQL = "insert into likey values (?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID); // ?1 (아이디)
			pstmt.setString(2, reviewID); // ?2 (리뷰번호)
			pstmt.setString(3, userIP); // ?3 (아이피)
			return pstmt.executeUpdate(); // 쿼리문 실행(데이터 삽입or삭제) 후 결과값 rs에 저장ㄴㄱ
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// try-catch 이하 생략
		}
		return -1; // 추천 중복 오류
	}
```
```javascript
// likeAction.jsp

	// 공감 중복&조작 막기 위해 사용자 IP주소 가져옴
	public static String getClientIP(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if(ip == null || ip.length() == 0) {
		   ip = request.getHeader("Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0) {
		   ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null || ip.length() == 0) {
		   ip = request.getRemoteAddr();
		}
		return ip;
	}
	
	// 공감 수행
	request.setCharacterEncoding("UTF-8");
	String reviewID = null;
	if (request.getParameter("reviewID") != null) {
		reviewID = request.getParameter("reviewID");
	}
	ReviewDAO reviewDAO = new ReviewDAO();
	LikeyDAO likeyDAO = new LikeyDAO();
	int result = likeyDAO.like(userID, reviewID, getClientIP(request));
	if (result == 1) { // 정상일 때
		result = reviewDAO.like(reviewID);
		if(result == 1) { // 공감 +1
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'review.jsp'");
			script.println("</script>");
			script.close();
		} else { // DB 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
			script.close();
		}
	} else { // 이미 공감함
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 공감한 리뷰입니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	}
```
  
![dropdown](https://user-images.githubusercontent.com/68595933/189911005-01a838d9-90ed-4ebf-a96d-62d4082d9b39.png)
![search](https://user-images.githubusercontent.com/68595933/189910690-2f959bdc-d332-4b98-abf1-66266cde48e5.png)

- 4.3. 정렬
  - 드롭다운 메뉴를 통해 리뷰를 최신순/공감순으로 정렬합니다.
  - 드롭다운 메뉴를 통해 리뷰를 장르별로 필터링합니다.
  - 검색창을 통해 리뷰를 검색합니다.

```java
// ReviewDAO.java

	public ArrayList<ReviewDTO> getList (String movieGenre, String searchType, String search, int pageNumber) {
		if(movieGenre.equals("전체")) { // 리뷰 리스트 보여주는 함수
			movieGenre = "";
		}
		ArrayList<ReviewDTO> reviewList = null; // 리뷰리스트 생성
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if(searchType.equals("최신순")) { // 리뷰 최신순으로 출력
				SQL = "select * from review where movieGenre like ? and concat(userID, movieTitle, shortReview, fullReview)"
						+ " like ? order by reviewID desc limit " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			} else if (searchType.equals("공감순")) { // 리뷰 공감순으로 출력
				SQL = "select * from review where movieGenre like ? and concat(userID, movieTitle, shortReview, fullReview)"
						+ " like ? order by likeCount desc limit " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			}
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + movieGenre + "%");
			pstmt.setString(2, "%" + search + "%");
			rs = pstmt.executeQuery();
			reviewList = new ArrayList<ReviewDTO>();
			while (rs.next()) {
				ReviewDTO review = new ReviewDTO(
					rs.getInt(1), // reviewID
					rs.getString(2), // userID
					rs.getString(3), // movieTitle
					rs.getString(4), // movieGenre
					rs.getString(5), // shortReview
					rs.getString(6), // fullReview
					rs.getString(7), // movieScore
					rs.getString(8), // reviewDate
					rs.getInt(9) // likeCount
				);
				reviewList.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return reviewList;
	}
```
```javascript
// review.jsp

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
```

![report](https://user-images.githubusercontent.com/68595933/189850487-53a3d8d2-0b4d-4039-b8d1-55eae8c941c3.PNG)

- 4.4. 신고
  - [구글이메일][이메일 api]로 신고 이메일을 보냅니다.

```javascript
// reportAction.jsp

	// 신고 수행
	request.setCharacterEncoding("UTF-8");
	String reportTitle = null;
	String reportContent = null;
	if (request.getParameter("reportTitle") != null) {
		reportTitle = request.getParameter("reportTitle");
	}
	if (request.getParameter("reportContent") != null) {
		reportContent = request.getParameter("reportContent");
	}
	// 만약 어느 하나라도 빈 값 있으면 신고 불가
	if (reportTitle == null || reportContent == null ||  
		reportTitle.equals("") || reportContent.equals("")) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
		return;
	} else { // 빈 값 없으면 신고 성공
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('신고가 완료되었습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();
	}
	// 관리자에게 보내는 이메일 메시지
	String host = "http://localhost:8088/Feelm/review/review"; // 로컬호스트 주소
	String from = "구글아이디@gmail.com"; // 구글이메일, 신고 접수해 메일로 발송하는 아이디(총 관리자)
	String to = "이메일@주소.com"; // 꼭 구글 아니어도 됨, 신고메일 받는 이메일(게시판 관리자)
	String subject = "Feelm에서 신고 메일이 접수되었습니다.";
	String content = "신고자: " + userID +
					 "<br>리뷰 제목: " + reportTitle +
					 "<br>신고 내용: " + reportContent;
	// 구글 SMTP 서버에 접속하기 위한 정보
	Properties p = new Properties();
	p.put("mail.smtp.user", from);
	p.put("mail.smtp.host", "smtp.googlemail.com");
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");
		try{
	    Authenticator auth = new Gmail(); // 지메일 인증 수행하는 세팅
	    Session ses = Session.getInstance(p, auth);
	    ses.setDebug(true);
	    MimeMessage msg = new MimeMessage(ses); // 메일 발송
	    msg.setSubject(subject); // 메일 제목
	    Address fromAddr = new InternetAddress(from); // 보내는 사람
	    msg.setFrom(fromAddr);
	    Address toAddr = new InternetAddress(to); // 받는 사람
	    msg.addRecipient(Message.RecipientType.TO, toAddr);
	    msg.setContent(content, "text/html;charset=UTF-8"); // 메일 내용, 인코딩
	    Transport.send(msg); // 메시지 전송
	} catch(Exception e) { // 오류 발생
	    e.printStackTrace();
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
		script.close();		
	    return;
	}
```

### 5. 자유게시판(게시판2)

![board](https://user-images.githubusercontent.com/68595933/189918861-15e449a3-f073-46c3-a84c-6323ba2c15c6.png)

- 5.1. 게시글 CRUD
  - 게시글 작성/읽기/수정/삭제 가능합니다.
  - 내가 쓴 게시글만 수정/삭제 버튼을 보여줍니다.

```java
// BbsDAO.java

public String getDate() { // 현재 날짜(서버 시간)을 가져오는 함수
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL문 실행 준비단계로 만듦
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1); // 현재 날짜 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // DB 오류
	}
	
	public int getNext() { // 게시글 번호를 가져오는 함수
		String SQL = "select bbsID from bbs order by bbsID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL문 실행 준비단계로 만듦
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1)+1; // 게시글 번호 반환
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) { // 게시글 작성하는 함수
		String SQL = "insert into bbs values (?, ?, ?, ?, ?, ?)"; // ? 6개
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1); // bbsAvailable
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	
	public Bbs getBbs(int bbsID) { // 글 하나 내용 불러오는 함수
		String SQL = "select * from bbs where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 해당 글 존재하지 않으면 null 반환
	}
	
	public int update(int bbsID, String bbsTitle, String bbsContent) { // 수정할 글 불러오기
		String SQL = "update bbs set bbsTitle = ?, bbsContent = ? where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	}
	
	public int delete(int bbsID) {
		String SQL = "update bbs set bbsAvailable = 0 where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // DB 오류
	
	}
	
```
```javascript
// bbsDeleteAction.jsp

	Bbs bbs = new BbsDAO().getBbs(bbsID);
	if (!userID.equals(bbs.getUserID())) { // 접속자와 작성자가 다르면 게시글 삭제 권한 없음 
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	} else { // 빈 값 없으면
		BbsDAO bbsDAO = new BbsDAO();
		int result = bbsDAO.delete(bbsID);
		if (result == -1) { // 데이터베이스 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('게시글 삭제에 실패했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else { // 글 삭제 성공
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('게시글이 삭제되었습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		} 
	}
	
// bbsUpdateAction.jsp

Bbs bbs = new BbsDAO().getBbs(bbsID);
	if (!userID.equals(bbs.getUserID())) { // 접속자와 작성자가 다르면 글 수정 권한 없음
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'bbs.jsp'");
		script.println("</script>");
	} else { // 접속자와 작성자 같아도 빈 값 있으면 수정 불가
		if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null ||
			request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else { // 빈 값 없을 때
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
			if (result == -1) { // DB 오류
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('게시글 수정에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else { // 수정 성공
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('게시글이 수정되었습니다.')");
				script.println("location.href = 'bbs.jsp'"); //
				script.println("</script>");
			} 
		}
	}
	
// bbsWriteAction.jsp

	String userID = null;
	// 로그인 여부 확인
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 필요합니다.')"); 
		script.println("location.href = '../user/login.jsp'"); 
		script.println("</script>");			
	} else { // 로그인 된 경우 제목이나 내용 빈 값 있으면 게시글 등록 불가
		if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			BbsDAO bbsDAO = new BbsDAO(); // 공란 없음 -> 게시글 작성
			int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
			if (result == -1) { // 데이터베이스 오류
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('게시글 작성에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else { // 게시글 작성 성공
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('게시글이 등록되었습니다.')");
				script.println("location.href = 'bbs.jsp'"); // 게시글을 등록했으므로 게시판 페이지로 이동
				script.println("</script>");
			}
		}
	}
```

![page](https://user-images.githubusercontent.com/68595933/189917806-8066ce8a-eaf8-4c2b-bd6a-787c10e1e076.png)

- 5.1. 게시글 CRUD
  - 게시글은 한 페이지에 10개씩 출력되며 페이지 숫자 버튼을 통해 해당 페이지로 이동합니다.
  - 페이지 목록 양 옆의 화살표 버튼을 통해 10페이지 단위로 이동합니다.

```java
// BbsDAO.java

	public ArrayList<Bbs> getList(int pageNumber) { // 페이징 처리
		String SQL = "select * from bbs where bbsID < ? and bbsAvailable = 1 order by bbsID desc limit 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10); // 한 페이지에 글 10개씩 출력
			rs = pstmt.executeQuery();
			while (rs.next()) { // 게시글에 출력할 데이터
				Bbs bbs = new Bbs(); // ? 6개
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) { // 10개 단위로 딱 떨어지면 다음 페이지 만들지 않음
		String SQL = "select * from bbs where bbsID < ? and bbsAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10); // 한 페이지에 글 10개씩 출력
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int targetPage(int pageNumber) {
		String SQL = "select count(bbsID) from bbs where bbsID < ? and bbsAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) / 10;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
```
```javascript
// bbs.jsp

	// 페이징
	int pageNumber = 1; // 1은 기본 페이지
	if (request.getParameter("pageNumber") != null) { // 현재 페이지가 몇 페이지인지 알려주기 위해
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
```

---

## DB 설계

![user_table](https://user-images.githubusercontent.com/68595933/189946961-56a5baae-4746-4894-a5b0-0fef95c8d7a9.png)

- user(회원정보)

![review_table](https://user-images.githubusercontent.com/68595933/189947046-6f4fb68f-8645-4fc0-a012-f129f3268971.png)

- review(영화리뷰)

![likey_table](https://user-images.githubusercontent.com/68595933/189947110-a9762988-dec2-41c3-acb0-745db00b3395.png)

- likey(공감)

![bbs_table](https://user-images.githubusercontent.com/68595933/189947158-521bc4dc-595d-4829-b9d6-7b7faab9d03a.png)

- bbs(자유게시판)

---

## 피드백

### 문제점

1. JSP Model1로 개발해 유지보수가 어려움.
2. 시간관계상 일부 기능 미구현.

### 개선점

1. JSP Model2로 개발할 것.
2. 다음에 게시판 개발할 때 댓글 구현할 것.

---

## 저작권

이 프로젝트는 MIT 라이센스에 따라 라이센스가 부여됩니다. 자세한 내용은 [LICENSE.md](LICENSE.md) 파일을 참조하십시오.

---

## 레퍼런스

- [참고 유튜브1 바로가기][참고1]
- [참고 유튜브2 바로가기][참고2]

<!-- 링크 -->

[유튜브]: https://www.youtube.com/playlist?list=PLu_M-qKXkbvNLg5dgwucHSp10Szb51ZE-

[지도 api]: https://apis.map.kakao.com/web/guide/
[영화 api]: https://www.kobis.or.kr/kobisopenapi/homepg/apiservice/searchServiceInfo.do
[이메일 api]: https://developers.google.com/gmail/api

[참고1]: https://www.youtube.com/playlist?list=PLRx0vPvlEmdAZv_okJzox5wj2gG_fNh_6
[참고2]: https://www.youtube.com/playlist?list=PLRx0vPvlEmdAdWCQeUPnyMZ4PsW3dGuFB

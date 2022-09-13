# 필름 Feelm

> 영화 커뮤니티 웹 프로젝트

![feelm_cover](https://user-images.githubusercontent.com/68595933/112328623-dd270780-8cf9-11eb-9a97-b486ecd6bcf3.PNG)

![feelm_1](https://user-images.githubusercontent.com/68595933/189870065-7a33395c-8a19-4b12-a92d-fc085828bb8e.PNG)

## 시작

- 영화 커뮤니티 프로젝트입니다.
- [시연영상 바로가기][유튜브]

---

## 개발

### 기간

- 20.08.04.~20.09.05.

### 목표

- JSP Model1 이해하기.
- 반응형으로 만들기.

### 사용

- HTML/CSS
- JavaScript
- Java 8
- jQuery 3.5
- Bootstrap 3
- MySQL 5.6
- Tomcat 8.5
- GitHub

---

## 기능

### 지도

![map](https://user-images.githubusercontent.com/68595933/189836242-5b3aed24-a5b2-4b7b-aeba-35ffe9b14c4e.png)

- [KakaoMaps API][지도 api]를 이용해 지도에 특정 위치를 표시합니다.

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

### 주간 박스오피스 순위

![box_office](https://user-images.githubusercontent.com/68595933/189843111-8d92988f-386f-4769-978d-6a756263a109.png)

- [영화진흥위원회 OPEN API][영화 api]를 이용해 주간 박스오피스 순위를 받아옵니다.

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

### 인증

![login_logout](https://user-images.githubusercontent.com/68595933/189851704-a27ed709-2e7a-4ee2-9b41-2593d75679f6.png)

- ID와 비밀번호의 유효성을 검사 후 로그인합니다.

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

- 유효성 검사 후 회원가입을 진행합니다.

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

- 이메일 인증을 진행하면 회원등급이 준회원에서 정회원으로 변경됩니다.
- 이메일 인증을 진행하지 않으면 준회원으로 남으며, 게시판 접근이 제한됩니다.

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
	if (rightCode == true) { // 메일 인증 확인되면 회원가입 수행
		userDAO.setUserEmailChecked(userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('인증이 완료되었습니다.')");
		script.println("location.href = '../index.jsp'");
		script.println("</script>");
		script.close();		
		// return;
	} else { // 메일 인증 실패하면 회원가입 불가
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

- 회원정보 수정(비밀번호, 전화번호)
- 회원탈퇴(비밀번호 재확인)
- [기능 이름][요약]를 이용해 ~를 받아옵니다.

  ![withdrawal](https://user-images.githubusercontent.com/68595933/189850244-ffb7f5ae-856b-4eec-bb2c-1f6c79c44e5a.PNG)

```java

```
```javascript

```

### 게시판

- crud
- [기능 이름][요약]를 이용해 ~를 받아옵니다.

  ![review](https://user-images.githubusercontent.com/68595933/189850663-30281a18-c80c-438e-b194-e91e4bd276ea.PNG)

```java

```

- 공감/게시글 정렬/페이징
- [기능 이름][요약]를 이용해 ~를 받아옵니다.

  ![arrange](https://user-images.githubusercontent.com/68595933/189850775-ba4b6f65-5bd8-4fde-b65b-c285b6ef1581.PNG)

```java

```

- 카테고리별 필터링/검색
- [기능 이름][요약]를 이용해 ~를 받아옵니다.

  ![category](https://user-images.githubusercontent.com/68595933/189852394-3c6ea5d0-0788-48ad-b6a2-a4a91647fd37.png)

```java

```

- 신고(구글이메일 api)
- [기능 이름][요약]를 이용해 ~를 받아옵니다.

  ![report](https://user-images.githubusercontent.com/68595933/189850487-53a3d8d2-0b4d-4039-b8d1-55eae8c941c3.PNG)

```java

```

---

## 피드백

### 문제점

1. 로그아웃시 이름만 삭제되고 할 일 목록은 남아있음.
2. 할 일 수정 불가.

### 개선점

1. 로그아웃시 이름과 할 일 목록을 함께 삭제할 것.
2. 수정 기능 추가.

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

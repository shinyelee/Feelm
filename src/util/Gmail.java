package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator { // SMTP를 이용해 이메일 인증 메세지 전송 관련 클래스
// Authenticator ctl+shift -> enter(javax.mail 선택)
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("구글아이디", "구글비밀번호"); // 각 구글ID, 구글Password 입력
	}
}

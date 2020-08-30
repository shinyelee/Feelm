package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator { // SMTP로 이메일 인증을 수행하는 클래스 상속
// Authenticator ctl+shift -> enter(javax.mail 선택)
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("구글아이디", "구글비밀번호"); // "구글ID", "구글Password" 입력
	}
}
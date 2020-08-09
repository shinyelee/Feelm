package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator { // SMTP를 이용해 이메일 인증 메세지 전송 관련 클래스
	// alt+shift+s ->
	@Override
	protected PasswordAuthentication get PasswordAuthentication() {
		return new PasswordAuthenticatation("이메일ID", "이메일Password");
	}
}

package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator { // SMTP�� �̿��� �̸��� ���� �޼��� ���� ���� Ŭ����
	// alt+shift+s ->
	@Override
	protected PasswordAuthentication get PasswordAuthentication() {
		return new PasswordAuthenticatation("�̸���ID", "�̸���Password");
	}
}

package util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator { // SMTP�� �̸��� ������ �����ϴ� Ŭ���� ���
// Authenticator ctl+shift -> enter(javax.mail ����)
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("���۾��̵�", "���ۺ�й�ȣ"); // "����ID", "����Password" �Է�
	}
}
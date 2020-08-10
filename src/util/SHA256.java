package util;

import java.security.MessageDigest;

public class SHA256 { // ȸ�����԰� �̸��� ������ ����� �ؽ� �����͸� �����ϴ� Ŭ����

	public static String getSHA256(String input) { // �ؽ� �� ���ϴ� �Լ�
		StringBuffer result = new StringBuffer();
		try { // ����ڰ� �Է��� ���� �˰����� ������ �ݿ�
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			// ��ŷ�� �����ϱ� ���� salt�� �ݿ�
			byte[] salt = "Hello! This is Salt.".getBytes();
			digest.reset();
			digest.update(salt); // �ؽ� ������ �� chars�� �����
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			for(int i = 0; i < chars.length; i++) { // ���ڿ� ���·� �������
				String hex = Integer.toHexString(0xff & chars[i]);
				// ���ڸ� ���� ��� 0�� �ٿ� 16������ �������
				if(hex.length() == 1) result.append("0");
				result.append(hex); // �� ����� ��ȯ
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result.toString();
	}
	
}

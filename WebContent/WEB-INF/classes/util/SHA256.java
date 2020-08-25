package util;

import java.security.MessageDigest;

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

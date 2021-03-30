package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {

	public static Connection getConnection() { // DB 연결상태 관리
		try {
			String dbURL = "jdbc:mysql://localhost:3306/feelm?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"; // DB주소
			String dbID = "root"; // DB 아이디
			String dbPassword = "1234"; // DB 비밀번호
			Class.forName("com.mysql.jdbc.Driver"); // Driver 불러옴
			return DriverManager.getConnection(dbURL, dbID, dbPassword); // MySQL에 연결 위한 커넥션 정보
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}

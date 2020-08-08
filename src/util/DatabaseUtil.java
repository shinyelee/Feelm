package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {

	public static Connection getConnection() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/moviehere"; // DB주소
			String dbID = "root"; // DB 아이디
			String dbPassword = "1234"; // DB 비밀번호
			Class.forName("com.mysql.jdbc.Driver"); // Driver
			return DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}

package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {

	public static Connection getConnection() { // DB ������� ����
		try {
			String dbURL = "jdbc:mysql://localhost:3306/feelm?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"; // DB�ּ�
			String dbID = "root"; // DB ���̵�
			String dbPassword = "1234"; // DB ��й�ȣ
			Class.forName("com.mysql.jdbc.Driver"); // Driver �ҷ���
			return DriverManager.getConnection(dbURL, dbID, dbPassword); // MySQL�� ���� ���� Ŀ�ؼ� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}

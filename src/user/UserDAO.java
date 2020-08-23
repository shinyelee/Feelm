package user;
// DAO(Data Access Object): �����ͺ��̽��� ���� ������ ������ ó��
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	
	public int login(String userID, String userPassword) { // �α��� �õ� �Լ�
		String SQL = "select userPassword from user where userID = ?";
		Connection conn = null; // �ڹٿ� DB ����
		PreparedStatement pstmt = null; // Ư���� SQL�� �����ϵ��� �ϴ� Ŭ���� 
		ResultSet rs = null; // SQL�� ���� �� ���� ����� ó��(?�� ������ ����)
		try {
			conn = DatabaseUtil.getConnection(); // DatabaseUtil ���� Connection ��ü �ʱ�ȭ
			pstmt = conn.prepareStatement(SQL); // SQL�� ���� �غ�
			pstmt.setString(1, userID); // ù��° ?�� userID ����
			rs = pstmt.executeQuery(); // ������ ����(������ �˻�) �� ����� rs�� ���夤��
			if (rs.next()) { // SQL�� ���� ��� userID�� DB�� �����ϰ�
				if(rs.getString(1).equals(userPassword)) {// userPassword���� DB �� ������ ��ġ�ϸ�
					return 1; // �α��� ����
				} else { // userPassword�� DB �� ������ ����ġ�ϸ�
					return 0; // ��й�ȣ ����ġ -> �α��� ����
				}
			}
			return -1; // userID�� DB�� ������(����ġ) -> �α��� ����
		} catch (Exception e) { // ���� �߻��ϸ�
			e.printStackTrace(); // ���� ���
		} finally { // conn, pstmt, rs �ڿ� ����
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -2; // DB �����ְų� ���� �߻� -> �α��� ����
	}
	
/*	
	public int delete(String userID) {
		String SQL = "delete from user where userID = ?";
		Connection conn = null; // �ڹٿ� DB ����
		PreparedStatement pstmt = null; // Ư���� SQL�� �����ϵ��� �ϴ� Ŭ���� 
		ResultSet rs = null; // SQL�� ���� �� ���� ����� ó��(?�� ������ ����)
		try {
			conn = DatabaseUtil.getConnection(); // DatabaseUtil ���� Connection ��ü �ʱ�ȭ
			pstmt = conn.prepareStatement(SQL); // SQL�� ���� �غ�
			pstmt.setString(1, userID); //  userID ����
			return pstmt.executeUpdate(); // Ż��
		} catch (Exception e) { // ���� �߻��ϸ�
			e.printStackTrace(); // ���� ���
		} finally { // conn, pstmt, rs �ڿ� ����
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // DB �����ְų� ���� �߻� -> Ż�� ����
	}
*/		
	public int join(UserDTO user) { // ȸ������ �����ϴ� �Լ�
		String SQL = "insert into user values (?, ?, ?, ?, ?, false)"; // �̸���üũ ����
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID()); // ?1 (���̵�)
			pstmt.setString(2, user.getUserPassword()); // ?2 (��й�ȣ)
			pstmt.setString(3, user.getUserPhone()); // ?3 (�޴���ȭ)
			pstmt.setString(4, user.getUserEmail()); // ?4 (�̸���)
			pstmt.setString(5, user.getUserEmailHash()); // ?5 (�̸����ؽ�)
			return pstmt.executeUpdate(); // ������ ����(������ ����or����) �� ����� rs�� ���夤��
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // ȸ������ ����
	}
	
	public int update(String userID, String userPassword, String userPhone, String userEmail) { // ȸ������ �����ϴ� �Լ�
		String SQL = "update user set userPassword = ?, userPhone = ?, userEmail = ? where userID = ?"; // ���� ������ �׸� ǥ��
		Connection conn = null;
		PreparedStatement pstmt = null;
		// ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userPassword);
			pstmt.setString(2, userPhone);
			pstmt.setString(3, userEmail);
			pstmt.setString(4, userID);
			return pstmt.executeUpdate(); // ������ ����(������ ����or����) �� ����� rs�� ���夤��
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			/* try {
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			} */
		}
		return -1; // DB ����
	}

	public UserDTO getUser(String userID) { // ȸ������ �������� �Լ�
		UserDTO user = new UserDTO();
		String SQL = "select * from user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery(); // select�� Query, insert�� delete�� Update
			if (rs.next()) {
				user.setUserID(userID);
				user.setUserPassword(rs.getString("userPassword"));
				user.setUserPhone(rs.getString("userPhone"));
				user.setUserEmail(rs.getString("userEmail"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return user;
	}
	
	public String getUserEmail(String userID) { // ���̵� -> �̸��� ��ȯ
		String SQL = "select userEmail from user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery(); // select�� Query, insert�� delete�� Update
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null; // DB ����
	}
	
	public boolean getUserEmailChecked(String userID) { // �̸��� �������� Ȯ�� �Լ�
		String SQL = "select userEmailChecked from user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getBoolean(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false; // DB ����
	}
	
	public boolean setUserEmailChecked(String userID) { // Ư�� ���� �̸��� ���� ���� �Լ�
		String SQL = "update user set userEmailChecked = true where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL ����
			pstmt.setString(1, userID); // ? (���̵�)
			pstmt.executeUpdate();
            return true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false; // DB ����
	}
}

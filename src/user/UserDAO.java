package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	
	public int login(String userID, String userPassword) { // 로그인 시도 함수
		String SQL = "select userPassword from user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL 세팅
			pstmt.setString(1, userID); // 첫번째 ?에 userID 대입
			rs = pstmt.executeQuery(); // 쿼리문 실행, 결과값 저장ㄴㄱ
			if (rs.next()) { // userID DB에 있고
				if(rs.getString(1).equals(userPassword)) {// userPassword 일치하면
					return 1; // 로그인 성공
				} else { // userPassword 불일치하면
					return 0; // 로그인 실패
				}
			}
			return -1; // userID 불일치하면 -> 로그인 실패
		} catch (Exception e) { // 오류 출력
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
		return -2; // DB 꺼져있거나 오류 발생 -> 로그인 실패
	}
	
	public int join(UserDTO user) { // 회원가입 수행하는 함수
		String SQL = "insert into user values (?, ?, ?, ?, ?, false)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL 세팅
			pstmt.setString(1, user.getUserID()); // ?1 (아이디)
			pstmt.setString(2, user.getUserPassword()); // ?2 (비밀번호)
			pstmt.setString(3, user.getUserName()); // ?3 (이름)
			pstmt.setString(4, user.getUserGender()); // ?4 (성별)
			pstmt.setString(5, user.getUserEmail()); // ?5 (이메일)
			pstmt.setString(6, user.getUserEmailHash()); // false (이메일해시)
			return pstmt.executeUpdate(); // 해당 statement를 실행한 결과를 반환
		} catch (Exception e) { // 오류 출력
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
		return -1; // 회원가입 실패
	}
	
	public String getUserEmail(String userID) { // 아이디값 -> 이메일 반환
		String SQL = "update user set userEmail from where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL 세팅
			pstmt.setString(1, userID); // ? (아이디)
			rs = pstmt.executeQuery();
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
		return null; // 데이터베이스 오류
	}
	
	public boolean getUserEmailChecked(String userID) { // 이메일 인증여부 확인 함수
		String SQL = "select userEmailChecked from user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL 세팅
			pstmt.setString(1, userID); // ? (아이디)
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
		return false; // 데이터베이스 오류
	}
	
	public boolean setUserEmailChecked(String userID) { // 특정 유저 이메일 인증 수행 함수
		String SQL = "update user set userEmailChecked = true where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL); // SQL 세팅
			pstmt.setString(1, userID); // ? (아이디)
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
		return false; // 데이터베이스 오류
	}
}

package user;
// DAO(Data Access Object): 데이터베이스에 직접 접근해 데이터 처리
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class UserDAO {
	
	public int login(String userID, String userPassword) { // 로그인 시도 함수
		String SQL = "select userPassword from user where userID = ?";
		Connection conn = null; // 자바와 DB 연결
		PreparedStatement pstmt = null; // 특정한 SQL문 수행하도록 하는 클래스 
		ResultSet rs = null; // SQL문 수행 후 나온 결과값 처리(?에 데이터 대입)
		try {
			conn = DatabaseUtil.getConnection(); // DatabaseUtil 통해 Connection 객체 초기화
			pstmt = conn.prepareStatement(SQL); // SQL문 실행 준비
			pstmt.setString(1, userID); // 첫번째 ?에 userID 대입
			rs = pstmt.executeQuery(); // 쿼리문 실행(데이터 검색) 후 결과값 rs에 저장ㄴㄱ
			if (rs.next()) { // SQL문 실행 결과 userID가 DB에 존재하고
				if(rs.getString(1).equals(userPassword)) {// userPassword까지 DB 내 정보와 일치하면
					return 1; // 로그인 성공
				} else { // userPassword가 DB 내 정보와 불일치하면
					return 0; // 로그인 실패
				}
			}
			return -1; // userID가 DB에 없으면(불일치) -> 로그인 실패
		} catch (Exception e) { // 예외 발생하면
			e.printStackTrace(); // 오류 출력
		} finally { // conn, pstmt, rs 자원 해제
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
		String SQL = "insert into user values (?, ?, ?, ?, false)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID()); // ?1 (아이디)
			pstmt.setString(2, user.getUserPassword()); // ?2 (비밀번호)
			pstmt.setString(3, user.getUserEmail()); // ?3 (이메일)
			pstmt.setString(4, user.getUserEmailHash()); // ?4 (이메일해시)
			return pstmt.executeUpdate(); // 쿼리문 실행(데이터 삽입or삭제) 후 결과값 rs에 저장ㄴㄱ
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
		return -1; // 회원가입 실패
	}
	
	public String getUserEmail(String userID) { // 아이디값 -> 이메일 반환
		String SQL = "select userEmail from user where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery(); // select는 Query, insert나 delete는 Update
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
		return null; // DB 오류
	}
	
	public boolean getUserEmailChecked(String userID) { // 이메일 인증여부 확인 함수
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
		return false; // DB 오류
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
		return false; // DB 오류
	}
}

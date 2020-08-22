package likey;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class LikeyDAO {

	public int like(String userID, String reviewID, String userIP) {
		String SQL = "insert into likey values (?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID); // ?1 (아이디)
			pstmt.setString(2, reviewID); // ?2 (리뷰번호)
			pstmt.setString(3, userIP); // ?3 (아이피)
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
		return -1; // 추천 중복 오류
	}
}

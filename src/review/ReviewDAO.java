package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

// UserDAO에서 일부 복붙 후 수정
public class ReviewDAO {
	
	public int write(ReviewDTO reviewDTO) { // 글쓰기 함수
		String SQL = "insert into review values (null, ?, ?, ?, ?, ?, ?, 0)"; // DB와 DTO 순서에 맞춤
		Connection conn = null; // 자바와 DB 연결
		PreparedStatement pstmt = null; // 특정한 SQL문 수행하도록 하는 클래스 
		ResultSet rs = null; // SQL문 수행 후 나온 결과값 처리(?에 데이터 대입)
		try {
			conn = DatabaseUtil.getConnection(); // DatabaseUtil 통해 Connection 객체 초기화
			pstmt = conn.prepareStatement(SQL); // SQL문 실행 준비
			// reviewID와 likeCount 제외 -> ? 6개
			pstmt.setString(1, reviewDTO.getUserID()); // ?에 아이디 대입
			pstmt.setString(2, reviewDTO.getMovieTitle()); // ?에 영화제목 대입
			pstmt.setString(3, reviewDTO.getShortReview()); // ?에 한줄리뷰 대입
			pstmt.setString(4, reviewDTO.getFullReview()); // ?에 장문리뷰 대입
			pstmt.setString(5, reviewDTO.getMovieScore()); // ?에 리뷰별점 대입
			pstmt.setString(6, reviewDTO.getReviewDate()); // ?에 리뷰날짜 대입
			return pstmt.executeUpdate();
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
		return -1; // DB 꺼져있거나 오류
	}
}

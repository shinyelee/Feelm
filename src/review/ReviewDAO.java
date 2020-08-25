package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;
// UserDAO에서 일부 복붙 후 수정
public class ReviewDAO {
	private Connection conn; // 문제시 코드 삭제
	
	public int write(ReviewDTO reviewDTO) { // 글쓰기 함수
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String SQL = "insert into review values (null, ?, ?, ?, ?, ?, ?, ?, 0);"; // null은 reviewID, 0은likey
			conn = DatabaseUtil.getConnection(); // DatabaseUtil 통해 Connection 객체 초기화
			pstmt = conn.prepareStatement(SQL); // SQL문 실행 준비
			// reviewID와 likeCount 제외 -> ? 6개
			pstmt.setString(1, reviewDTO.getUserID()); // ?에 아이디 대입
			pstmt.setString(2, reviewDTO.getMovieTitle()); // ?에 영화제목 대입
			pstmt.setString(3, reviewDTO.getMovieGenre()); // ?에 한줄리뷰 대입
			pstmt.setString(4, reviewDTO.getShortReview()); // ?에 한줄리뷰 대입
			pstmt.setString(5, reviewDTO.getFullReview()); // ?에 장문리뷰 대입
			pstmt.setString(6, reviewDTO.getMovieScore()); // ?에 리뷰별점 대입
			pstmt.setString(7, reviewDTO.getReviewDate()); // ?에 리뷰날짜 대입
			return pstmt.executeUpdate();
		} catch (Exception e) { // 예외 발생하면
			e.printStackTrace(); // 오류 출력
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // DB 꺼져있거나 오류
	}
	
	public ArrayList<ReviewDTO> getList (String movieGenre, String searchType, String search, int pageNumber) {
		if(movieGenre.equals("전체")) { // 리뷰 리스트 보여주는 함수
			movieGenre = "";
		}
		ArrayList<ReviewDTO> reviewList = null; // 리뷰리스트 생성
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if(searchType.equals("최신순")) { // 리뷰 최신순으로 출력
				SQL = "select * from review where movieGenre like ? and concat(userID, movieTitle, shortReview, fullReview) like "
						+ "? order by reviewID desc limit " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			} else if (searchType.equals("공감순")) { // 리뷰 공감순으로 출력
				SQL = "select * from review where movieGenre like ? and concat(userID, movieTitle, shortReview, fullReview) like "
						+ "? order by likeCount desc limit " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			}
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + movieGenre + "%");
			pstmt.setString(2, "%" + search + "%");
			rs = pstmt.executeQuery();
			reviewList = new ArrayList<ReviewDTO>();
			while (rs.next()) {
				ReviewDTO review = new ReviewDTO(
					rs.getInt(1), // reviewID
					rs.getString(2), // userID
					rs.getString(3), // movieTitle
					rs.getString(4), // movieGenre
					rs.getString(5), // shortReview
					rs.getString(6), // fullReview
					rs.getString(7), // movieScore
					rs.getString(8), // reviewDate
					rs.getInt(9) // likeCount
				);
				reviewList.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return reviewList;
	}
	
	public int like(String reviewID) { // 리뷰에 공감 적용하는 함수
		String SQL = "update review set likeCount = likeCount + 1 where reviewID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(reviewID));
            return pstmt.executeUpdate(); // 공감
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
		return -1; // DB 오류
	}
	
/*	public ReviewDTO getReview(String reviewID) { // 글 하나 내용 불러오는 함수
		ReviewDTO review = new ReviewDTO();
		String SQL = "select * from review where reviewID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(reviewID));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				review.setReviewID(rs.getInt("reviewID"));
				review.setUserID(rs.getString("userID"));
				review.setMovieTitle(rs.getString("movieTitle"));
				review.setMovieGenre(rs.getString("movieGenre"));
				review.setShortReview(rs.getString("shortReview"));
				review.setFullReview(rs.getString("fullReview"));
				review.setMovieScore(rs.getString("movieScore"));
				review.setReviewDate(rs.getString("reviewDate"));
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
		return review;
	}	*/
	
	public int update(int reviewID, String userID, String movieTitle, String movieGenre, String shortReview, String fullReview, String movieScore, String reviewDate) { // 리뷰 수정하는 함수
		String SQL = "update review set String userID = ?, String movieTitle = ?, String movieGenre = ?, String shortReview = ?, String fullReview = ?, String movieScore = ?, String reviewDate = ? where reviewID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setString(2, movieTitle);
			pstmt.setString(3, movieGenre);
			pstmt.setString(4, shortReview);
			pstmt.setString(5, fullReview);
			pstmt.setString(6, movieScore);
			pstmt.setString(7, reviewDate);
			pstmt.setInt(8, reviewID);
            return pstmt.executeUpdate(); // 삭제
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
		return -1; // DB 오류
	}
	
	public int delete(String reviewID) { // 리뷰 삭제하는 함수
		String SQL = "delete from review where reviewID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(reviewID));
            return pstmt.executeUpdate(); // 삭제
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
		return -1; // DB 오류
	}
	
	public String getUserID(String reviewID) { // 사용자 아이디 가져오는 함수
		String SQL = "select userID from review where reviewID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(reviewID));
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1); // 아이디 존재O
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
		return null; // 아이디 존재X
	}
}
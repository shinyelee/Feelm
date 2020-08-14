package review;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import util.ArrayList;
//import util.DatabaseUtil;

// UserDAO에서 일부 복붙 후 수정
public class ReviewDAO {
	
	private Connection conn; // 자바와 DB 연결
	private ResultSet rs; // SQL문 수행 후 나온 결과값 처리(?에 데이터 대입)
	
	public ReviewDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/moviehere";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int write(ReviewDTO reviewDTO) { // 글쓰기 함수
		PreparedStatement pstmt = null; // 특정한 SQL문 수행하도록 하는 클래스 
		try {
			String SQL = "insert into review values (null, ?, ?, ?, ?, ?, ?, ?, 0)"; // null은 reviewID, 0은likey
			//conn = DatabaseUtil.getConnection(); // DatabaseUtil 통해 Connection 객체 초기화
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
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // DB 꺼져있거나 오류
	}
	
/*	public ArrayList<ReviewDTO> getList (String reviewDivide, String searchType, String search, int pageNumber) {
		if(reviewDivide.equals("전체")) {
			reviewDivide = "";
		}
		ArrayList<ReviewDTO> reviewList = null; // 
			String SQL = "";
			Connection conn = null; // 
			PreparedStatement pstmt = null; // 
			ResultSet rs = null; // 
			try {
				if(searchType.equals("최신순")) {
					SQL = "select * from review where reviewDivide like ? and concat(userID, movieTitle, shortReview, fullReview) like "
							+ "? order by reviewID desc limit" + pageNumber * 5 + ", " + pageNumber * 5 + 6;
				} else if (searchType.equals("추천순")) {
					SQL = "select * from review where reviewDivide like ? and concat(userID, movieTitle, shortReview, fullReview) like "
							+ "? order by likeCount desc limit" + pageNumber * 5 + ", " + pageNumber * 5 + 6;
				}
				conn = DatabaseUtil.getConnection(); // 
				pstmt = conn.prepareStatement(SQL); // 
				pstmt.setString(1, "%" + reviewDivide + "%"); // 
				pstmt.setString(2, "%" + reviewDivide + "%"); // 
				rs = pstmt.executeQuery(); // 
				reviewList = new ArrayList<ReviewDTO>();
				while (rs.next()) { // SQL
					ReviewDTO review = new ReviewDTO(
						rs.getInt(1), // 
						rs.getString(2), // 
						rs.getString(3), // 
						rs.getString(4), // 
						rs.getString(5), // 
						rs.getString(6), // 
						rs.getString(7), // 
						rs.getString(8), //
						rs.getInt(9), // 
					);
					reviewList.add(review);
				}
			} catch (Exception e) { // 
				e.printStackTrace(); // 
			} finally { // conn, pstmt, rs
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
			return reviewList;
		}
	} */
}

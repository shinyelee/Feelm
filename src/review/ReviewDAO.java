package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;
// UserDAO���� �Ϻ� ���� �� ����
public class ReviewDAO {
	private Connection conn; // ������ �ڵ� ����
	
	public int write(ReviewDTO reviewDTO) { // �۾��� �Լ�
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String SQL = "insert into review values (null, ?, ?, ?, ?, ?, ?, ?, 0);"; // null�� reviewID, 0��likey
			conn = DatabaseUtil.getConnection(); // DatabaseUtil ���� Connection ��ü �ʱ�ȭ
			pstmt = conn.prepareStatement(SQL); // SQL�� ���� �غ�
			// reviewID�� likeCount ���� -> ? 6��
			pstmt.setString(1, reviewDTO.getUserID()); // ?�� ���̵� ����
			pstmt.setString(2, reviewDTO.getMovieTitle()); // ?�� ��ȭ���� ����
			pstmt.setString(3, reviewDTO.getMovieGenre()); // ?�� ���ٸ��� ����
			pstmt.setString(4, reviewDTO.getShortReview()); // ?�� ���ٸ��� ����
			pstmt.setString(5, reviewDTO.getFullReview()); // ?�� �幮���� ����
			pstmt.setString(6, reviewDTO.getMovieScore()); // ?�� ���亰�� ����
			pstmt.setString(7, reviewDTO.getReviewDate()); // ?�� ���䳯¥ ����
			return pstmt.executeUpdate();
		} catch (Exception e) { // ���� �߻��ϸ�
			e.printStackTrace(); // ���� ���
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
		return -1; // DB �����ְų� ����
	}
	
	public ArrayList<ReviewDTO> getList (String movieGenre, String searchType, String search, int pageNumber) {
		if(movieGenre.equals("��ü")) { // ���� ����Ʈ �����ִ� �Լ�
			movieGenre = "";
		}
		ArrayList<ReviewDTO> reviewList = null; // ���丮��Ʈ ����
		String SQL = "";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			if(searchType.equals("�ֽż�")) { // ���� �ֽż����� ���
				SQL = "select * from review where movieGenre like ? and concat(userID, movieTitle, shortReview, fullReview) like "
						+ "? order by reviewID desc limit " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			} else if (searchType.equals("������")) { // ���� ���������� ���
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
	
	public int like(String reviewID) { // ���信 ���� �����ϴ� �Լ�
		String SQL = "update review set likeCount = likeCount + 1 where reviewID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(reviewID));
            return pstmt.executeUpdate(); // ����
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
		return -1; // DB ����
	}
	
/*	public ReviewDTO getReview(String reviewID) { // �� �ϳ� ���� �ҷ����� �Լ�
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
	
	public int update(int reviewID, String userID, String movieTitle, String movieGenre, String shortReview, String fullReview, String movieScore, String reviewDate) { // ���� �����ϴ� �Լ�
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
            return pstmt.executeUpdate(); // ����
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
		return -1; // DB ����
	}
	
	public int delete(String reviewID) { // ���� �����ϴ� �Լ�
		String SQL = "delete from review where reviewID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(reviewID));
            return pstmt.executeUpdate(); // ����
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
		return -1; // DB ����
	}
	
	public String getUserID(String reviewID) { // ����� ���̵� �������� �Լ�
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
				return rs.getString(1); // ���̵� ����O
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
		return null; // ���̵� ����X
	}
}
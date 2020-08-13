package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

// UserDAO���� �Ϻ� ���� �� ����
public class ReviewDAO {
	
	public int write(ReviewDTO reviewDTO) { // �۾��� �Լ�
		String SQL = "insert into review values (null, ?, ?, ?, ?, ?, ?, ?, 0)"; // null�� reviewID, 0��likey
		Connection conn = null; // �ڹٿ� DB ����
		PreparedStatement pstmt = null; // Ư���� SQL�� �����ϵ��� �ϴ� Ŭ���� 
		ResultSet rs = null; // SQL�� ���� �� ���� ����� ó��(?�� ������ ����)
		try {
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
		return -1; // DB �����ְų� ����
	}
	
/*	public ArrayList<ReviewDTO> getList (String reviewDivide, String searchType, String search, int pageNumber) {
		if(reviewDivide.equals("��ü")) {
			reviewDivide = "";
		}
		ArrayList<ReviewDTO> reviewList = null; // 
			String SQL = "";
			Connection conn = null; // 
			PreparedStatement pstmt = null; // 
			ResultSet rs = null; // 
			try {
				if(searchType.equals("�ֽż�")) {
					SQL = "select * from review where reviewDivide like ? and concat(userID, movieTitle, shortReview, fullReview) like "
							+ "? order by reviewID desc limit" + pageNumber * 5 + ", " + pageNumber * 5 + 6;
				} else if (searchType.equals("��õ��")) {
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

package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

// UserDAO���� �Ϻ� ���� �� ����
public class ReviewDAO {
	
	public int write(ReviewDTO reviewDTO) { // �۾��� �Լ�
		String SQL = "insert into review values (null, ?, ?, ?, ?, ?, ?, 0)"; // DB�� DTO ������ ����
		Connection conn = null; // �ڹٿ� DB ����
		PreparedStatement pstmt = null; // Ư���� SQL�� �����ϵ��� �ϴ� Ŭ���� 
		ResultSet rs = null; // SQL�� ���� �� ���� ����� ó��(?�� ������ ����)
		try {
			conn = DatabaseUtil.getConnection(); // DatabaseUtil ���� Connection ��ü �ʱ�ȭ
			pstmt = conn.prepareStatement(SQL); // SQL�� ���� �غ�
			// reviewID�� likeCount ���� -> ? 6��
			pstmt.setString(1, reviewDTO.getUserID()); // ?�� ���̵� ����
			pstmt.setString(2, reviewDTO.getMovieTitle()); // ?�� ��ȭ���� ����
			pstmt.setString(3, reviewDTO.getShortReview()); // ?�� ���ٸ��� ����
			pstmt.setString(4, reviewDTO.getFullReview()); // ?�� �幮���� ����
			pstmt.setString(5, reviewDTO.getMovieScore()); // ?�� ���亰�� ����
			pstmt.setString(6, reviewDTO.getReviewDate()); // ?�� ���䳯¥ ����
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
}

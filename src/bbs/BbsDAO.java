package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	// * 이 파일은 이 아래로 UserDAO.java를 일부 수정해 만들었음
	private Connection conn;
	// PrivatePreparedStatement rs; // 삭제
	private ResultSet rs;
	
	public BbsDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/moviehere";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() { // 현재 시간(서버 시간)을 가져오는 함수
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL문 실행 준비단계로 만듦
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1); // 현재 날짜 반환
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}
	
	public int getNext() { // 게시글 번호를 가져오는 함수
		String SQL = "select bbsID from bbs order by bbsID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL문 실행 준비단계로 만듦
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1)+1; // 게시글 번호 반환
			}
			return 1; // 첫 번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) { // 게시글 작성하는 함수
		String SQL = "insert into bbs values (?, ?, ?, ?, ?, ?)"; // ? 12개 -> 6개로 줄임
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL문 실행 준비단계로 만듦
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1); // bbsAvailable
		/*	pstmt.setInt(7, 0); // bbsReadcount
			pstmt.setInt(8, num); // bbsRef
			pstmt.setInt(9, 0); // bbsLev
			pstmt.setInt(10, 0); // bbsSeq
			pstmt.setString(11, bbsFile);
			pstmt.setString(12, bbsIp);	*/
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public ArrayList<Bbs> getList(int pageNumber) { // 페이징 처리
		String SQL = "select * from bbs where bbsID < ? and bbsAvailable = 1 order by bbsID desc limit 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10); // 한 페이지에 글 10개씩 출력
			rs = pstmt.executeQuery();
			while (rs.next()) { // 게시글에 출력할 데이터
				Bbs bbs = new Bbs(); // ? 6개임
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean nextPage(int pageNumber) { // 10개 단위로 딱 떨어지면 다음 페이지 만들지 않음
		String SQL = "select * from bbs where bbsID < ? and bbsAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10); // 한 페이지에 글 10개씩 출력
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Bbs getBbs(int bbsID) { // 글 하나 내용 불러오는 함수
		String SQL = "select * from bbs where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID); // 
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs(); // ? 6개임
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null; // 해당 글 존재하지 않으면 null 반환
	}
	
	public int update(int bbsID, String bbsTitle, String bbsContent) { // 수정할 글 불러오기
		String SQL = "update bbs set bbsTitle = ?, bbsContent = ? where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int delete(int bbsID) {
		String SQL = "update bbs set bbsAvailable = 0 where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); 
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
}
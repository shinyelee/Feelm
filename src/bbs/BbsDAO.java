package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BbsDAO {
	// * �� ������ �� �Ʒ��� UserDAO.java�� �Ϻ� ������ �������
	private Connection conn;
	// PrivatePreparedStatement rs; // ����
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
	
	public String getDate() { // ���� �ð�(���� �ð�)�� �������� �Լ�
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL�� ���� �غ�ܰ�� ����
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1); // ���� ��¥ ��ȯ
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // �����ͺ��̽� ����
	}
	
	public int getNext() { // �Խñ� ��ȣ�� �������� �Լ�
		String SQL = "select bbsID from bbs order by bbsID desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL�� ���� �غ�ܰ�� ����
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1)+1; // �Խñ� ��ȣ ��ȯ
			}
			return 1; // ù ��° �Խù��� ���
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	public int write(String bbsTitle, String userID, String bbsContent) { // �Խñ� �ۼ��ϴ� �Լ�
		String SQL = "insert into bbs values (?, ?, ?, ?, ?, ?)"; // ? 12�� -> 6���� ����
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); // SQL�� ���� �غ�ܰ�� ����
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
		return -1; // �����ͺ��̽� ����
	}
	
	public ArrayList<Bbs> getList(int pageNumber) { // ����¡ ó��
		String SQL = "select * from bbs where bbsID < ? and bbsAvailable = 1 order by bbsID desc limit 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10); // �� �������� �� 10���� ���
			rs = pstmt.executeQuery();
			while (rs.next()) { // �Խñۿ� ����� ������
				Bbs bbs = new Bbs(); // ? 6����
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
	public boolean nextPage(int pageNumber) { // 10�� ������ �� �������� ���� ������ ������ ����
		String SQL = "select * from bbs where bbsID < ? and bbsAvailable = 1";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10); // �� �������� �� 10���� ���
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public Bbs getBbs(int bbsID) { // �� �ϳ� ���� �ҷ����� �Լ�
		String SQL = "select * from bbs where bbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID); // 
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Bbs bbs = new Bbs(); // ? 6����
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
		return null; // �ش� �� �������� ������ null ��ȯ
	}
	
	public int update(int bbsID, String bbsTitle, String bbsContent) { // ������ �� �ҷ�����
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
		return -1; // �����ͺ��̽� ����
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
		return -1; // �����ͺ��̽� ����
	}
	
}
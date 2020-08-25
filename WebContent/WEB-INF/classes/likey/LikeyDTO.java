package likey;

public class LikeyDTO {

	String userID;
	int reviewID;
	String userIP;
	
	// alt+shift+s -> r -> Select All -> OK
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getReviewID() {
		return reviewID;
	}
	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}
	public String getUserIP() {
		return userIP;
	}
	public void setUserIP(String userIP) {
		this.userIP = userIP;
	}
	
	public LikeyDTO() { // �� ������
	}
	
	// alt+shift+s -> o -> OK
	public LikeyDTO(String userID, int reviewID, String userIP) { // ���� �ʱ�ȭ
		super();
		this.userID = userID;
		this.reviewID = reviewID;
		this.userIP = userIP;
	}

}

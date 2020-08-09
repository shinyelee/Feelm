package user;
// DTO(Data Transfer Object): JSP와 MySQL이 서로 데이터를 전달하는 단위(≒자바빈즈)
public class UserDTO {
	// DB와 동일한 순서로 작성
	// 멤버변수는 private, getter(), setter()
	// 정보은닉화 위해 private 사용
	private String userID;
	private String userPassword;
	private String userName;
	private String userGender;
	private String userEmail;
	private String userEmailHash;
	private boolean userEmailChecked;
	// alt+shift+s -> r -> all -> OK
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserEmailHash() {
		return userEmailHash;
	}
	public void setUserEmailHash(String userEmailHash) {
		this.userEmailHash = userEmailHash;
	}
	public boolean isUserEmailChecked() {
		return userEmailChecked;
	}
	public void setUserEmailChecked(boolean userEmailChecked) {
		this.userEmailChecked = userEmailChecked;
	}
	// 생성자: 초기화O, 입력O, 출력X(반환 선언X, 리턴값 반환X) 클래스와 동일한 이름의 메소드
	// 생성자 2개 만듦 -> 유저 인스턴스 처리
	public UserDTO() {	
	}
	// alt+shift+s -> o -> OK
	public UserDTO(String userID, String userPassword, String userName, String userGender, String userEmail,
				   String userEmailHash, boolean userEmailChecked) {
		super();
		this.userID = userID;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userGender = userGender;
		this.userEmail = userEmail;
		this.userEmailHash = userEmailHash;
		this.userEmailChecked = userEmailChecked;
	}
	
	
}

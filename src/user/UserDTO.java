package user;
// DTO(Data Transfer Object): JSP�� MySQL�� ���� �����͸� �����ϴ� ����(���ڹٺ���)
public class UserDTO {
	// DB�� ������ ������ �ۼ�
	// ��������� private, getter(), setter()
	// ��������ȭ ���� private ���
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
	// ������: �ʱ�ȭO, �Է�O, ���X(��ȯ ����X, ���ϰ� ��ȯX) Ŭ������ ������ �̸��� �޼ҵ�
	// ������ 2�� ���� -> ���� �ν��Ͻ� ó��
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

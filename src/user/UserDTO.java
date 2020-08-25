package user;
// DTO(Data Transfer Object): JSP�� MySQL�� ���� �����͸� �����ϴ� ����(���ڹٺ���)
public class UserDTO {
	// DB�� ������ ������ �ۼ�
	// ��������� private, getter(), setter()
	// ��������ȭ ���� private ���
	private String userID;
	private String userPassword;
	private String userPhone;
	private String userEmail;
	private String userEmailHash;
	private boolean userEmailChecked;
	
	// alt+shift+s -> r -> Select All -> OK
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
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
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
	public UserDTO() { // �� ������
	}
	// alt+shift+s -> o -> OK
	public UserDTO(String userID, String userPassword, String userPhone, String userEmail, String userEmailHash,
			boolean userEmailChecked) {
		super();
		this.userID = userID;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userEmailHash = userEmailHash;
		this.userEmailChecked = userEmailChecked;
	}
	
}
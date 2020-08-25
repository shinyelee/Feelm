package review;
//DTO(Data Transfer Object): JSP�� MySQL�� ���� �����͸� �����ϴ� ����(���ڹٺ���)
public class ReviewDTO {
	
	int reviewID; // ���� �۹�ȣ
	String userID; // ���̵�
	String movieTitle; // ��ȭ����
	String movieGenre; // ��ȭ�帣
	String shortReview; // ���ٸ���
	String fullReview; // �幮����
	String movieScore; // ���亰��
	String reviewDate; // ������
	int likeCount; // �������
	
	// alt+shift+s -> r -> Select All -> OK	
	public int getReviewID() {
		return reviewID;
	}
	public void setReviewID(int reviewID) {
		this.reviewID = reviewID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public String getMovieGenre() {
		return movieGenre;
	}
	public void setMovieGenre(String movieGenre) {
		this.movieGenre = movieGenre;
	}
	public String getShortReview() {
		return shortReview;
	}
	public void setShortReview(String shortReview) {
		this.shortReview = shortReview;
	}
	public String getFullReview() {
		return fullReview;
	}
	public void setFullReview(String fullReview) {
		this.fullReview = fullReview;
	}
	public String getMovieScore() {
		return movieScore;
	}
	public void setMovieScore(String movieScore) {
		this.movieScore = movieScore;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	// ������: �ʱ�ȭO, �Է�O, ���X(��ȯ ����X, ���ϰ� ��ȯX) Ŭ������ ������ �̸��� �޼ҵ�
	// ������ 2�� ���� 
	public ReviewDTO() { // �� ������
	}
	// alt+shift+s -> o -> OK
	public ReviewDTO(int reviewID, String userID, String movieTitle, String movieGenre, String shortReview,
			String fullReview, String movieScore, String reviewDate, int likeCount) {
		super();
		this.reviewID = reviewID;
		this.userID = userID;
		this.movieTitle = movieTitle;
		this.movieGenre = movieGenre;
		this.shortReview = shortReview;
		this.fullReview = fullReview;
		this.movieScore = movieScore;
		this.reviewDate = reviewDate;
		this.likeCount = likeCount;
	}
}
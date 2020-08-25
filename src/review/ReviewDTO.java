package review;
//DTO(Data Transfer Object): JSP와 MySQL이 서로 데이터를 전달하는 단위(≒자바빈즈)
public class ReviewDTO {
	
	int reviewID; // 리뷰 글번호
	String userID; // 아이디
	String movieTitle; // 영화제목
	String movieGenre; // 영화장르
	String shortReview; // 한줄리뷰
	String fullReview; // 장문리뷰
	String movieScore; // 리뷰별점
	String reviewDate; // 관람일
	int likeCount; // 리뷰공감
	
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
	// 생성자: 초기화O, 입력O, 출력X(반환 선언X, 리턴값 반환X) 클래스와 동일한 이름의 메소드
	// 생성자 2개 만듦 
	public ReviewDTO() { // 빈 생성자
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
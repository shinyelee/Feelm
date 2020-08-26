package bbs;

public class Bbs {
	
	// 게시판 자바빈즈
	private int bbsID;
	private String bbsTitle;
	private String userID;
	private String bbsDate;
	private String bbsContent;
	private int bbsAvailable;
/*	private int bbsReadcount;
	private int bbsRef;
	private int bbsLev;
	private int bbsSeq;
	private String bbsFile;
	private String bbsIp;	*/
	
	// alt+shift+s -> Generate Getters and Setters -> Select All -> OK
	public int getBbsID() {
		return bbsID;
	}
	public void setBbsID(int bbsID) {
		this.bbsID = bbsID;
	}
	public String getBbsTitle() {
		return bbsTitle;
	}
	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBbsDate() {
		return bbsDate;
	}
	public void setBbsDate(String bbsDate) {
		this.bbsDate = bbsDate;
	}
	public String getBbsContent() {
		return bbsContent;
	}
	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}
	public int getBbsAvailable() {
		return bbsAvailable;
	}
	public void setBbsAvailable(int bbsAvailable) {
		this.bbsAvailable = bbsAvailable;
	}
/*	public int getBbsReadcount() {
		return bbsReadcount;
	}
	public void setBbsReadcount(int bbsReadcount) {
		this.bbsReadcount = bbsReadcount;
	}
	public int getBbsRef() {
		return bbsRef;
	}
	public void setBbsRef(int bbsRef) {
		this.bbsRef = bbsRef;
	}
	public int getBbsLev() {
		return bbsLev;
	}
	public void setBbsLev(int bbsLev) {
		this.bbsLev = bbsLev;
	}
	public int getBbsSeq() {
		return bbsSeq;
	}
	public void setBbsSeq(int bbsSeq) {
		this.bbsSeq = bbsSeq;
	}
	public String getBbsFile() {
		return bbsFile;
	}
	public void setBbsFile(String bbsFile) {
		this.bbsFile = bbsFile;
	}
	public String getBbsIp() {
		return bbsIp;
	}
	public void setBbsIp(String bbsIp) {
		this.bbsIp = bbsIp;
	}	*/

	// alt shift s + s + ok
	@Override
	public String toString() {
		return "Bbs [bbsID=" + bbsID + ", bbsTitle=" + bbsTitle + ", userID=" + userID + ", bbsDate=" + bbsDate
				+ ", bbsContent=" + bbsContent + ", bbsAvailable=" + bbsAvailable + /*", bbsReadcount=" + bbsReadcount
				+ ", bbsRef=" + bbsRef + ", bbsLev=" + bbsLev + ", bbsSeq=" + bbsSeq + ", bbsFile=" + bbsFile
				+ ", bbsIp=" + bbsIp +*/ "]";
	}
	
}

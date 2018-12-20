package entity;

public class Comment {

	private int uid;
	private int mid;
	private int score;
	private String comment;
	private String commentDate;
	private int usefulNumber;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}

	public int getUsefulNumber() {
		return usefulNumber;
	}

	public void setUsefulNumber(int usefulNumber) {
		this.usefulNumber = usefulNumber;
	}

}

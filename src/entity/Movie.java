package entity;

public class Movie {

	private int mid;
	private String mname;
	private String type;
	private String mainActors;
	private String area;
	private String director;
	private float mscore;

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMainActors() {
		return mainActors;
	}

	public void setMainActors(String mainActors) {
		this.mainActors = mainActors;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public float getMscore() {
		return mscore;
	}

	public void setMscore(float mscore) {
		this.mscore = mscore;
	}

}

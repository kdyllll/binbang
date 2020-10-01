package com.binbang.house.model.vo;

public class Review {

	private double houseGrade;
	private String commentTitle;
	private String commentContents;
	private String filePath;

	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(double houseGrade, String commentTitle, String commentContents, String filePath) {
		super();
		this.houseGrade = houseGrade;
		this.commentTitle = commentTitle;
		this.commentContents = commentContents;
		this.filePath = filePath;
	}


	
	
	public double getHouseGrade() {
		return houseGrade;
	}

	public void setHouseGrade(double houseGrade) {
		this.houseGrade = houseGrade;
	}

	public String getCommentTitle() {
		return commentTitle;
	}

	public void setCommentTitle(String commentTitle) {
		this.commentTitle = commentTitle;
	}

	public String getCommentContents() {
		return commentContents;
	}

	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	@Override
	public String toString() {
		return "Review [houseGrade=" + houseGrade + ", commentTitle=" + commentTitle + ", commentContents="
				+ commentContents + ", filePath=" + filePath + "]";
	}

	
	
	
	
	
}

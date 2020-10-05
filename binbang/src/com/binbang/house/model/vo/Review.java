package com.binbang.house.model.vo;

public class Review {

	private double houseGrade;
	private String commentTitle;
	private String commentContents;
	private String filePath;
	private String houseNo;

	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(double houseGrade, String commentTitle, String commentContents, String filePath, String houseNo) {
		super();
		this.houseGrade = houseGrade;
		this.commentTitle = commentTitle;
		this.commentContents = commentContents;
		this.filePath = filePath;
		this.houseNo = houseNo;
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

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	@Override
	public String toString() {
		return "Review [houseGrade=" + houseGrade + ", commentTitle=" + commentTitle + ", commentContents="
				+ commentContents + ", filePath=" + filePath + ", houseNo=" + houseNo + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((commentContents == null) ? 0 : commentContents.hashCode());
		result = prime * result + ((commentTitle == null) ? 0 : commentTitle.hashCode());
		result = prime * result + ((filePath == null) ? 0 : filePath.hashCode());
		long temp;
		temp = Double.doubleToLongBits(houseGrade);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((houseNo == null) ? 0 : houseNo.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Review other = (Review) obj;
		if (commentContents == null) {
			if (other.commentContents != null)
				return false;
		} else if (!commentContents.equals(other.commentContents))
			return false;
		if (commentTitle == null) {
			if (other.commentTitle != null)
				return false;
		} else if (!commentTitle.equals(other.commentTitle))
			return false;
		if (filePath == null) {
			if (other.filePath != null)
				return false;
		} else if (!filePath.equals(other.filePath))
			return false;
		if (Double.doubleToLongBits(houseGrade) != Double.doubleToLongBits(other.houseGrade))
			return false;
		if (houseNo == null) {
			if (other.houseNo != null)
				return false;
		} else if (!houseNo.equals(other.houseNo))
			return false;
		return true;
	}

	

	
	
	
	
	
}

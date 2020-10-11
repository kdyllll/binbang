package com.binbang.house.model.vo;

import java.sql.Date;

public class Review {
	private String commentNo;
	private String houseNo;
	private String memberNo;
	private double houseGrade;
	private String commentTitle;
	private String commentContents;
	private String commentDate;
	private String hostComment;
	private String hostCommentDate;
	private String filePath;
	private String houseName;
	private Date checkInDate;
	

	public Review() {
		// TODO Auto-generated constructor stub
	}


	


	public Review(String commentNo, String houseNo, String memberNo, double houseGrade, String commentTitle,
			String commentContents, String commentDate, String hostComment, String hostCommentDate, String filePath,
			String houseName) {
		super();
		this.commentNo = commentNo;
		this.houseNo = houseNo;
		this.memberNo = memberNo;
		this.houseGrade = houseGrade;
		this.commentTitle = commentTitle;
		this.commentContents = commentContents;
		this.commentDate = commentDate;
		this.hostComment = hostComment;
		this.hostCommentDate = hostCommentDate;
		this.filePath = filePath;
		this.houseName = houseName;
	}
	





	public Date getCheckInDate() {
		return checkInDate;
	}





	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}





	public String getHouseName() {
		return houseName;
	}





	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}





	public String getCommentNo() {
		return commentNo;
	}


	public void setCommentNo(String commentNo) {
		this.commentNo = commentNo;
	}


	public String getHouseNo() {
		return houseNo;
	}


	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}


	public String getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
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


	public String getCommentDate() {
		return commentDate;
	}


	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}


	public String getHostComment() {
		return hostComment;
	}


	public void setHostComment(String hostComment) {
		this.hostComment = hostComment;
	}


	public String getHostCommentDate() {
		return hostCommentDate;
	}


	public void setHostCommentDate(String hostCommentDate) {
		this.hostCommentDate = hostCommentDate;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((commentContents == null) ? 0 : commentContents.hashCode());
		result = prime * result + ((commentDate == null) ? 0 : commentDate.hashCode());
		result = prime * result + ((commentNo == null) ? 0 : commentNo.hashCode());
		result = prime * result + ((commentTitle == null) ? 0 : commentTitle.hashCode());
		result = prime * result + ((filePath == null) ? 0 : filePath.hashCode());
		result = prime * result + ((hostComment == null) ? 0 : hostComment.hashCode());
		result = prime * result + ((hostCommentDate == null) ? 0 : hostCommentDate.hashCode());
		long temp;
		temp = Double.doubleToLongBits(houseGrade);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((houseNo == null) ? 0 : houseNo.hashCode());
		result = prime * result + ((memberNo == null) ? 0 : memberNo.hashCode());
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
		if (commentDate == null) {
			if (other.commentDate != null)
				return false;
		} else if (!commentDate.equals(other.commentDate))
			return false;
		if (commentNo == null) {
			if (other.commentNo != null)
				return false;
		} else if (!commentNo.equals(other.commentNo))
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
		if (hostComment == null) {
			if (other.hostComment != null)
				return false;
		} else if (!hostComment.equals(other.hostComment))
			return false;
		if (hostCommentDate == null) {
			if (other.hostCommentDate != null)
				return false;
		} else if (!hostCommentDate.equals(other.hostCommentDate))
			return false;
		if (Double.doubleToLongBits(houseGrade) != Double.doubleToLongBits(other.houseGrade))
			return false;
		if (houseNo == null) {
			if (other.houseNo != null)
				return false;
		} else if (!houseNo.equals(other.houseNo))
			return false;
		if (memberNo == null) {
			if (other.memberNo != null)
				return false;
		} else if (!memberNo.equals(other.memberNo))
			return false;
		return true;
	}
	
	

	
	
	
	
	
}

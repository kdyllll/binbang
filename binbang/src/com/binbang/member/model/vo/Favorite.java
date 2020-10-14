package com.binbang.member.model.vo;

public class Favorite {

	private String folderNo;
	private String memberNo;
	private String folderName;
	private String houseNo;
	private String pictureName;
	
	public Favorite() {
		// TODO Auto-generated constructor stub
	}

	public Favorite(String folderNo, String memberNo, String folderName, String houseNo, String pictureName) {
		super();
		this.folderNo = folderNo;
		this.memberNo = memberNo;
		this.folderName = folderName;
		this.houseNo = houseNo;
		this.pictureName = pictureName;
	}

	public String getFolderNo() {
		return folderNo;
	}

	public void setFolderNo(String folderNo) {
		this.folderNo = folderNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getFolderName() {
		return folderName;
	}

	public void setFolderName(String folderName) {
		this.folderName = folderName;
	}

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public String getPictureName() {
		return pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

	@Override
	public String toString() {
		return "Favorite [folderNo=" + folderNo + ", memberNo=" + memberNo + ", folderName=" + folderName + ", houseNo="
				+ houseNo + ", pictureName=" + pictureName + "]";
	}
	
	
	
}

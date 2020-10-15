package com.binbang.member.model.vo;

import java.util.List;

public class Favorite {

	private String folderNo;
	private String memberNo;
	private String folderName;
	private String houseNo;
	private String pictureName;
	private String HouseName;
	private String HouseLocation;
	private List houseList;
	
	public Favorite() {
		// TODO Auto-generated constructor stub
	}

	public Favorite(String folderNo, String memberNo, String folderName, String houseNo, String pictureName,
			String houseName, String houseLocation, List houseList) {
		super();
		this.folderNo = folderNo;
		this.memberNo = memberNo;
		this.folderName = folderName;
		this.houseNo = houseNo;
		this.pictureName = pictureName;
		HouseName = houseName;
		HouseLocation = houseLocation;
		this.houseList = houseList;
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

	public String getHouseName() {
		return HouseName;
	}

	public void setHouseName(String houseName) {
		HouseName = houseName;
	}

	public String getHouseLocation() {
		return HouseLocation;
	}

	public void setHouseLocation(String houseLocation) {
		HouseLocation = houseLocation;
	}

	public List getHouseList() {
		return houseList;
	}

	public void setHouseList(List houseList) {
		this.houseList = houseList;
	}

	@Override
	public String toString() {
		return "Favorite [folderNo=" + folderNo + ", memberNo=" + memberNo + ", folderName=" + folderName + ", houseNo="
				+ houseNo + ", pictureName=" + pictureName + ", HouseName=" + HouseName + ", HouseLocation="
				+ HouseLocation + ", houseList=" + houseList + "]";
	}

		
	
	
}

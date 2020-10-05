package com.binbang.member.model.vo;

public class Favorite {

	private String folderNo;
	private String memberNo;
	private String folderName;
	private String houseNo;
	
	public Favorite() {
		// TODO Auto-generated constructor stub
	}

	public Favorite(String folderNo, String memberNo, String folderName, String houseNo) {
		super();
		this.folderNo = folderNo;
		this.memberNo = memberNo;
		this.folderName = folderName;
		this.houseNo = houseNo;
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

	@Override
	public String toString() {
		return "Favorite [folderNo=" + folderNo + ", memberNo=" + memberNo + ", folderName=" + folderName + ", houseNo="
				+ houseNo + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((folderName == null) ? 0 : folderName.hashCode());
		result = prime * result + ((folderNo == null) ? 0 : folderNo.hashCode());
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
		Favorite other = (Favorite) obj;
		if (folderName == null) {
			if (other.folderName != null)
				return false;
		} else if (!folderName.equals(other.folderName))
			return false;
		if (folderNo == null) {
			if (other.folderNo != null)
				return false;
		} else if (!folderNo.equals(other.folderNo))
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

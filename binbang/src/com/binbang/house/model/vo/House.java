package com.binbang.house.model.vo;

import java.util.Arrays;

public class House {
	private String houseNo;
	private String houseName;
	private String houseType;
	private String houseLocation;
	private int housePnum;
	private String pObjects;
	private int roomNum;
	private int bathNum;
	private int bedNum;
	private String houseComment;
	private String houseGemsung;
	private String phoneOption;
	private String attention;
	private String inoutTime;
	private String[] peakDay;
	private int priceDay;
	private int priceWeekend;
	private int pricePeakDay;
	private int pricePeakWeekend;
	private String[] filter;
	private String[] housePicture;
	private Object[] place;
	
	public House() {
		// TODO Auto-generated constructor stub
	}

	public House(String houseNo, String houseName, String houseType, String houseLocation, int housePnum,
			String pObjects, int roomNum, int bathNum, int bedNum, String houseComment, String houseGemsung,
			String phoneOption, String attention, String inoutTime, String[] peakDay, int priceDay, int priceWeekend,
			int pricePeakDay, int pricePeakWeekend, String[] filter, String[] housePicture, Object[] place) {
		super();
		this.houseNo = houseNo;
		this.houseName = houseName;
		this.houseType = houseType;
		this.houseLocation = houseLocation;
		this.housePnum = housePnum;
		this.pObjects = pObjects;
		this.roomNum = roomNum;
		this.bathNum = bathNum;
		this.bedNum = bedNum;
		this.houseComment = houseComment;
		this.houseGemsung = houseGemsung;
		this.phoneOption = phoneOption;
		this.attention = attention;
		this.inoutTime = inoutTime;
		this.peakDay = peakDay;
		this.priceDay = priceDay;
		this.priceWeekend = priceWeekend;
		this.pricePeakDay = pricePeakDay;
		this.pricePeakWeekend = pricePeakWeekend;
		this.filter = filter;
		this.housePicture = housePicture;
		this.place = place;
	}

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public String getHouseName() {
		return houseName;
	}

	public void setHouseName(String houseName) {
		this.houseName = houseName;
	}

	public String getHouseType() {
		return houseType;
	}

	public void setHouseType(String houseType) {
		this.houseType = houseType;
	}

	public String getHouseLocation() {
		return houseLocation;
	}

	public void setHouseLocation(String houseLocation) {
		this.houseLocation = houseLocation;
	}

	public int getHousePnum() {
		return housePnum;
	}

	public void setHousePnum(int housePnum) {
		this.housePnum = housePnum;
	}

	public String getpObjects() {
		return pObjects;
	}

	public void setpObjects(String pObjects) {
		this.pObjects = pObjects;
	}

	public int getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}

	public int getBathNum() {
		return bathNum;
	}

	public void setBathNum(int bathNum) {
		this.bathNum = bathNum;
	}

	public int getBedNum() {
		return bedNum;
	}

	public void setBedNum(int bedNum) {
		this.bedNum = bedNum;
	}

	public String getHouseComment() {
		return houseComment;
	}

	public void setHouseComment(String houseComment) {
		this.houseComment = houseComment;
	}

	public String getHouseGemsung() {
		return houseGemsung;
	}

	public void setHouseGemsung(String houseGemsung) {
		this.houseGemsung = houseGemsung;
	}

	public String getPhoneOption() {
		return phoneOption;
	}

	public void setPhoneOption(String phoneOption) {
		this.phoneOption = phoneOption;
	}

	public String getAttention() {
		return attention;
	}

	public void setAttention(String attention) {
		this.attention = attention;
	}

	public String getInoutTime() {
		return inoutTime;
	}

	public void setInoutTime(String inoutTime) {
		this.inoutTime = inoutTime;
	}

	public String[] getPeakDay() {
		return peakDay;
	}

	public void setPeakDay(String[] peakDay) {
		this.peakDay = peakDay;
	}

	public int getPriceDay() {
		return priceDay;
	}

	public void setPriceDay(int priceDay) {
		this.priceDay = priceDay;
	}

	public int getPriceWeekend() {
		return priceWeekend;
	}

	public void setPriceWeekend(int priceWeekend) {
		this.priceWeekend = priceWeekend;
	}

	public int getPricePeakDay() {
		return pricePeakDay;
	}

	public void setPricePeakDay(int pricePeakDay) {
		this.pricePeakDay = pricePeakDay;
	}

	public int getPricePeakWeekend() {
		return pricePeakWeekend;
	}

	public void setPricePeakWeekend(int pricePeakWeekend) {
		this.pricePeakWeekend = pricePeakWeekend;
	}

	public String[] getFilter() {
		return filter;
	}

	public void setFilter(String[] filter) {
		this.filter = filter;
	}

	public String[] getHousePicture() {
		return housePicture;
	}

	public void setHousePicture(String[] housePicture) {
		this.housePicture = housePicture;
	}

	public Object[] getPlace() {
		return place;
	}

	public void setPlace(Object[] place) {
		this.place = place;
	}

	@Override
	public String toString() {
		return "House [houseNo=" + houseNo + ", houseName=" + houseName + ", houseType=" + houseType
				+ ", houseLocation=" + houseLocation + ", housePnum=" + housePnum + ", pObjects=" + pObjects
				+ ", roomNum=" + roomNum + ", bathNum=" + bathNum + ", bedNum=" + bedNum + ", houseComment="
				+ houseComment + ", houseGemsung=" + houseGemsung + ", phoneOption=" + phoneOption + ", attention="
				+ attention + ", inoutTime=" + inoutTime + ", peakDay=" + Arrays.toString(peakDay) + ", priceDay="
				+ priceDay + ", priceWeekend=" + priceWeekend + ", pricePeakDay=" + pricePeakDay + ", pricePeakWeekend="
				+ pricePeakWeekend + ", filter=" + Arrays.toString(filter) + ", housePicture="
				+ Arrays.toString(housePicture) + ", place=" + Arrays.toString(place) + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((attention == null) ? 0 : attention.hashCode());
		result = prime * result + bathNum;
		result = prime * result + bedNum;
		result = prime * result + Arrays.hashCode(filter);
		result = prime * result + ((houseComment == null) ? 0 : houseComment.hashCode());
		result = prime * result + ((houseGemsung == null) ? 0 : houseGemsung.hashCode());
		result = prime * result + ((houseLocation == null) ? 0 : houseLocation.hashCode());
		result = prime * result + ((houseName == null) ? 0 : houseName.hashCode());
		result = prime * result + ((houseNo == null) ? 0 : houseNo.hashCode());
		result = prime * result + Arrays.hashCode(housePicture);
		result = prime * result + housePnum;
		result = prime * result + ((houseType == null) ? 0 : houseType.hashCode());
		result = prime * result + ((inoutTime == null) ? 0 : inoutTime.hashCode());
		result = prime * result + ((pObjects == null) ? 0 : pObjects.hashCode());
		result = prime * result + Arrays.hashCode(peakDay);
		result = prime * result + ((phoneOption == null) ? 0 : phoneOption.hashCode());
		result = prime * result + Arrays.deepHashCode(place);
		result = prime * result + priceDay;
		result = prime * result + pricePeakDay;
		result = prime * result + pricePeakWeekend;
		result = prime * result + priceWeekend;
		result = prime * result + roomNum;
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
		House other = (House) obj;
		if (attention == null) {
			if (other.attention != null)
				return false;
		} else if (!attention.equals(other.attention))
			return false;
		if (bathNum != other.bathNum)
			return false;
		if (bedNum != other.bedNum)
			return false;
		if (!Arrays.equals(filter, other.filter))
			return false;
		if (houseComment == null) {
			if (other.houseComment != null)
				return false;
		} else if (!houseComment.equals(other.houseComment))
			return false;
		if (houseGemsung == null) {
			if (other.houseGemsung != null)
				return false;
		} else if (!houseGemsung.equals(other.houseGemsung))
			return false;
		if (houseLocation == null) {
			if (other.houseLocation != null)
				return false;
		} else if (!houseLocation.equals(other.houseLocation))
			return false;
		if (houseName == null) {
			if (other.houseName != null)
				return false;
		} else if (!houseName.equals(other.houseName))
			return false;
		if (houseNo == null) {
			if (other.houseNo != null)
				return false;
		} else if (!houseNo.equals(other.houseNo))
			return false;
		if (!Arrays.equals(housePicture, other.housePicture))
			return false;
		if (housePnum != other.housePnum)
			return false;
		if (houseType == null) {
			if (other.houseType != null)
				return false;
		} else if (!houseType.equals(other.houseType))
			return false;
		if (inoutTime == null) {
			if (other.inoutTime != null)
				return false;
		} else if (!inoutTime.equals(other.inoutTime))
			return false;
		if (pObjects == null) {
			if (other.pObjects != null)
				return false;
		} else if (!pObjects.equals(other.pObjects))
			return false;
		if (!Arrays.equals(peakDay, other.peakDay))
			return false;
		if (phoneOption == null) {
			if (other.phoneOption != null)
				return false;
		} else if (!phoneOption.equals(other.phoneOption))
			return false;
		if (!Arrays.deepEquals(place, other.place))
			return false;
		if (priceDay != other.priceDay)
			return false;
		if (pricePeakDay != other.pricePeakDay)
			return false;
		if (pricePeakWeekend != other.pricePeakWeekend)
			return false;
		if (priceWeekend != other.priceWeekend)
			return false;
		if (roomNum != other.roomNum)
			return false;
		return true;
	}
	
	
	

}

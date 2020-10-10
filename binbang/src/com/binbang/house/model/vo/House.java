package com.binbang.house.model.vo;

import java.util.Arrays;
import java.util.List;

public class House {
	private String houseNo;
	private String hostNo;
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
	private String attention;
	private String inoutTime;
	private List peakDay1;
	private List peakDay2;
	private List peakDay3;
	private List peakDay4;
	private List peakDay5;
	private List totalPeak;
	private int priceDay;
	private int priceWeekend;
	private int pricePeakDay;
	private int pricePeakWeekend;
	private int totalPrice;
	private List filter;
	private String[] housePicture;
	private Double avgGrade;
	private String houseMainPic;



	public House() {
		// TODO Auto-generated constructor stub
	}


	public House(String houseNo, String hostNo, String houseName, String houseType, String houseLocation, int housePnum,
			String pObjects, int roomNum, int bathNum, int bedNum, String houseComment, String houseGemsung,
			String attention, String inoutTime, List peakDay1, List peakDay2, List peakDay3, List peakDay4,
			List peakDay5, List totalPeak, int priceDay, int priceWeekend, int pricePeakDay, int pricePeakWeekend,
			int totalPrice, List filter, String[] housePicture, Double avgGrade, String houseMainPic) {
		super();
		this.houseNo = houseNo;
		this.hostNo = hostNo;
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
		this.attention = attention;
		this.inoutTime = inoutTime;
		this.peakDay1 = peakDay1;
		this.peakDay2 = peakDay2;
		this.peakDay3 = peakDay3;
		this.peakDay4 = peakDay4;
		this.peakDay5 = peakDay5;
		this.totalPeak = totalPeak;
		this.priceDay = priceDay;
		this.priceWeekend = priceWeekend;
		this.pricePeakDay = pricePeakDay;
		this.pricePeakWeekend = pricePeakWeekend;
		this.totalPrice = totalPrice;
		this.filter = filter;
		this.housePicture = housePicture;
		this.avgGrade = avgGrade;
		this.houseMainPic = houseMainPic;
	}

	

	public String getHouseMainPic() {
		return houseMainPic;
	}


	public void setHouseMainPic(String houseMainPic) {
		this.houseMainPic = houseMainPic;
	}


	public String getHouseNo() {
		return houseNo;
	}



	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}



	public String getHostNo() {
		return hostNo;
	}



	public void setHostNo(String hostNo) {
		this.hostNo = hostNo;
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



	public List getPeakDay1() {
		return peakDay1;
	}



	public void setPeakDay1(List peakDay1) {
		this.peakDay1 = peakDay1;
	}



	public List getPeakDay2() {
		return peakDay2;
	}



	public void setPeakDay2(List peakDay2) {
		this.peakDay2 = peakDay2;
	}



	public List getPeakDay3() {
		return peakDay3;
	}



	public void setPeakDay3(List peakDay3) {
		this.peakDay3 = peakDay3;
	}



	public List getPeakDay4() {
		return peakDay4;
	}



	public void setPeakDay4(List peakDay4) {
		this.peakDay4 = peakDay4;
	}



	public List getPeakDay5() {
		return peakDay5;
	}



	public void setPeakDay5(List peakDay5) {
		this.peakDay5 = peakDay5;
	}



	public List getTotalPeak() {
		return totalPeak;
	}



	public void setTotalPeak(List totalPeak) {
		this.totalPeak = totalPeak;
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



	public int getTotalPrice() {
		return totalPrice;
	}



	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}



	public List getFilter() {
		return filter;
	}



	public void setFilter(List filter) {
		this.filter = filter;
	}



	public String[] getHousePicture() {
		return housePicture;
	}



	public void setHousePicture(String[] housePicture) {
		this.housePicture = housePicture;
	}



	public Double getAvgGrade() {
		return avgGrade;
	}



	public void setAvgGrade(Double avgGrade) {
		this.avgGrade = avgGrade;
	}



	@Override
	public String toString() {
		return "House [houseNo=" + houseNo + ", hostNo=" + hostNo + ", houseName=" + houseName + ", houseType="
				+ houseType + ", houseLocation=" + houseLocation + ", housePnum=" + housePnum + ", pObjects=" + pObjects
				+ ", roomNum=" + roomNum + ", bathNum=" + bathNum + ", bedNum=" + bedNum + ", houseComment="
				+ houseComment + ", houseGemsung=" + houseGemsung + ", attention=" + attention + ", inoutTime="
				+ inoutTime + ", peakDay1=" + peakDay1 + ", peakDay2=" + peakDay2 + ", peakDay3=" + peakDay3
				+ ", peakDay4=" + peakDay4 + ", peakDay5=" + peakDay5 + ", totalPeak=" + totalPeak + ", priceDay="
				+ priceDay + ", priceWeekend=" + priceWeekend + ", pricePeakDay=" + pricePeakDay + ", pricePeakWeekend="
				+ pricePeakWeekend + ", totalPrice=" + totalPrice + ", filter=" + filter + ", housePicture="
				+ Arrays.toString(housePicture) + ", avgGrade=" + avgGrade + ", houseMainPic=" + houseMainPic + "]";
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((attention == null) ? 0 : attention.hashCode());
		result = prime * result + ((avgGrade == null) ? 0 : avgGrade.hashCode());
		result = prime * result + bathNum;
		result = prime * result + bedNum;
		result = prime * result + ((filter == null) ? 0 : filter.hashCode());
		result = prime * result + ((hostNo == null) ? 0 : hostNo.hashCode());
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
		result = prime * result + ((peakDay1 == null) ? 0 : peakDay1.hashCode());
		result = prime * result + ((peakDay2 == null) ? 0 : peakDay2.hashCode());
		result = prime * result + ((peakDay3 == null) ? 0 : peakDay3.hashCode());
		result = prime * result + ((peakDay4 == null) ? 0 : peakDay4.hashCode());
		result = prime * result + ((peakDay5 == null) ? 0 : peakDay5.hashCode());
		result = prime * result + priceDay;
		result = prime * result + pricePeakDay;
		result = prime * result + pricePeakWeekend;
		result = prime * result + priceWeekend;
		result = prime * result + roomNum;
		result = prime * result + ((totalPeak == null) ? 0 : totalPeak.hashCode());
		result = prime * result + totalPrice;
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
		if (avgGrade == null) {
			if (other.avgGrade != null)
				return false;
		} else if (!avgGrade.equals(other.avgGrade))
			return false;
		if (bathNum != other.bathNum)
			return false;
		if (bedNum != other.bedNum)
			return false;
		if (filter == null) {
			if (other.filter != null)
				return false;
		} else if (!filter.equals(other.filter))
			return false;
		if (hostNo == null) {
			if (other.hostNo != null)
				return false;
		} else if (!hostNo.equals(other.hostNo))
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
		if (peakDay1 == null) {
			if (other.peakDay1 != null)
				return false;
		} else if (!peakDay1.equals(other.peakDay1))
			return false;
		if (peakDay2 == null) {
			if (other.peakDay2 != null)
				return false;
		} else if (!peakDay2.equals(other.peakDay2))
			return false;
		if (peakDay3 == null) {
			if (other.peakDay3 != null)
				return false;
		} else if (!peakDay3.equals(other.peakDay3))
			return false;
		if (peakDay4 == null) {
			if (other.peakDay4 != null)
				return false;
		} else if (!peakDay4.equals(other.peakDay4))
			return false;
		if (peakDay5 == null) {
			if (other.peakDay5 != null)
				return false;
		} else if (!peakDay5.equals(other.peakDay5))
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
		if (totalPeak == null) {
			if (other.totalPeak != null)
				return false;
		} else if (!totalPeak.equals(other.totalPeak))
			return false;
		if (totalPrice != other.totalPrice)
			return false;
		return true;
	}



}

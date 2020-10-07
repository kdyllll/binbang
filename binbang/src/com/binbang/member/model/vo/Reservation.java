package com.binbang.member.model.vo;

import java.util.Date;

public class Reservation {
	
	private String reservationNo;
	private String memberNo;
	private String houseNo;
	private String guestName;
	private Date checkinDate;
	private Date checkoutDate;
	private int guestPnum;
	private String paymentOption;
	private String houseRequest;
	private Date approvalDate;
	private int price;
	private Date reservDate;
	
	public Reservation() {
		// TODO Auto-generated constructor stub
	}

	public Reservation(String reservationNo, String memberNo, String houseNo, String guestName, Date checkinDate,
			Date checkoutDate, int guestPnum, String paymentOption, String houseRequest, Date approvalDate, int price,
			Date reservDate) {
		super();
		this.reservationNo = reservationNo;
		this.memberNo = memberNo;
		this.houseNo = houseNo;
		this.guestName = guestName;
		this.checkinDate = checkinDate;
		this.checkoutDate = checkoutDate;
		this.guestPnum = guestPnum;
		this.paymentOption = paymentOption;
		this.houseRequest = houseRequest;
		this.approvalDate = approvalDate;
		this.price = price;
		this.reservDate = reservDate;
	}

	public String getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(String reservationNo) {
		this.reservationNo = reservationNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getHouseNo() {
		return houseNo;
	}

	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}

	public String getGuestName() {
		return guestName;
	}

	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}

	public Date getCheckinDate() {
		return checkinDate;
	}

	public void setCheckinDate(Date checkinDate) {
		this.checkinDate = checkinDate;
	}

	public Date getCheckoutDate() {
		return checkoutDate;
	}

	public void setCheckoutDate(Date checkoutDate) {
		this.checkoutDate = checkoutDate;
	}

	public int getGuestPnum() {
		return guestPnum;
	}

	public void setGuestPnum(int guestPnum) {
		this.guestPnum = guestPnum;
	}

	public String getPaymentOption() {
		return paymentOption;
	}

	public void setPaymentOption(String paymentOption) {
		this.paymentOption = paymentOption;
	}

	public String getHouseRequest() {
		return houseRequest;
	}

	public void setHouseRequest(String houseRequest) {
		this.houseRequest = houseRequest;
	}

	public Date getApprovalDate() {
		return approvalDate;
	}

	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getReservDate() {
		return reservDate;
	}

	public void setReservDate(Date reservDate) {
		this.reservDate = reservDate;
	}

	@Override
	public String toString() {
		return "Reservation [reservationNo=" + reservationNo + ", memberNo=" + memberNo + ", houseNo=" + houseNo
				+ ", guestName=" + guestName + ", checkinDate=" + checkinDate + ", checkoutDate=" + checkoutDate
				+ ", guestPnum=" + guestPnum + ", paymentOption=" + paymentOption + ", houseRequest=" + houseRequest
				+ ", approvalDate=" + approvalDate + ", price=" + price + ", reservDate=" + reservDate + "]";
	}
	
	
	

}

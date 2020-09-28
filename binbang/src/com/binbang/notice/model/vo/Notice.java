package com.binbang.notice.model.vo;

import java.util.Date;

public class Notice {
	
	private String noticeNo;
	private String noticeCategory;
	private String noticeTitle;
	private Date noticeDate;
	private long noticeContents;

	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(String noticeNo, String noticeCategory, String noticeTitle, Date noticeDate, long noticeContents) {
		super();
		this.noticeNo = noticeNo;
		this.noticeCategory = noticeCategory;
		this.noticeTitle = noticeTitle;
		this.noticeDate = noticeDate;
		this.noticeContents = noticeContents;
	}

	public String getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeCategory() {
		return noticeCategory;
	}

	public void setNoticeCategory(String noticeCategory) {
		this.noticeCategory = noticeCategory;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public long getNoticeContents() {
		return noticeContents;
	}

	public void setNoticeContents(long noticeContents) {
		this.noticeContents = noticeContents;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeCategory=" + noticeCategory + ", noticeTitle=" + noticeTitle
				+ ", noticeDate=" + noticeDate + ", noticeContents=" + noticeContents + "]";
	}
	
	
}

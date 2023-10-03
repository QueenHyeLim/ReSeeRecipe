package com.kh.semi.heart.model.vo;

import java.sql.Date;

public class NoticeHeart {
	
	private int memNo; //MEM_NO	NUMBER 회원PK
	private int noticeNo; //NOTICE_NO	NUMBER 공지사항글PK
	private Date noticeHtDate; //HT_NOTICE_DATE	DATE 좋아요 누른 날짜
	
	public NoticeHeart() {
		super();
	}

	public NoticeHeart(int memNo, int noticeNo, Date noticeHtDate) {
		super();
		this.memNo = memNo;
		this.noticeNo = noticeNo;
		this.noticeHtDate = noticeHtDate;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public Date getNoticeHtDate() {
		return noticeHtDate;
	}

	public void setNoticeHtDate(Date noticeHtDate) {
		this.noticeHtDate = noticeHtDate;
	}

	@Override
	public String toString() {
		return "NoticeHeart [memNo=" + memNo + ", noticeNo=" + noticeNo + ", noticeHtDate=" + noticeHtDate + "]";
	}
	
}

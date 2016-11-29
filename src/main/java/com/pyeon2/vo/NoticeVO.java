package com.pyeon2.vo;

import com.pyeon2.domain.Criteria;

public class NoticeVO {
	
	int noticenum;
	String title,name,position,contant,noticedate;
	private Criteria cri;
	
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	public int getNoticenum() {
		return noticenum;
	}
	public void setNoticenum(int noticenum) {
		this.noticenum = noticenum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getContant() {
		return contant;
	}
	public void setContant(String contant) {
		this.contant = contant;
	}
	public String getNoticedate() {
		return noticedate;
	}
	public void setNoticedate(String noticedate) {
		this.noticedate = noticedate;
	}
}

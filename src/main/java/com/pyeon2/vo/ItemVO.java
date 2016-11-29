package com.pyeon2.vo;

import java.util.Date;

import com.pyeon2.domain.Criteria;

public class ItemVO {
	private int bno;
	private String id;
	private String item_code;
	private String item_name;
	private String item_image;
	private int price;
	private int count;
	private int hit;
	private String category;
	private String area;
	private String p2_time;
	private int pay;
	private int total;
	private String sold;
	private String sal_time;
	private Criteria cri;
	private String state;
	private int totalPrice;
	
	private Date dayda;
	private Date sys_time;
	private String spend_date;
	private String spend;
	private String title;
	private String content;
	private int paynum;
	private String year;
	private String month;
	private String days;
	private int num;

	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public String getState() {
		return state;
	}
	public Date getDayda() {
		return dayda;
	}
	public void setDayda(Date dayda) {
		this.dayda = dayda;
	}
	public Date getSys_time() {
		return sys_time;
	}
	public void setSys_time(Date sys_time) {
		this.sys_time = sys_time;
	}
	public String getSpend_date() {
		return spend_date;
	}
	public void setSpend_date(String spend_date) {
		this.spend_date = spend_date;
	}
	public String getSpend() {
		return spend;
	}
	public void setSpend(String spend) {
		this.spend = spend;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPaynum() {
		return paynum;
	}
	public void setPaynum(int paynum) {
		this.paynum = paynum;
	}
	public void setState(String state) {
		this.state = state;
	}

	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getItem_code() {
		return item_code;
	}
	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_image() {
		return item_image;
	}
	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getP2_time() {
		return p2_time;
	}
	public void setP2_time(String p2_time) {
		this.p2_time = p2_time;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getSold() {
		return sold;
	}
	public void setSold(String sold) {
		this.sold = sold;
	}
	public String getSal_time() {
		return sal_time;
	}
	public void setSal_time(String sal_time) {
		this.sal_time = sal_time;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}

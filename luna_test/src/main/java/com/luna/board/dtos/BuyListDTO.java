package com.luna.board.dtos;

import java.util.Date;

public class BuyListDTO {
	private int bseq;
	private String id;
	private Date buyDate;
	private String trackingNum;
	private String delStatus;
	private String name;
	private String phone;
	private String address;
	private int totalPrice;
	
	
	public BuyListDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getBseq() {
		return bseq;
	}

	public void setBseq(int bseq) {
		this.bseq = bseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public String getTrackingNum() {
		return trackingNum;
	}

	public void setTrackingNum(String trackingNum) {
		this.trackingNum = trackingNum;
	}

	public String getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(String delStatus) {
		this.delStatus = delStatus;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public BuyListDTO(int bseq, String id, Date buyDate, String trackingNum, String delStatus, String name,
			String phone, String address, int totalPrice) {
		super();
		this.bseq = bseq;
		this.id = id;
		this.buyDate = buyDate;
		this.trackingNum = trackingNum;
		this.delStatus = delStatus;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.totalPrice = totalPrice;
	}
	
	
}

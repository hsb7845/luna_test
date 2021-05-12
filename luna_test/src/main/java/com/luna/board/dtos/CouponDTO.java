package com.luna.board.dtos;

public class CouponDTO {
//	"CSEQ" NUMBER(*,0) NOT NULL ENABLE, 
//	"CCONTENT" VARCHAR2(400), 
//	"DISCOUNT" NUMBER, 
//	"ID" VARCHAR2(20), 
	private int cseq;
	private String ccontent;
	private int discount;
	private String id;
	private int hit;
	
	public CouponDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CouponDTO(int cseq, String ccontent, int discount, String id, int hit) {
		super();
		this.cseq = cseq;
		this.ccontent = ccontent;
		this.discount = discount;
		this.id = id;
		this.hit = hit;
	}

	public int getCseq() {
		return cseq;
	}

	public void setCseq(int cseq) {
		this.cseq = cseq;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "CouponDTO [cseq=" + cseq + ", ccontent=" + ccontent + ", discount=" + discount + ", id=" + id + ", hit="
				+ hit + "]";
	}

}

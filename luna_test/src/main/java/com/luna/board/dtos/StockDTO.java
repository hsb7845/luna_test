package com.luna.board.dtos;

public class StockDTO {
//	"PNUM" NUMBER(38,0) NOT NULL ENABLE, 
//	"PNAME" VARCHAR2(100), 
//	"SCOUNT" NUMBER(38,0), 
//	"COST" NUMBER(38,0), 
//	"CNUM" NUMBER(38,0), 
//	"PCONTENT" VARCHAR2(100), 
//	"PRICE" NUMBER(38,0), 
//	"PSEQ" NUMBER(38,0), 
	private int pnum;
	private String pname;
	private int scount;
	private int cost;
	private int cnum;
	private String pcontent;
	private int price;
	private int pseq;
	private String main;
	
	
	public String getMain() {
		return main;
	}

	public void setMain(String main) {
		this.main = main;
	}

	public StockDTO() {
		super();
		// TODO Auto-generated constructor stub
	}	

	public StockDTO(int pnum, String pname, int scount, int cost, int cnum, String pcontent, int price, int pseq) {
		super();
		this.pnum = pnum;
		this.pname = pname;
		this.scount = scount;
		this.cost = cost;
		this.cnum = cnum;
		this.pcontent = pcontent;
		this.price = price;
		this.pseq = pseq;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getScount() {
		return scount;
	}

	public void setScount(int scount) {
		this.scount = scount;
	}

	public int getCost() {
		return cost;
	}

	public void setCost(int cost) {
		this.cost = cost;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}	

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	@Override
	public String toString() {
		return "StockDTO [pnum=" + pnum + ", pname=" + pname + ", scount=" + scount + ", cost=" + cost + ", cnum="
				+ cnum + ", pcontent=" + pcontent + ", price=" + price + ", pseq=" + pseq + "]";
	}
	
	

}

package com.luna.board.dtos;

public class BuyDetailDTO {
	private int bdseq;
	private int pnum;
	private int pcount;
	private int bseq;
	
	
	@Override
	public String toString() {
		return "BuyDetailDTO [bdseq=" + bdseq + ", pnum=" + pnum + ", pcount=" + pcount + ", bseq=" + bseq + "]";
	}
	public BuyDetailDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BuyDetailDTO(int bdseq, int pnum, int pcount, int bseq) {
		super();
		this.bdseq = bdseq;
		this.pnum = pnum;
		this.pcount = pcount;
		this.bseq = bseq;
	}
	public int getBdseq() {
		return bdseq;
	}
	public void setBdseq(int bdseq) {
		this.bdseq = bdseq;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public int getBseq() {
		return bseq;
	}
	public void setBseq(int bseq) {
		this.bseq = bseq;
	}
	
}

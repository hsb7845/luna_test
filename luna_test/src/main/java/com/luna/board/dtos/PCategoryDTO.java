package com.luna.board.dtos;

public class PCategoryDTO {

	private int cnum;
	private String ptype;
	private String pcolor;
	private String psize;
	
	
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getPtype() {
		return ptype;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public String getPcolor() {
		return pcolor;
	}
	public void setPcolor(String pcolor) {
		this.pcolor = pcolor;
	}
	public String getPsize() {
		return psize;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	
	
	public PCategoryDTO(int cnum, String ptype, String pcolor, String psize) {
		super();
		this.cnum = cnum;
		this.ptype = ptype;
		this.pcolor = pcolor;
		this.psize = psize;
	}
	
	
	@Override
	public String toString() {
		return "PCategoryDTO [cnum=" + cnum + ", ptype=" + ptype + ", pcolor=" + pcolor + ", psize=" + psize + "]";
	}
	
	
	public PCategoryDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public static int insert(PCategoryDTO cdto) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	
}

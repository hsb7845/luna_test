package com.luna.board.dtos;

public class POptionDTO {
	private int oseq;
	private int pseq;
	private String necessary;
	private String otitle;
	private String ocontent;
	private String[] oconArr;
	private String[] ovalArr;
	private String ovalue;
	public String[] getOconArr() {
		return oconArr;
	}
	public void setOconArr(String[] oconArr) {
		this.oconArr = oconArr;
	}
	public String[] getOvalArr() {
		return ovalArr;
	}
	public void setOvalArr(String[] ovalArr) {
		this.ovalArr = ovalArr;
	}
	
	
	public String getOvalue() {
		return ovalue;
	}
	public void setOvalue(String ovalue) {
		this.ovalue = ovalue;
	}
	public int getOseq() {
		return oseq;
	}
	public void setOseq(int oseq) {
		this.oseq = oseq;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getOtitle() {
		return otitle;
	}
	public void setOtitle(String otitle) {
		this.otitle = otitle;
	}
	public String getOcontent() {
		return ocontent;
	}
	public void setOcontent(String ocontent) {
		this.ocontent = ocontent;
	}
	
	
	@Override
	public String toString() {
		return "POptionDTO [oseq=" + oseq + ", pseq=" + pseq + ", otitle=" + otitle + ", ocontent=" + ocontent
				+ ", ovalue=" + ovalue + "]";
	}
	public POptionDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getNecessary() {
		return necessary;
	}
	public void setNecessary(String necessary) {
		this.necessary = necessary;
	}
	
	
	
	
	
}
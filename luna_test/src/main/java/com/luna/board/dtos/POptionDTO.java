package com.luna.board.dtos;

public class POptionDTO {
	private int oseq;
	private int pseq;
	private String otitle;
	private String ocontent;
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
		return "POptionDTO [oseq=" + oseq + ", pseq=" + pseq + ", otitle=" + otitle + ", ocontent=" + ocontent + "]";
	}
	public POptionDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
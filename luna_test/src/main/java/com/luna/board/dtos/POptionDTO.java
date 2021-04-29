package com.luna.board.dtos;

public class POptionDTO {
	private int qseq;
	private int pseq;
	private String otitle;
	private String ocontent;
	
	
	
	
	
	@Override
	public String toString() {
		return "POptionDTO [qseq=" + qseq + ", pseq=" + pseq + ", otitle=" + otitle + ", ocontent=" + ocontent + "]";
	}
	public POptionDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getQseq() {
		return qseq;
	}
	public void setQseq(int qseq) {
		this.qseq = qseq;
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
	
	
	
	
}

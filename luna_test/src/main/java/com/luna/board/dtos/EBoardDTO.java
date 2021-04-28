package com.luna.board.dtos;

public class EBoardDTO {
	private int eseq;
	private String econtent;
	private String etitle;
	public int getEseq() {
		return eseq;
	}
	
	
	public void setEseq(int eseq) {
		this.eseq = eseq;
	}
	public String getEcontent() {
		return econtent;
	}
	public void setEcontent(String econtent) {
		this.econtent = econtent;
	}
	public String getEtitle() {
		return etitle;
	}
	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}
	
	
	
	public EBoardDTO(int eseq, String econtent, String etitle) {
		super();
		this.eseq = eseq;
		this.econtent = econtent;
		this.etitle = etitle;
	}
	
	
	
	public EBoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	@Override
	public String toString() {
		return "EBoardDTO [eseq=" + eseq + ", econtent=" + econtent + ", etitle=" + etitle + "]";
	}
	
}

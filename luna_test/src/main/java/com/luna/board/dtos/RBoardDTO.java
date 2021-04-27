package com.luna.board.dtos;

public class RBoardDTO {
	private int rseq;
	private String rtitle;
	private String rcontent;
	private int pseq;
	private String id;
	private int par_rseq;
	
	
	public RBoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public RBoardDTO(int rseq, String rtitle, String rcontent, int pseq, String id, int par_rseq) {
		super();
		this.rseq = rseq;
		this.rtitle = rtitle;
		this.rcontent = rcontent;
		this.pseq = pseq;
		this.id = id;
		this.par_rseq = par_rseq;
	}
	
	
	public int getRseq() {
		return rseq;
	}
	public void setRseq(int rseq) {
		this.rseq = rseq;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPar_rseq() {
		return par_rseq;
	}
	public void setPar_rseq(int par_rseq) {
		this.par_rseq = par_rseq;
	}
	
	
	@Override
	public String toString() {
		return "RBoardDTO [rseq=" + rseq + ", rtitle=" + rtitle + ", rcontent=" + rcontent + ", pseq=" + pseq + ", id="
				+ id + ", par_rseq=" + par_rseq + "]";
	}
	
}
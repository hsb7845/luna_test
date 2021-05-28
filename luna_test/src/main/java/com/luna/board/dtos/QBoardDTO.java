package com.luna.board.dtos;

public class QBoardDTO {

	private int qseq;
	private String qtitle;
	private String qcontent;
	private int pseq;
	private String id;
	private int par_qseq;
	private int level;
	
	
	public int getQseq() {
		return qseq;
	}
	public void setQseq(int qseq) {
		this.qseq = qseq;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
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
	public int getPar_qseq() {
		return par_qseq;
	}
	public void setPar_qseq(int par_qseq) {
		this.par_qseq = par_qseq;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	
	public QBoardDTO() {
		super();
	}
	
	
	public QBoardDTO(int qseq, String qtitle, String qcontent, int pseq, String id, int par_rseq,  int level) {
		super();
		this.qseq = qseq;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.pseq = pseq;
		this.id = id;
		this.par_qseq = par_qseq;
		this.level = level;
	}
	
	
	public QBoardDTO(String id) {
		this.id = id;
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "QBoardDTO [qseq=" + qseq + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", pseq=" + pseq + ", id="
				+ id + ", par_qseq=" + par_qseq + ", level=" + level + "]";
	}
	
}

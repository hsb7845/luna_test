package com.luna.board.dtos;

public class CartDTO {
//	"SEQ" NUMBER(38,0) NOT NULL ENABLE, 
//	"ID" VARCHAR2(100), 
//	"PSEQ" NUMBER(38,0), 
//	"PCOUNT" NUMBER(38,0), 
	private int seq;
	private String id;
	private int pseq;
	private int pcount;
	
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartDTO(int seq, String id, int pseq, int pcount) {
		super();
		this.seq = seq;
		this.id = id;
		this.pseq = pseq;
		this.pcount = pcount;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPseq() {
		return pseq;
	}

	public void setPseq(int pseq) {
		this.pseq = pseq;
	}

	public int getPcount() {
		return pcount;
	}

	public void setPcount(int pcount) {
		this.pcount = pcount;
	}

	@Override
	public String toString() {
		return "CartDTO [seq=" + seq + ", id=" + id + ", pseq=" + pseq + ", pcount=" + pcount + "]";
	}
	
	
	
	

}
